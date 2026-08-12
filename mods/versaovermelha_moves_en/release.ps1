# Script de Release Automático - VersãoVermelha (Moves in English)
# Uso: .\release.ps1

param(
    [string]$version,
    [string]$changelog
)

# Função para exibir mensagens coloridas
function Write-Info { param($msg) Write-Host $msg -ForegroundColor Cyan }
function Write-Success { param($msg) Write-Host $msg -ForegroundColor Green }
function Write-Error { param($msg) Write-Host $msg -ForegroundColor Red }

# Banner
Write-Host @"

╔════════════════════════════════════════════╗
║   Release Automático - VersãoVermelha      ║
╚════════════════════════════════════════════╝

"@ -ForegroundColor Magenta

# Verificar se está no diretório correto
if (!(Test-Path "manifest.json")) {
    Write-Error "❌ Erro: manifest.json não encontrado!"
    Write-Error "Execute este script na raiz do projeto."
    exit 1
}

# Se não passou versão, solicitar
if (!$version) {
    Write-Info "📋 Versão atual no manifest.json:"
    $currentVersion = (Get-Content manifest.json | ConvertFrom-Json).version
    Write-Host "   $currentVersion" -ForegroundColor Yellow
    Write-Host ""
    $version = Read-Host "Nova versão (ex: 0.3.0)"
}

# Se não passou changelog, solicitar
if (!$changelog) {
    Write-Host ""
    Write-Info "📝 Changelog (descreva as mudanças):"
    $changelog = Read-Host
}

# Confirmar
Write-Host ""
Write-Host "════════════════════════════════════════════" -ForegroundColor Yellow
Write-Host "Versão: $version" -ForegroundColor White
Write-Host "Changelog: $changelog" -ForegroundColor White
Write-Host "════════════════════════════════════════════" -ForegroundColor Yellow
Write-Host ""
$confirm = Read-Host "Continuar? (s/n)"
if ($confirm -ne "s") {
    Write-Info "❌ Cancelado pelo usuário."
    exit 0
}

Write-Host ""
Write-Info "🚀 Iniciando processo de release..."
Write-Host ""

# 1. Atualizar manifest.json
Write-Info "1️⃣ Atualizando manifest.json..."
$manifest = Get-Content manifest.json | ConvertFrom-Json
$date = Get-Date -Format "yyyy-MM-dd"
$manifest.version = "$version ($date)"
$manifest | ConvertTo-Json -Depth 10 | Set-Content manifest.json -Encoding UTF8
Write-Success "   ✅ manifest.json atualizado para v$version"

# 2. Criar arquivo .zip
Write-Info "2️⃣ Criando arquivo .zip..."
$zipName = "versaovermelha-moves-en.zip"
if (Test-Path $zipName) {
    Remove-Item $zipName -Force
}

# Incluir apenas os arquivos necessários para o mod
$include = @(
    "manifest.json",
    "main.lua",
    ".luarc.json",
    "lang",
    "overrides",
    "assets"
)

Compress-Archive -Path $include -DestinationPath $zipName -Force

Write-Success "   ✅ $zipName criado"

# 3. Git commit e push
Write-Info "3️⃣ Commitando mudanças..."
git add manifest.json
git commit -m "chore: bump version to $version

$changelog"
git push
Write-Success "   ✅ Commit e push realizados"

# 4. Criar tag e release no GitHub
Write-Info "4️⃣ Criando release no GitHub..."
$tag = "v$version"
git tag $tag
git push origin $tag

# Verificar se gh CLI está instalado
if (Get-Command gh -ErrorAction SilentlyContinue) {
    Write-Info "   Criando release via GitHub CLI..."
    gh release create $tag $zipName `
        --title "v$version - $changelog" `
        --notes "## ✨ Novidades`n`n$changelog`n`n## 📥 Instalação`n`n1. Baixe ``versaovermelha-moves-en.zip```n2. Importe no gen1recomp (MODS → Import)`n3. Ative o mod e reinicie o jogo"
    Write-Success "   ✅ Release criada automaticamente!"
} else {
    Write-Host ""
    Write-Host "════════════════════════════════════════════" -ForegroundColor Yellow
    Write-Host "⚠️  GitHub CLI não instalado" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Crie a release manualmente em:" -ForegroundColor White
    Write-Host "https://github.com/raphabarreto/versaovermelha-moves-en/releases/new" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Tag: $tag" -ForegroundColor White
    Write-Host "Title: v$version - $changelog" -ForegroundColor White
    Write-Host "Anexar: $zipName" -ForegroundColor White
    Write-Host "════════════════════════════════════════════" -ForegroundColor Yellow
}

Write-Host ""
Write-Success "✅ Release v$version concluída!"
Write-Host ""
Write-Info "🔗 Próximos passos:"
Write-Host "   • Usuários verão update disponível automaticamente"
Write-Host "   • Eles podem clicar em 'Check for updates' para baixar"
Write-Host ""
