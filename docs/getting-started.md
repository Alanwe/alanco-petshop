# Getting Started with Petshop

Alanco needs a searchable pet adoption portal with pet profiles, adoption enquiries, staff listing management, and probeable runtime routes.

## Prerequisites

- Python 3.12+
- `uv` (https://docs.astral.sh/uv/)
- Flutter (for the web frontend)
- An Azure subscription for dev deployment

## 1. Clone and install

```powershell
git clone <repo-url>
cd petshop
uv sync
copy .env.example .env  # then fill in values
```

## 2. Run tests

```powershell
uv run pytest
uv run ruff check src/ tests/
```

## 3. Run the API locally

```powershell
uv run uvicorn petshop_api.main:app --reload
```

API will be at https://petshop-api.greenisland-6bb8b77b.uksouth.azurecontainerapps.io once deployed; locally it serves on http://127.0.0.1:8000.

## 4. Run the web app

```powershell
cd apps/petshop_web
flutter run -d chrome
```

## 5. Deploy to dev

See `docs/generated/petshop-runbook.md` and `infra/petshop/`.

## More documentation

- Product requirements: `PRD/petshop-prd.md`
- Architecture: `docs/generated/petshop-architecture.md`
- Overview: `docs/generated/petshop-overview.md`
- Agent instructions: `.github/copilot-instructions.md`
