# Mod Index

Este diretório contém o índice de mods que pode ser usado no gen1recomp "FIND MODS".

## 🚀 Como Usar

### Para Jogadores:

1. Abra o **gen1recomp**
2. Vá em **MODS** → **Botão de Engrenagem** → **Indexes**
3. Clique em **"+"** para adicionar um index
4. Cole: `raphabarreto/pokered-ptbr`
5. Os mods aparecerão na lista "FIND MODS"!

**OU** cole o link direto:
```
https://raw.githubusercontent.com/raphabarreto/pokered-ptbr/main/site/data/index.json
```

### Mods Disponíveis:

- **VersãoVermelha v0.2.1** - Tradução completa do jogo
- **Exp Share PT-BR v0.1.7** - Mod de EXP compartilhado

## 🔧 Estrutura do Index

O arquivo `index.json` segue este formato:

```json
{
  "mods": [
    {
      "id": "nome_do_mod",
      "name": "Nome Exibido",
      "description": "Descrição curta",
      "author": "autor",
      "version": "1.0.0",
      "download_url": "https://github.com/.../mod.zip",
      "game_version": "v0.1.38+",
      "category": "gameplay|translation|ui",
      "tags": ["tag1", "tag2"],
      "profile": "gameplay|cosmetic|total-conversion",
      "priority": 9000
    }
  ],
  "repository": "owner/repo",
  "index_version": "1.0.0",
  "last_updated": "2026-08-12"
}
```

## 📝 Atualizar o Index

Ao fazer um novo release:

1. Atualize `site/data/index.json` com a nova versão
2. Atualize o `download_url` para o novo release
3. Commit e push
4. GitHub Pages servirá automaticamente a versão atualizada

## 🌐 GitHub Pages

O index é servido via GitHub Pages em:
```
https://<seu-usuario>.github.io/pokered-ptbr/site/data/index.json
```

**OU** via raw:
```
https://raw.githubusercontent.com/raphabarreto/pokered-ptbr/main/site/data/index.json
```

## 📋 Checklist para Novo Mod

- [ ] Adicionar entrada no `index.json`
- [ ] Fazer release com o `.zip` do mod
- [ ] Testar URL de download
- [ ] Commit e push do index atualizado
