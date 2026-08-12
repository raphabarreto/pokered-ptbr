# 📁 Mods

Esta pasta contém o código-fonte de todos os mods traduzidos para PT-BR.

## 🌟 Estrutura

Cada mod tem sua própria pasta com:
- `manifest.json` - Metadados do mod (nome, versão, dependências)
- `main.lua` - Código principal
- `README.md` - Documentação específica do mod
- Outros arquivos (lang/, overrides/, assets/, etc.)

## 📦 Mods Disponíveis

### 🇧🇷 Tradução Completa

#### `versaovermelha_moves_en/`
Tradução completa do jogo com híbrido PT-BR + EN
- História e diálogos em português
- Nomes dos golpes em inglês
- Baseado em Hyd~Traduções v1.3.1

### 🎮 Mods de Gameplay

#### `exp_share_ptbr/`
Compartilhamento de EXP traduzido
- Menu OPTIONS em português
- Mensagens de batalha traduzidas
- Baseado em [ShaneMcGovernIE/exp_share](https://github.com/ShaneMcGovernIE/exp_share)

## ✨ Adicionar Novo Mod

1. Crie pasta com nome descritivo: `{mod_name}_ptbr/`
2. Traduza apenas as strings de texto
3. Mantenha a lógica do mod original
4. Atualize `manifest.json` com `"github": "raphabarreto/pokered-ptbr"`
5. Crie README.md explicando as mudanças
6. Gere ZIP com `release.ps1`

## 📚 Guias

- [Como Traduzir um Mod](../docs/COMO_TRADUZIR_MOD.md)
- [Como Fazer Release](../COMO_FAZER_RELEASE.md)

---

**Todos os mods mantêm os créditos e licenças originais.**
