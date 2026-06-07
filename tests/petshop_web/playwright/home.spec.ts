import { expect, test } from '@playwright/test';

test('renders the generated Petshop home screen', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByText('Petshop')).toBeVisible();
    await expect(page.getByText('Capabilities')).toBeVisible();
});
