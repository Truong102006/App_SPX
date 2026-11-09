param([string]$ProjectName = 'spx-express-demo')

$ErrorActionPreference = 'Stop'
Push-Location (Split-Path -Parent $PSScriptRoot)
try {
    # Avoid the font-subsetting tool's Unicode path bug on Windows.
    flutter build web --release --no-tree-shake-icons --no-wasm-dry-run
    if ($LASTEXITCODE -ne 0) { throw 'Flutter web build failed.' }
    npx --yes wrangler pages deploy build/web --project-name $ProjectName --branch main --commit-dirty=true
    if ($LASTEXITCODE -ne 0) { throw 'Cloudflare deployment failed. Check wrangler login.' }
} finally {
    Pop-Location
}
