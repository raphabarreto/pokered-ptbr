# Script de Release Automático - Pokémon Red PT-BR
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
║   Release Automático - Pokémon Red PT-BR   ║
╚════════════════════════════════════════════╝

"@ -ForegroundColor Magenta

# Verificar se está no diretório correto
if (!(Test-Path "mods")) {
    Write-Error "❌ Erro: pasta mods/ não encontrada!"
    Write-Error "Execute este script na raiz do projeto."
    exit 1
}

# Se não passou versão, solicitar
if (!$version) {
    Write-Info "📋 Última versão no CHANGELOG.md:"
    $lastVersion = (Get-Content CHANGELOG.md | Select-String -Pattern "\[(\d+\.\d+\.\d+)\]" -AllMatches | Select-Object -First 1).Matches.Groups[1].Value
    if ($lastVersion) {
        Write-Host "   v$lastVersion" -ForegroundColor Yellow
    }
    Write-Host ""
    $version = Read-Host "Nova versão (ex: 0.2.0)"
}

# Se não passou changelog, solicitar
if (!$changelog) {
    Write-Host ""
    Write-Info "📝 Changelog (descreva as mudanças principais):"
    $changelog = Read-Host
}

# Confirmar
Write-Host ""
Write-Host "════════════════════════════════════════════" -ForegroundColor Yellow
Write-Host "Versão: v$version" -ForegroundColor White
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

# 1. Atualizar CHANGELOG.md
Write-Info "1️⃣ Verificando CHANGELOG.md..."
$date = Get-Date -Format "yyyy-MM-dd"
$changelogEntry = @"

## [$version] - $date

### Added
$changelog

"@

# Inserir entrada no CHANGELOG após o título
$changelogContent = Get-Content CHANGELOG.md -Raw
if ($changelogContent -match "# Changelog") {
    $newChangelog = $changelogContent -replace "(# Changelog.*?\n\n)", "`$1$changelogEntry"
    Set-Content CHANGELOG.md -Value $newChangelog -Encoding UTF8 -NoNewline
    Write-Success "   ✅ CHANGELOG.md atualizado"
} else {
    Write-Error "   ⚠️  Não foi possível atualizar CHANGELOG automaticamente"
}

# 2. Gerar ZIPs dos mods
Write-Info "2️⃣ Gerando arquivos .zip dos mods..."

$modsFolder = "mods"
$packsFolder = "packs"

# Criar pasta packs se não existir
if (!(Test-Path $packsFolder)) {
    New-Item -ItemType Directory -Path $packsFolder | Out-Null
}

# Para cada mod na pasta mods/
Get-ChildItem $modsFolder -Directory | ForEach-Object {
    $modName = $_.Name
    $modPath = $_.FullName
    $manifestPath = Join-Path $modPath "manifest.json"
    
    if (Test-Path $manifestPath) {
        # Ler versão do manifest
        $manifest = Get-Content $manifestPath | ConvertFrom-Json
        $modVersion = $manifest.version -replace " \(.*\)", "" # Remove a data se houver
        
        # Nome do ZIP
        $zipName = "$modName-$modVersion.zip"
        $zipPath = Join-Path $packsFolder $zipName
        
        Write-Info "   Empacotando $modName v$modVersion..."
        
        # Remover ZIP antigo se existir
        if (Test-Path $zipPath) {
            Remove-Item $zipPath -Force
        }
        
        # Criar ZIP
        Compress-Archive -Path "$modPath\*" -DestinationPath $zipPath -Force
        Write-Success "     ✅ $zipName criado"
    }
}

# 3. Git commit e push
Write-Info "3️⃣ Commitando mudanças..."
git add .
git commit -m "chore: release v$version

$changelog"
git push
Write-Success "   ✅ Commit e push realizados"

# 4. Criar tag e release no GitHub
Write-Info "4️⃣ Criando release no GitHub..."
$tag = "v$version"
git tag $tag
git push origin $tag

# Listar todos os ZIPs para anexar
$zipFiles = Get-ChildItem $packsFolder -Filter "*.zip" | ForEach-Object { $_.FullName }

# Verificar se gh CLI está instalado
if (Get-Command gh -ErrorAction SilentlyContinue) {
    Write-Info "   Criando release via GitHub CLI..."
    
    # Criar release notes
    $releaseNotes = @"
## ✨ $changelog

## 📦 Mods Incluídos

"@
    
    # Adicionar lista de mods
    Get-ChildItem $modsFolder -Directory | ForEach-Object {
        $modName = $_.Name
        $manifestPath = Join-Path $_.FullName "manifest.json"
        if (Test-Path $manifestPath) {
            $manifest = Get-Content $manifestPath | ConvertFrom-Json
            $modVersion = $manifest.version -replace " \(.*\)", ""
            $releaseNotes += "- **$($manifest.name)** v$modVersion`n"
        }
    }
    
    $releaseNotes += @"

## 📥 Instalação

1. Baixe o mod desejado (arquivo .zip)
2. Abra o gen1recomp
3. Vá em **MODS** → **Import mod .zip**
4. Selecione o arquivo baixado
5. Ative o mod e reinicie o jogo

## 📚 Documentação

- [Como Instalar](https://github.com/raphabarreto/gen1recomp-mods-ptbr#-como-instalar)
- [Como Traduzir um Mod](https://github.com/raphabarreto/gen1recomp-mods-ptbr/blob/main/docs/COMO_TRADUZIR_MOD.md)

**Compatível com gen1recomp v0.1.38+**
"@
    
    # Criar release com todos os ZIPs
    gh release create $tag $zipFiles `
        --title "v$version - $changelog" `
        --notes $releaseNotes
    
    Write-Success "   ✅ Release criada automaticamente!"
} else {
    Write-Host ""
    Write-Host "════════════════════════════════════════════" -ForegroundColor Yellow
    Write-Host "⚠️  GitHub CLI não instalado" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Crie a release manualmente em:" -ForegroundColor White
    Write-Host "https://github.com/raphabarreto/pokered-ptbr/releases/new" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Tag: $tag" -ForegroundColor White
    Write-Host "Title: v$version - $changelog" -ForegroundColor White
    Write-Host "Anexar ZIPs da pasta packs/" -ForegroundColor White
    Write-Host "════════════════════════════════════════════" -ForegroundColor Yellow
}

Write-Host ""
Write-Success "✅ Release v$version concluída!"
Write-Host ""
Write-Info "🔗 Próximos passos:"
Write-Host "   • Verifique a release no GitHub"
Write-Host "   • Compartilhe com a comunidade"
Write-Host "   • Atualize o README se necessário"
Write-Host ""
