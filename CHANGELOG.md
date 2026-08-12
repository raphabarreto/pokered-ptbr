# Changelog

All notable changes to Pokémon Red PT-BR will be documented in this file.

## [0.1.0] - 2026-08-12

### 🎉 Initial Release - Unified Collection

#### Added
- **VersãoVermelha (Moves in English)** - Complete game translation
  - Brazilian Portuguese story and dialogues
  - English move names for competitive/streaming compatibility
  - Based on Hyd~Traduções v1.3.1
  - Hybrid translation system perfect for PT-BR players with international terminology
  - All 165 moves in English, battle text in Portuguese
  - Status labels in English (PSN, BRN, PAR, FRZ, SLP)
  
- **Exp Share PT-BR v0.1.7** - Gameplay mod translation
  - Complete translation of EXP Share mod to Brazilian Portuguese
  - Options menu: "COMPART. EXP" and "COMPART. ÚNICO"
  - Battle message: "EXP compartilhado entre o grupo!"
  - Modes translated: OFF / GEN 1 / GEN 5+ / BALANCED / AVERAGE

- **Repository structure:**
  - `mods/` folder with all mods (translation + gameplay)
  - `packs/` folder for ready-to-use ZIPs
  - `docs/` folder with comprehensive guides
  - Automated release system (PowerShell + GitHub Actions)

- **Documentation:**
  - README.md - Complete project overview
  - CHANGELOG.md - Version history
  - COMO_FAZER_RELEASE.md - Release guide
  - COMO_INSTALAR.md - Installation guide
  - COMO_TRADUZIR_MOD.md - Translation guide for contributors
  - FAQ.md - Common questions and troubleshooting

#### Changed
- **Repository renamed:** gen1recomp-mods-ptbr → pokered-ptbr
  - Clearer scope: covers full game translation + gameplay mods
  - Scalable naming for future projects (pokegold-ptbr, etc.)
  - Better discoverability

- **Unified structure:**
  - VersãoVermelha moved into mods/ folder
  - All PT-BR content centralized in one repository
  - Single release workflow for all mods

#### Technical Details

**VersãoVermelha:**
- Full translation in `lang/` folder (dialogue.lua, strings.lua, etc.)
- Custom graphics in `overrides/` folder
- Priority 9999 for maximum compatibility

**Exp Share PT-BR:**
- `main.lua` - All text strings translated
- `manifest.json` - Updated metadata
- Gameplay logic preserved 100%

**Repository:**
- PowerShell release automation script
- GitHub Actions workflow for CI/CD
- Comprehensive compatibility testing

---

## Future Plans

### 🚧 Planned Mods to Translate:
- [ ] Running Shoes PT-BR
- [ ] Repel Reuse Prompt PT-BR
- [ ] Quality of Life PT-BR
- [ ] Wilds of Kanto PT-BR
- [ ] Trainer Rematch PT-BR
- [ ] Modern Bag PT-BR

### 🔄 Repository Improvements:
- [x] Create CHANGELOG.md
- [ ] Add automated release script
- [ ] Setup GitHub Actions for CI/CD
- [ ] Create release guide documentation
- [ ] Add more translated mods

---

## How to Contribute

Want to help translate more mods? See [COMO_TRADUZIR_MOD.md](docs/COMO_TRADUZIR_MOD.md)!

---

**Compatible with gen1recomp v0.1.38+**
