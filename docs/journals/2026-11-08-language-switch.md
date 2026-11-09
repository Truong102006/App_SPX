---
date: 2026-11-08
session: language-switch
---

# Journal: English and Vietnamese language switch

## Context

The account screen needed a working language selector behind its upper-right settings icon, with immediate switching between English and Vietnamese.

## What Happened

- Added an accessible settings button and dismissible in-phone overlay offering English and Tiếng Việt, with a check beside the selected language.
- Shared language state lives in `SpxExpressApp` and `AppLanguageScope`. Switching updates the interface immediately and survives navigation during the current app session. Restarting the app returns to English.
- `LocalizedText` listens to shared state, while a translation catalog covers eight workflows, navigation, buttons, notifications, and descriptive sample statuses. Shipment IDs, product names, addresses, and dates remain intact.
- Fixed Vietnamese text overflow found by regression checks.
- All four Flutter tests passed, covering both languages across eight screens, switching back and forth, retention through navigation, and identity/date preservation.
- Direct `dart analyze lib test` completed with no errors or warnings and two existing `prefer_const` informational findings. `flutter analyze` encountered an LSP `FormatException` in the Unicode workspace path, so validation used the direct analyzer.

## Reflection

Shared state keeps screens consistent without adding dependencies. A session-only preference meets the requested interaction, but does not restore the chosen language after restarting the app.

## Decisions Made

| Decision | Rationale | Impact |
|----------|-----------|--------|
| Keep language in the app's inherited state | Rebuild subscribed labels across navigation | Immediate, consistent translation within a session |
| Use a catalog and `LocalizedText` | Support existing layouts with a small change surface | Interface copy changes while operational data stays unchanged |
| Keep English as the restart default | Avoid introducing storage beyond the requested scope | Preference lasts until the app restarts |

## Next Steps

No implementation plan directory exists, so no plan status synchronization was required. Persistent language storage can be added if requested.
