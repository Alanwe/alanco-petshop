class WorkspaceService:
    app_name = 'Petshop'
    problem_statement = (
        'Alanco needs a searchable pet adoption portal with pet profiles, adoption '
        'enquiries, staff listing management, and probeable runtime routes.'
    )
    capabilities = (
        '- Browse and filter adoptable pets - View pet profiles - Submit adoption '
        'enquiries - Manage listing status - Expose health and catalogue endpoints'
    )
    _products = [
        {'id': 'dog-starter', 'petType': 'dog', 'name': 'Dog starter kit'},
        {'id': 'cat-comfort', 'petType': 'cat', 'name': 'Cat comfort bundle'},
        {'id': 'bird-care', 'petType': 'bird', 'name': 'Bird care essentials'},
    ]
    _articles = [
        {'id': 'feeding', 'title': 'Healthy feeding routines'},
        {'id': 'enrichment', 'title': 'Daily enrichment ideas'},
    ]

    def health(self) -> dict[str, str]:
        return {'status': 'healthy', 'app': self.app_name}

    def products(self) -> list[dict[str, str]]:
        return list(self._products)

    def articles(self) -> list[dict[str, str]]:
        return list(self._articles)

    def home_html(self) -> str:
        product_items = ''.join(f'<li>{item["name"]}</li>' for item in self._products)
        article_items = ''.join(f'<li>{item["title"]}</li>' for item in self._articles)
        return (
            '<!doctype html><html><head><title>'
            + self.app_name
            + '</title></head><body><main><h1>'
            + self.app_name
            + '</h1><p>Pet supplies and care articles.</p>'
            + '<h2>Products</h2><ul>'
            + product_items
            + '</ul><h2>Articles</h2><ul>'
            + article_items
            + '</ul></main></body></html>'
        )
