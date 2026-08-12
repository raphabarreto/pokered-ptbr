# 📂 Estrutura do Projeto - Pokémon Red PT-BR

## 🎯 Visão Geral

Este repositório centraliza traduções e mods em português brasileiro para **gen1recomp**.

---

## 📁 Estrutura de Pastas

```
pokered-ptbr/
│
├── 📄 README.md                    # Documentação principal (o que usuários veem)
├── 📄 CHANGELOG.md                 # Histórico de versões
├── 📄 COMO_FAZER_RELEASE.md        # Guia para criar releases
├── ⚙️ release.ps1                  # Script automático de release
├── 🚫 .gitignore                   # Arquivos ignorados pelo git
│
├── 📂 mods/                        # Código-fonte dos mods
│   ├── 📄 README.md                # Explica estrutura de mods
│   ├── 📂 versaovermelha_moves_en/ # Tradução completa do jogo
│   │   ├── manifest.json
│   │   ├── main.lua
│   │   ├── lang/                   # Arquivos de tradução
│   │   ├── overrides/              # Assets customizados
│   │   └── assets/                 # Recursos adicionais
│   │
│   └── 📂 exp_share_ptbr/          # Mod de EXP Share traduzido
│       ├── manifest.json
│       ├── main.lua
│       └── ...
│
├── 📦 packs/                       # ZIPs prontos para download
│   ├── 📄 README.md                # Explica convenções de nomes
│   ├── versaovermelha-moves-en-0.2.1.zip
│   └── exp_share-ptbr-0.1.7.zip
│
├── 📚 docs/                        # Documentação adicional
│   ├── COMO_INSTALAR.md            # Guia de instalação
│   ├── COMO_TRADUZIR_MOD.md        # Guia para contribuidores
│   └── FAQ.md                      # Perguntas frequentes
│
└── 🤖 .github/                     # Automação GitHub
    └── workflows/
        └── release.yml             # CI/CD para releases automáticos
```

---

## 🔄 Workflow de Desenvolvimento

### 1️⃣ Adicionar Novo Mod

```bash
# 1. Criar pasta do mod
mkdir mods/novo_mod_ptbr

# 2. Copiar arquivos do mod original
# 3. Traduzir strings de texto
# 4. Atualizar manifest.json
#    - "github": "raphabarreto/pokered-ptbr"

# 5. Testar no gen1recomp
```

### 2️⃣ Fazer Release

```powershell
# Método automático
.\release.ps1

# O script irá:
# - Empacotar todos os mods
# - Atualizar CHANGELOG.md
# - Fazer commit e push
# - Criar tag e release no GitHub
```

### 3️⃣ Fluxo Git

```bash
# Desenvolvimento
git add .
git commit -m "feat: novo mod traduzido"
git push

# Release (automático via release.ps1)
git tag v0.2.0
git push origin v0.2.0
gh release create v0.2.0 packs/*.zip
```

---

## 🎯 Convenções

### Nomes de Pastas
- Mods de tradução: `{nome}_ptbr/` ou `{nome}_moves_en/`
- Sempre em lowercase com underscore

### Nomes de ZIPs
- Formato: `{mod-name}-{version}.zip`
- Exemplo: `versaovermelha-moves-en-0.2.1.zip`
- Usa hífen (não underscore)

### Commits
- feat: Nova funcionalidade
- fix: Correção de bug
- docs: Documentação
- chore: Manutenção/release

### Versioning (Semantic)
- MAJOR.MINOR.PATCH
- 0.1.0 → 0.2.0 (novo mod)
- 0.2.0 → 0.2.1 (correção)

---

## 🔗 Links Importantes

- **Repositório:** https://github.com/raphabarreto/pokered-ptbr
- **Releases:** https://github.com/raphabarreto/pokered-ptbr/releases
- **Issues:** https://github.com/raphabarreto/pokered-ptbr/issues
- **gen1recomp:** https://github.com/bryanthaboi/pokered-gen1recomp

---

## 🚀 Futuro

### Próximos Repos (quando necessário):
- `pokegold-ptbr` - Gen 2 (Gold/Silver)
- `pokeemerald-ptbr` - Gen 3 (Emerald)

Cada geração terá seu próprio repositório centralizado seguindo este modelo.

---

**Última atualização:** 2026-08-12
