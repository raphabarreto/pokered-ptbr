# Como Traduzir um Mod

Guia para traduzir mods de gen1recomp para português brasileiro.

## Filosofia

**Regra de Ouro:** Traduza apenas **strings de texto**, não mexa na **lógica do código**.

## Passo a Passo

### 1. Escolha um Mod

Encontre um mod no [gen1recomp mod repository](https://github.com/topics/gen1recomp-mod) que esteja em inglês.

**Bons candidatos:**
- Mods de gameplay (QoL, utility)
- Mods com poucas strings (mais fácil)
- Mods populares (mais útil)

### 2. Baixe o Mod Original

Baixe o `.zip` do mod ou clone o repositório.

```bash
# Exemplo
git clone https://github.com/autor/nome-do-mod
```

### 3. Identifique as Strings

Abra o `main.lua` e procure por:

**Strings literais:**
```lua
"Text to translate"
'Another text'
```

**Strings em tabelas:**
```lua
local LABELS = {
  option1 = "English Text",
  option2 = "More English"
}
```

**Strings em funções:**
```lua
print("This appears in game")
```

### 4. Traduza Apenas o Texto

❌ **NÃO FAÇA:**
```lua
-- Mudar lógica
if player.level > 5 then  -- ❌ Não mude números/condições
```

✅ **FAÇA:**
```lua
-- Apenas strings
"EXP is shared" → "EXP compartilhado"
"SINGLE EXP SHARE" → "COMPART. ÚNICO"
```

### 5. Teste no Jogo

1. Crie um `.zip` com os arquivos modificados
2. Importe no gen1recomp
3. **Teste todas as funcionalidades**
4. Verifique se o texto aparece corretamente

### 6. Atualize o manifest.json

```json
{
  "id": "mod_name_ptbr",           // Adicione _ptbr
  "name": "Mod Name (PT-BR)",      // Adicione (PT-BR)
  "version": "1.0.0-ptbr",         // Adicione -ptbr
  "conflicts": ["mod_name"],       // Adicione original
  "description": "Descrição em português...",
  "github": "autor/mod-original"   // Mantenha o original
}
```

### 7. Crie um README

```markdown
# Mod Name (PT-BR)

Tradução para português brasileiro.

## Original
- **Autor:** [nome](link)
- **Versão:** x.y.z

## Tradução
- **Tradutor:** Seu nome
- **Versão:** x.y.z-ptbr
- **Data:** 2026-08-12

## O que foi traduzido
- ✅ Menu OPTIONS
- ✅ Mensagens de batalha
- ✅ Etc...
```

## Exemplos Práticos

### Exemplo 1: Exp Share

**Original:**
```lua
local SHARE_TEXT = "EXP is shared\namongst the party!"
```

**Traduzido:**
```lua
local SHARE_TEXT = "EXP compartilhado\nentre o grupo!"
```

### Exemplo 2: Labels de Menu

**Original:**
```lua
out[#out + 1] = {
  id = "exp_share",
  label = "EXP SHARE",
  -- ...
}
```

**Traduzido:**
```lua
out[#out + 1] = {
  id = "exp_share",
  label = "COMPART. EXP",
  -- ...
}
```

## Checklist Final

Antes de submeter:

- [ ] Testei todas as funcionalidades do mod
- [ ] Texto aparece corretamente no jogo
- [ ] Não quebrei nenhuma funcionalidade
- [ ] manifest.json atualizado com `_ptbr` e conflito
- [ ] README criado explicando a tradução
- [ ] Créditos ao autor original preservados

## Boas Práticas

### Nomenclatura

- Use `_ptbr` no ID: `exp_share_ptbr`
- Adicione `(PT-BR)` no nome: `Exp Share (PT-BR)`
- Versão: `0.1.7-ptbr`

### Abreviações Comuns

Para caber em menus pequenos:
- COMPARTILHAR → COMPART.
- EXPERIÊNCIA → EXP
- ÚNICO → ÚNICO (já é curto)
- CONFIGURAÇÃO → CONFIG.

### Acentuação

- ✅ Use acentos normalmente: "configuração", "experiência"
- ✅ O gen1recomp suporta UTF-8 com a fonte latina

### Teste com Usuários Reais

Depois de traduzir:
1. Jogue por 30 minutos
2. Peça feedback de outra pessoa
3. Ajuste conforme necessário

## Contribuindo para este Repo

1. Fork este repositório
2. Crie uma pasta em `mods/nome_mod_ptbr/`
3. Adicione os arquivos traduzidos
4. Crie o ZIP em `packs/`
5. Atualize o README.md principal
6. Abra um Pull Request

## Ferramentas Úteis

- **Editor:** VS Code com extensão Lua
- **Teste:** gen1recomp dev mode (F5 para reload)
- **Comparação:** Diff tools (Meld, Beyond Compare)

## Suporte

Dúvidas sobre tradução? [Abra uma issue](../../issues)!
