# Cloudflare Pages deployment

The application is a static Flutter web demo. No database, backend, or paid
Cloudflare features are required. Vouchers remain local to the browser session.

## Configuration

- Project name: `spx-express-demo`.
- Output directory: `build/web`.
- Configuration: `wrangler.jsonc`.
- Public URL: https://spx-express-demo.pages.dev
- Deployment URL: https://f2d572e1.spx-express-demo.pages.dev
- Deployment status: published on 2026-11-08. Public HTML, bootstrap, application JS,
  asset manifest and icon font verified with HTTP 200 responses.

## First deployment

1. Run `npx --yes wrangler login` and complete the browser login.
2. If creating a new Pages project, run `npx --yes wrangler pages project create YOUR_PROJECT_NAME --production-branch main --force`. The configured project already exists; skip this step for updates.
3. Run `powershell -ExecutionPolicy Bypass -File scripts/deploy-web.ps1`.

The deployment command prints the actual public deployment URL. Use that returned
URL rather than assuming the requested project name is available.

## Subsequent updates

Run `powershell -ExecutionPolicy Bypass -File scripts/deploy-web.ps1`.
For a different project name, append `-ProjectName YOUR_PROJECT_NAME`.

The build uses `--no-tree-shake-icons` to avoid the Windows font subsetter's
Unicode-path bug in this workspace. This retains icon fonts and increases the
download size slightly.

## Manual upload alternative

Build with `flutter build web --release --no-tree-shake-icons --no-wasm-dry-run`,
then upload `build/web` through Cloudflare Pages Direct Upload. Select Pages
hosting for this static build; no Worker server is needed.
