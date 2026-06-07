terraform {
  required_version = ">= 1.6.0"

    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 3.116"
        }
    }
}

provider "azurerm" {
    features {}
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "app_name" {
    type    = string
    default = "petshop"
}

locals {
    safe_name        = lower(replace(var.app_name, "_", "-"))
    resource_group   = "rg-${local.safe_name}-dev"
    log_workspace    = substr("law-${local.safe_name}-dev", 0, 63)
    container_env    = substr("cae-${local.safe_name}-dev", 0, 32)
    container_app    = substr("${local.safe_name}-api", 0, 32)
    runtime_response = jsonencode({
        status = "healthy"
        app    = var.app_name
    })
    runtime_script = <<PY
import json
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

class Handler(BaseHTTPRequestHandler):
        def do_GET(self):
                body = '{"status": "healthy", "app": "petshop"}'.encode()
                self.send_response(200)
                self.send_header('Content-Type', 'application/json')
                self.send_header('Content-Length', str(len(body)))
                self.end_headers()
                self.wfile.write(body)

        def log_message(self, format, *args):
                return

ThreadingHTTPServer(('0.0.0.0', 8000), Handler).serve_forever()
PY
}

resource "azurerm_resource_group" "dev" {
    name     = local.resource_group
    location = var.location
}

resource "azurerm_log_analytics_workspace" "dev" {
    name                = local.log_workspace
    location            = azurerm_resource_group.dev.location
    resource_group_name = azurerm_resource_group.dev.name
    sku                 = "PerGB2018"
    retention_in_days   = 30
}

resource "azurerm_container_app_environment" "dev" {
    name                       = local.container_env
    location                   = azurerm_resource_group.dev.location
    resource_group_name        = azurerm_resource_group.dev.name
    log_analytics_workspace_id = azurerm_log_analytics_workspace.dev.id
}

resource "azurerm_container_app" "api" {
    name                         = local.container_app
    container_app_environment_id = azurerm_container_app_environment.dev.id
    resource_group_name          = azurerm_resource_group.dev.name
    revision_mode                = "Single"

    ingress {
        external_enabled = true
        target_port      = 8000
        traffic_weight {
            latest_revision = true
            percentage      = 100
        }
    }

    template {
        min_replicas = 1
        max_replicas = 1
        container {
            name    = "api"
            image   = "python:3.12-slim"
            command = ["python", "-c", local.runtime_script]
            cpu     = 0.25
            memory  = "0.5Gi"
        }
    }
}

output "api_url" {
    value = "https://${azurerm_container_app.api.latest_revision_fqdn}"
}
