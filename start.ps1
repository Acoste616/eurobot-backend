Write-Host "🚀 Strapi Backend - Local Setup" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Check if .env exists
if (-not (Test-Path .env)) {
    Write-Host "⚠️  .env file not found!" -ForegroundColor Yellow
    Write-Host "📋 Copying .env.example to .env..." -ForegroundColor Yellow
    Copy-Item .env.example .env
    Write-Host "✅ Done! Please edit .env with your database credentials." -ForegroundColor Green
    Write-Host ""
}

# Check if node_modules exists
if (-not (Test-Path node_modules)) {
    Write-Host "📦 Installing dependencies..." -ForegroundColor Yellow
    npm install
    Write-Host ""
}

Write-Host "🔧 Starting development server..." -ForegroundColor Cyan
Write-Host "Admin panel will be available at: http://localhost:1337/admin" -ForegroundColor Green
Write-Host ""

npm run develop
