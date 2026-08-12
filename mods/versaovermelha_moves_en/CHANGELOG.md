# Changelog

All notable changes to VersãoVermelha (Moves in English) will be documented in this file.

## [1.0.0] - 2026-08-10

### 🎉 Initial Release - Hybrid Translation

#### Added
- **Hybrid translation system:** Portuguese story + English move names
- All 165 move names now display in English (TACKLE, SURF, THUNDERBOLT, etc.)
- Battle texts in Portuguese with English move names preserved
- Status labels kept in English (PSN, BRN, PAR, FRZ, SLP) for consistency
- Priority 9999 to ensure compatibility with most mods
- Conflict detection with CRYSTAL_251 mod
- Comprehensive README with features and troubleshooting

#### Changed
- Based on Hyd~Traduções Pokémon Versão Vermelha v1.3.1
- Move names: 165 moves reverted from Portuguese to English
- Battle text strings: Commented out Portuguese move name translations
- Enemy prefix: Removed "inimigo" suffix to prevent text overflow
- Status effect messages: Optimized for shorter text display
- Version bump from 0.2.x to 1.0.0 (stable release)

#### Fixed
- Text overflow in battle messages ("RATTATA inimigo sof..." → "RATTATA foi envenenado!")
- Compatibility issues when multiple mods are active
- Move name display consistency across all battle scenarios

#### Known Issues
- **Incompatible with CRYSTAL_251 mod** - Both modify translation strings
  - Workaround: Disable CRYSTAL_251 to use this mod
  - Future: Investigating compatibility patch

### Technical Details

#### Modified Files:
- `lang/move_names.lua` - Emptied to use English fallback
- `lang/strings.lua` - Commented out move-related translations:
  - SUBSTITUTE, RAGE, MIRROR MOVE, LEECH SEED
  - HM moves: FLY, FLASH, CUT, SURF, STRENGTH, SOFTBOILED, TELEPORT, DIG
  - "Enemy %s" format adjusted
- `manifest.json` - Updated priority, conflicts, and metadata

#### Not Modified (Kept in Portuguese):
- `lang/dialogue.lua` - All NPC dialogues remain in PT-BR
- `lang/species_names.lua` - Pokémon names
- `lang/item_names.lua` - Item names
- `lang/trainer_names.lua` - Trainer names

---

## [0.2.x] - Pre-Hybrid Versions

Original VersãoVermelha with full Portuguese translation including move names.

---

## Future Plans

- [ ] Investigate CRYSTAL_251 compatibility
- [ ] Optional variant with Portuguese status labels
- [ ] Performance optimizations
- [ ] Community feedback integration
