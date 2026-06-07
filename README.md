# Petshop

Alanco needs a searchable pet adoption portal with pet profiles, adoption enquiries, staff listing management, and probeable runtime routes.

**Archetype:** Customer Service Portal

## Capabilities
- Browse and filter adoptable pets
- View pet profiles
- Submit adoption enquiries
- Manage listing status
- Expose health and catalogue endpoints

## Non-functional Requirements
- HTTP probes must return 200 for health and catalogue routes
- Small reviewable MVP
- Automated tests and CI
- No secrets in repo

## Getting Started

See [docs/getting-started.md](docs/getting-started.md) for prerequisites,
local setup, running tests, and deploying to dev.

## Repository Layout

- `src/` — application source (backend API + shared modules)
- `apps/` — frontend apps (Flutter web)
- `tests/` — unit, integration, and e2e tests
- `infra/` — Terraform / Bicep for Azure provisioning
- `docs/` — human + agent documentation (start at `docs/README.md`)
- `.github/` — workflows, PR templates, agent instructions

## Documentation Index

- [Getting Started](docs/getting-started.md)
- [Product Requirements](PRD/)
- [Architecture](docs/architecture/overview.md)
- [Operations Runbook](docs/operations/runbook.md)
- [Agent Instructions](.github/copilot-instructions.md)
