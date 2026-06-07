from fastapi.testclient import TestClient

from petshop_api.main import create_app


def test_health() -> None:
    client = TestClient(create_app())
    response = client.get('/health')
    assert response.status_code == 200
    assert response.json()['status'] == 'healthy'


def test_home_renders_products_and_articles() -> None:
    client = TestClient(create_app())
    response = client.get('/')
    assert response.status_code == 200
    assert 'Products' in response.text
    assert 'Articles' in response.text


def test_product_and_article_apis() -> None:
    client = TestClient(create_app())
    products = client.get('/api/products')
    articles = client.get('/api/articles')
    assert products.status_code == 200
    assert articles.status_code == 200
    assert products.json()['items']
    assert articles.json()['items']
