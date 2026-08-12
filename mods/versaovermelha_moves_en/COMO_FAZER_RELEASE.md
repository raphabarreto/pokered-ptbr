# 🚀 Como Fazer uma Nova Release

## Método Automático (Recomendado)

### 1. Execute o script:
```powershell
.\release.ps1
```

### 2. Responda as perguntas:
- **Nova versão:** `0.3.0` (exemplo)
- **Changelog:** Descreva as mudanças

### 3. Pronto! O script faz tudo automaticamente:
- ✅ Atualiza `manifest.json`
- ✅ Cria `versaovermelha-moves-en.zip`
- ✅ Faz commit e push
- ✅ Cria tag
- ✅ Cria release no GitHub (se tiver `gh` instalado)

---

## Método Manual

### 1. Atualizar `manifest.json`
```json
{
  "version": "0.3.0 (2026-08-XX)"
}
```

### 2. Criar `.zip`
```powershell
Get-ChildItem -Exclude .git,*.zip,*.ps1,*.md,.gitignore | Compress-Archive -DestinationPath versaovermelha-moves-en.zip -Force
```

### 3. Commit e push
```bash
git add manifest.json
git commit -m "chore: bump version to 0.3.0"
git push
```

### 4. Criar release no GitHub
1. Acesse: https://github.com/raphabarreto/versaovermelha-moves-en/releases/new
2. Tag: `v0.3.0`
3. Title: `v0.3.0 - Descrição`
4. Anexe `versaovermelha-moves-en.zip`
5. Publish release

---

## 📋 Checklist

- [ ] Testou as mudanças localmente
- [ ] Atualizou a versão no `manifest.json`
- [ ] Criou o `.zip` correto
- [ ] Fez commit e push
- [ ] Criou a release no GitHub com o arquivo `.zip` anexado
- [ ] Nome do arquivo é **exatamente** `versaovermelha-moves-en.zip`

---

## ⚙️ Instalar GitHub CLI (Opcional)

Para releases 100% automáticas:

```powershell
winget install GitHub.cli
```

Depois, autentique:
```bash
gh auth login
```

Com `gh` instalado, o script cria a release automaticamente! 🎉

---

## 🐛 Troubleshooting

**Problema:** "GitHub CLI não instalado"  
**Solução:** Instale com `winget install GitHub.cli` ou crie a release manualmente

**Problema:** ".zip não aceito no GitHub"  
**Solução:** Renomeie para **exatamente** `versaovermelha-moves-en.zip`

**Problema:** Usuários não veem update  
**Solução:** Verifique se o campo `"github"` está no `manifest.json`
