# 🚀 Como Fazer uma Nova Release

## Método Automático (Recomendado)

### 1. Execute o script:
```powershell
.\release.ps1
```

### 2. Responda as perguntas:
- **Nova versão:** `0.2.0` (exemplo)
- **Changelog:** Descreva as mudanças principais desta release

### 3. Pronto! O script faz tudo automaticamente:
- ✅ Atualiza `CHANGELOG.md` com nova entrada
- ✅ Gera ZIPs de **todos os mods** na pasta `packs/`
- ✅ Faz commit e push das mudanças
- ✅ Cria tag `v0.2.0`
- ✅ Cria release no GitHub com todos os ZIPs (se tiver `gh` instalado)

### 4. Resultado:
```
packs/
  ├── exp_share-ptbr-0.1.7.zip
  ├── running_shoes-ptbr-0.1.0.zip (se houver)
  └── ...
```

---

## Método Manual

### 1. Atualizar `CHANGELOG.md`
Adicione uma nova entrada no topo:

```markdown
## [0.2.0] - 2026-08-12

### Added
- Novo mod: Running Shoes PT-BR
- Melhorias no Exp Share

### Fixed
- Corrigido texto cortado em batalhas
```

### 2. Gerar ZIPs dos mods
Para cada mod em `mods/`:

```powershell
# Exemplo: Exp Share
cd mods/exp_share_ptbr
Compress-Archive -Path * -DestinationPath ../../packs/exp_share-ptbr-0.1.7.zip -Force
cd ../..
```

**Importante:** O nome do ZIP deve seguir o padrão: `{mod_name}-{version}.zip`

### 3. Commit e push
```bash
git add .
git commit -m "chore: release v0.2.0

- Novo mod: Running Shoes PT-BR
- Melhorias no Exp Share"
git push
```

### 4. Criar tag
```bash
git tag v0.2.0
git push origin v0.2.0
```

### 5. Criar release no GitHub
1. Acesse: https://github.com/raphabarreto/pokered-ptbr/releases/new
2. **Tag:** `v0.2.0`
3. **Title:** `v0.2.0 - Novo mod: Running Shoes PT-BR`
4. **Description:**
```markdown
## ✨ Novidades

- Novo mod traduzido: Running Shoes PT-BR
- Melhorias no Exp Share PT-BR

## 📦 Mods Incluídos

- **Exp Share PT-BR** v0.1.7
- **Running Shoes PT-BR** v0.1.0

## 📥 Instalação

1. Baixe o mod desejado (arquivo .zip)
2. Importe no gen1recomp (MODS → Import)
3. Ative o mod e reinicie o jogo
```
5. **Anexar:** Todos os arquivos `.zip` da pasta `packs/`
6. **Publish release**

---

## 📋 Checklist Antes de Release

### Testes:
- [ ] Testou todos os mods modificados localmente no gen1recomp
- [ ] Verificou que os textos estão corretos (sem cortes)
- [ ] Confirmou compatibilidade com outros mods comuns

### Documentação:
- [ ] Atualizou `README.md` do repositório (se necessário)
- [ ] Atualizou `README.md` do mod (se houver mudanças)
- [ ] Adicionou entrada no `CHANGELOG.md`

### Arquivos:
- [ ] `manifest.json` de cada mod tem versão correta
- [ ] ZIPs foram gerados corretamente na pasta `packs/`
- [ ] Nomes dos ZIPs seguem o padrão: `{mod}-{version}.zip`

### GitHub:
- [ ] Commit e push realizados
- [ ] Tag criada (`v0.2.0`)
- [ ] Release criada com todos os ZIPs anexados
- [ ] Release notes estão claras e informativas

---

## 🆕 Adicionando um Novo Mod Traduzido

### 1. Traduzir o mod:
- Siga o guia [COMO_TRADUZIR_MOD.md](docs/COMO_TRADUZIR_MOD.md)
- Coloque em `mods/{nome_mod_ptbr}/`

### 2. Gerar ZIP:
```powershell
cd mods/novo_mod_ptbr
Compress-Archive -Path * -DestinationPath ../../packs/novo_mod-ptbr-0.1.0.zip -Force
cd ../..
```

### 3. Atualizar README:
Adicione seção do novo mod em `README.md`:

```markdown
### ✅ Novo Mod PT-BR v0.1.0
**Descrição do mod**

- 🔗 **Original:** [link]
- 📥 **Download:** [packs/novo_mod-ptbr-0.1.0.zip](packs/novo_mod-ptbr-0.1.0.zip)
- ✅ **Status:** Completo e testado
```

### 4. Fazer release:
```powershell
.\release.ps1
# Versão: 0.2.0
# Changelog: Adicionado Novo Mod PT-BR
```

---

## ⚙️ Instalar GitHub CLI (Opcional)

Para releases 100% automáticas com anexos:

```powershell
winget install GitHub.cli
```

Depois, autentique:
```bash
gh auth login
```

Com `gh` instalado, o script `release.ps1` faz **tudo sozinho**:
- Cria a release
- Anexa todos os ZIPs automaticamente
- Gera release notes formatadas

---

## 🐛 Troubleshooting

**Problema:** "GitHub CLI não instalado"  
**Solução:** Instale com `winget install GitHub.cli` ou crie a release manualmente no GitHub

**Problema:** ZIP não aceito no GitHub  
**Solução:** Verifique se o nome do arquivo segue o padrão `{mod}-{version}.zip` (sem espaços)

**Problema:** Usuários não veem update no gen1recomp  
**Solução:** Certifique-se que o campo `"github"` está no `manifest.json` de cada mod:
```json
{
  "github": "raphabarreto/pokered-ptbr"
}
```

**Problema:** Script PowerShell não executa  
**Solução:** 
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\release.ps1
```

---

## 📚 Links Úteis

- [Documentação do GitHub CLI](https://cli.github.com/manual/)
- [Releases do GitHub](https://docs.github.com/en/repositories/releasing-projects-on-github)
- [Semantic Versioning](https://semver.org/) - Padrão de versionamento
