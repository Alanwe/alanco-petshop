from fastapi import FastAPI, Response

from petshop_api.services.workspace_service import WorkspaceService


def create_app() -> FastAPI:
    app = FastAPI(title='Petshop API')
    service = WorkspaceService()

    @app.get('/health')
    def health() -> dict[str, str]:
        return service.health()

    @app.get('/')
    def home() -> Response:
        return Response(service.home_html(), media_type='text/html')

    @app.get('/api/products')
    def products() -> dict[str, object]:
        return {'items': service.products()}

    @app.get('/api/articles')
    def articles() -> dict[str, object]:
        return {'items': service.articles()}

    return app


app = create_app()
