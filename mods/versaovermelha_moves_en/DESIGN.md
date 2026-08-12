# Design Decisions

This document explains the philosophy and technical choices behind VersãoVermelha (Moves in English).

## 🎯 Core Philosophy

**Hybrid Localization:** Combine the best of both worlds - Portuguese immersion for story with English technical terminology for competitive play.

---

## 📋 Design Choices

### 1. Why English Move Names?

#### Target Audience Analysis
This mod is designed for:
- **Competitive players** who use international terminology
- **Speedrunners** who need consistent naming across regions
- **Content creators/Streamers** who have international audiences
- **Players transitioning** from modern games (which use English moves)

#### Technical Benefits
- **Text Length:** English move names are generally shorter
  - Example: "SURF" (4 chars) vs "SURFAR" (6 chars)
  - Prevents UI overflow in battle screens
- **Consistency:** Matches official competitive Pokémon terminology
- **Communication:** Easier to discuss strategies online

#### Cultural Context
- Modern Pokémon games (Gen 6+) keep move names in English even in PT-BR
- Brazilian competitive community already uses English move names
- Speedrun community uses English terminology globally

### 2. Why Portuguese Everything Else?

#### Story & Dialogue
- **Immersion:** Players connect better with their native language
- **Accessibility:** Casual players can enjoy the story fully
- **Quality:** Hyd~Traduções v1.3.1 is a high-quality translation

#### Items & Cities
- **Context:** These are proper nouns and cultural elements
- **No Technical Need:** Not used in competitive discussion
- **Better UX:** "Cidade de Cerulean" is clearer than "Cerulean City" for PT-BR players

### 3. Status Labels (PSN, BRN, etc.)

**Decision:** Keep in English

#### Reasoning:
1. **Space Limitations:** Battle HUD only fits 3-4 characters
2. **Consistency:** Matches move name philosophy (technical terms in English)
3. **Recognition:** Target audience already familiar with these abbreviations
4. **International Standard:** Used in tournaments and competitive play

#### Alternatives Considered:
| Option | Pros | Cons | Verdict |
|--------|------|------|---------|
| PSN (English) | Universal, short | Not Portuguese | ✅ **Chosen** |
| ENV (Português) | Native language | Less recognized | ❌ Rejected |
| ENVE (Português) | Clear | Too long (4 chars) | ❌ Rejected |

### 4. Enemy Prefix Handling

**Original:** "Enemy RATTATA" → "RATTATA inimigo"  
**Problem:** Caused text overflow in battle messages  
**Solution:** "Enemy RATTATA" → "RATTATA" (removed "inimigo")

#### Reasoning:
- **Visual Context:** Battle UI already shows who is enemy vs ally
- **Space Optimization:** Prevents text cutting off
- **Modern Standard:** Recent Pokémon games don't use "enemy" prefix in PT-BR
- **Consistency:** Matches Japanese original (no enemy prefix)

---

## 🔧 Technical Decisions

### Priority: 9999

**Why the highest priority?**
- Ensures this mod loads **last**
- Overrides other mods that might modify translations
- Prevents conflicts with most other mods

### Conflicts: CRYSTAL_251

**Why explicit conflict?**
- CRYSTAL_251 is a massive overhaul with its own translation system
- Both mods modify the same `strings.lua` entries
- No clean way to merge without extensive rewrite

**Future Solution:**
- Investigate creating a CRYSTAL_251-compatible variant
- Or create a patch system that works with both

### File Organization

```
lang/
├── move_names.lua      ← Empty (falls through to English)
├── strings.lua         ← Battle text in PT-BR, moves commented out
├── dialogue.lua        ← 100% Portuguese (unchanged)
├── item_names.lua      ← 100% Portuguese (unchanged)
├── species_names.lua   ← 100% Portuguese (unchanged)
└── status_labels.lua   ← English (PSN, BRN, etc.)
```

**Rationale:**
- **Surgical approach:** Only modify what's needed
- **Maintainability:** Easy to see what was changed
- **Compatibility:** Minimal impact on other systems

---

## 🎮 User Experience Goals

### Primary Goals
1. **Competitive Readiness:** Players can jump into tournaments without relearning move names
2. **Story Immersion:** Enjoy the narrative in native Portuguese
3. **Stream-Friendly:** Content creators can use international terminology
4. **No Compromises:** Both languages where they work best

### Non-Goals
- ❌ **Not** a "purist" full English translation
- ❌ **Not** a full Portuguese translation (moves need to be English)
- ❌ **Not** trying to replace existing full translations

---

## 📊 Success Metrics

A successful hybrid mod should:
- ✅ Feel natural to competitive players
- ✅ Be understandable to Portuguese speakers
- ✅ Cause no text overflow issues
- ✅ Work with 90%+ of other mods
- ✅ Require no special configuration

---

## 🔮 Future Considerations

### Potential Variants
1. **Status Labels PT-BR:** Optional version with "ENV", "QUEI", etc.
2. **CRYSTAL_251 Compatible:** Separate version that works with Gen 2 expansion
3. **Competitive Mode:** Even more English terms (types, stats, etc.)

### Community Feedback
- Monitor which parts cause confusion
- Adjust based on speedrun community needs
- Consider adding configuration options if requested

---

## 📝 Conclusion

This mod fills a specific niche: **competitive/streaming players who want Brazilian Portuguese story but need English move terminology.**

Every design choice optimizes for this use case while maintaining broad compatibility and technical stability.

---

*Last updated: 2026-08-10*
