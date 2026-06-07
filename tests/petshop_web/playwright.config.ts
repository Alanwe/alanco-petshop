import { defineConfig } from '@playwright/test';

export default defineConfig({
    testDir: './playwright',
    use: {
        baseURL: process.env.PLAYWRIGHT_BASE_URL ?? 'http://127.0.0.1:8080',
    },
    webServer: {
        command: 'flutter run -d web-server --web-port 8080',
        url: 'http://127.0.0.1:8080',
        reuseExistingServer: true,
        timeout: 120_000,
        cwd: '../../apps/petshop_web',
    },
});
