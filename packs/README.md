# 📦 Packs

Esta pasta contém os arquivos `.zip` prontos para instalação no **gen1recomp**.

## 🎯 Como Usar

### Download Direto (GitHub Releases)
Os usuários devem baixar os mods das [Releases](https://github.com/raphabarreto/pokered-ptbr/releases) oficiais, não diretamente desta pasta.

### Instalação
1. Baixe o arquivo `.zip` desejado
2. Abra o **gen1recomp**
3. Vá em **MODS** → **Import mod .zip**
4. Selecione o arquivo baixado
5. Ative o mod (toggle ON)
6. Reinicie o jogo

## 📋 Convenção de Nomes

Os arquivos seguem o padrão:
```
{mod-name}-{version}.zip
```

Exemplos:
- `versaovermelha-moves-en-0.2.1.zip`
- `exp_share-ptbr-0.1.7.zip`
- `running_shoes-ptbr-0.1.0.zip`

## 🤖 Geração Automática

Estes ZIPs são gerados automaticamente por:
- **Script local:** `release.ps1` na raiz do projeto
- **GitHub Actions:** `.github/workflows/release.yml`

### Gerar Manualmente

```powershell
# Na raiz do projeto
.\release.ps1
```

O script irá:
1. Empacotar cada mod de `mods/`
2. Criar ZIPs em `packs/`
3. Atualizar CHANGELOG.md
4. Fazer commit e push
5. Criar release no GitHub

## 🚫 O que NÃO incluir nos ZIPs

- `.git/` - Histórico git
- `.github/` - Workflows
- `*.md` - Documentação (exceto README do mod)
- `tests/` - Testes
- `.modkitignore` - Configurações de desenvolvimento
- Scripts de release

## ✅ O que INCLUIR nos ZIPs

- `manifest.json` - **Obrigatório**
- `main.lua` - Entry point
- `lang/` - Arquivos de tradução
- `overrides/` - Assets customizados
- `assets/` - Recursos do mod
- `README.md` - Documentação do mod

---

**Os ZIPs desta pasta são recriados a cada release.**
