# Implementation Plan: Cluster Spots — Frontend

**Branch**: `002-cluster-spots-frontend` | **Date**: 2026-04-12 | **Spec**: [spec.md](./spec.md)
**Input**: Feature specification from `/specs/002-cluster-spots-frontend/spec.md`

## Summary

Implementare nell'app Flutter la feature "Cluster Spots" che permette ai radioamatori di spottarsi (self-spot) e spottare altri OM (other-spot) su ponti ripetitori. La feature introduce per la prima volta le subscription Realtime Supabase nell'app, aggiunge una nuova sezione "Ultimi spot" nella dashboard, arricchisce la scheda dettaglio ponte con spot attivi e indicatori visivi sulla mappa e nelle card, gestisce il payload delle notifiche push cluster e le preferenze di notifica a due livelli. Il backend (Edge Functions, RPC, tabella `repeater_spots`, trigger, Realtime publication) è già specificato e implementato nel repo `ham_qrg_supabase`.

## Technical Context

**Language/Version**: Dart 3.x / Flutter 3.x
**Primary Dependencies**: Riverpod 3.x (`riverpod_annotation: ^4.0`), `@freezed`, `auto_route`, `supabase_flutter`, `onesignal_flutter`, `mapbox_maps_flutter`
**Storage**: Supabase (PostgreSQL via Edge Functions + PostgREST + Realtime)
**Testing**: `flutter test` (unit + integration), `very_good_analysis`
**Target Platform**: iOS 15+ / Android (mobile)
**Project Type**: Mobile app (Flutter)
**Performance Goals**: Realtime updates ≤5s p95, countdown tick ogni 1s, spot creation ≤10s UX
**Constraints**: First Realtime feature — no existing patterns to follow in-app; offline-graceful (retain last data on disconnect)
**Scale/Scope**: ~10-50 spot/giorno, max ~10 spot attivi contemporanei su un ponte, ~500 preferiti per ponte popolare (fan-out notifiche gestito dal backend)

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

| Principle | Status | Notes |
|-----------|--------|-------|
| **I. Clean Architecture** | PASS | Nuova feature `spots` segue `data/ → domain/ → presentation/ → provider/`. Datasource astratto + Supabase impl. Entities `@freezed` senza serializzazione. Controllers con `@riverpod`. Pages ricevono solo ID primitivi. |
| **II. Testing Standards** | PASS | Integration test per `create-spot` e `close-spot` via Edge Functions. Unit test per stato derivato (`SpotState`), countdown logic, e notification payload parsing. `flutter analyze` zero warnings. |
| **III. UX Consistency** | PASS | Colori access mode riusati da `access_mode_helper.dart`. Stringhe localizzate in `app_it.arb`. Auth gate via `requireAuthentication` per anonimi. Error handling preserva stato pagina (no `AsyncError` su mutation). |
| **IV. Performance & Reliability** | PASS | Queries REST semplici (no complex joins — tabella singola con FK join). Realtime per aggiornamenti live. Stato "scaduto" derivato client-side senza round-trip. Graceful disconnect con re-fetch silenzioso. Auth provider invalidation rispettata. |

**Technology Constraints compliance**:
- Riverpod 3.x con annotations: OK
- `@freezed` per models e state: OK
- `auto_route` per nuove pagine (full-screen "Ultimi spot"): OK
- `build_runner` dopo modifiche: OK
- Localization via `flutter gen-l10n`: OK

## Project Structure

### Documentation (this feature)

```text
specs/002-cluster-spots-frontend/
├── spec.md              # Feature specification
├── plan.md              # This file
├── research.md          # Phase 0: research decisions
├── data-model.md        # Phase 1: entity/model design
├── quickstart.md        # Phase 1: integration recipes
├── contracts/           # Phase 1: interface contracts
│   └── realtime.md      # Realtime channel patterns
└── tasks.md             # Phase 2: implementation tasks (via /speckit.tasks)
```

### Source Code (repository root)

```text
lib/src/features/spots/
├── data/
│   ├── datasource/
│   │   ├── spots_datasource.dart          # Abstract interface
│   │   └── spots_supabase_datasource.dart # Supabase + Edge Functions impl
│   ├── model/
│   │   └── spot_model.dart                # DTO @freezed + fromJson
│   ├── mappers/
│   │   └── spot_mapper.dart               # Model ↔ Entity
│   └── repository/
│       └── spots_repository.dart          # Business logic, returns domain entities
├── domain/
│   ├── spot/
│   │   └── repeater_spot.dart             # @freezed entity (no JSON)
│   └── spot_state.dart                    # SpotState enum + derivation logic
├── presentation/
│   ├── create_spot_sheet/
│   │   ├── create_spot_sheet.dart         # Bottom sheet (self-spot)
│   │   └── create_other_spot_sheet.dart   # Bottom sheet (other-spot)
│   ├── spot_list_page/
│   │   ├── spot_list_page.dart            # Full-screen "Ultimi spot" page
│   │   └── controller/
│   │       ├── spot_list_controller.dart
│   │       └── state/
│   │           └── spot_list_state.dart
│   └── widgets/
│       ├── active_spots_section.dart      # "Spot attivi" for repeater detail
│       ├── spot_card.dart                 # Single spot row (self + other)
│       ├── spot_countdown.dart            # Countdown timer widget
│       ├── active_spot_banner.dart        # Persistent personal indicator
│       └── spot_dashboard_tab.dart        # Dashboard tab content
├── provider/
│   ├── create_spot/
│   │   └── create_spot_provider.dart      # Action provider (Edge Function call)
│   ├── close_spot/
│   │   └── close_spot_provider.dart       # Action provider (Edge Function call)
│   ├── active_spots_notifier/
│   │   └── active_spots_notifier.dart     # Repeater-scoped: Realtime + REST
│   ├── recent_spots_notifier/
│   │   └── recent_spots_notifier.dart     # Global: "Ultimi spot" 24h
│   ├── my_active_spot_notifier/
│   │   └── my_active_spot_notifier.dart   # User's own active self-spot
│   └── spots_with_active/
│       └── repeaters_with_active_spots_provider.dart  # Set<String> of repeater IDs with active spots (for map/card indicators)
└── errors/
    └── spot_error.dart                    # Feature-specific exceptions

# Modifications to existing features:

lib/src/features/repeaters/presentation/detail/
├── repeater_detail_page.dart              # Add "Spot attivi" section + "Spottati"/"Spotta un OM" buttons
└── controller/
    └── repeater_detail_controller.dart    # (minimal: inject spot providers)

lib/src/features/repeaters/presentation/favorites_page/
└── favorites_page.dart                    # Add red dot indicator + notification toggle

lib/src/features/dashboard/presentation/dashboard_page/
└── dashboard_page.dart                    # Add "Spot" tab in DraggableScrollableSheet

lib/src/features/profile/presentation/user_settings/
└── user_settings_screen.dart              # Add "Notifiche cluster" toggle

lib/src/features/home/presentation/home_page/
└── home_page.dart                         # Add active_spot_banner overlay

lib/router/
└── app_router.dart                        # Add SpotListRoute

lib/common/service/messaging/
└── notification_handler.dart              # Handle "new_cluster_spot" payload → navigate

lib/l10n/
└── app_it.arb                             # New keys: spotCreate*, spotList*, spotNotification*

# Map integration:
lib/src/features/repeaters/presentation/repeaters_map_page/
└── repeaters_map_page.dart                # Red pulsing border on markers with active spots

# Card integration:
lib/common/widgets/cards/
└── repeater_card.dart                     # Red dot indicator
```

**Structure Decision**: Nuova feature `spots` nella directory `lib/src/features/spots/` seguendo il pattern Clean Architecture del progetto. Le modifiche a feature esistenti (repeater detail, dashboard, favorites, profile, home, map, card) sono minimali — aggiunta di widget/sezioni dalla nuova feature.

## Complexity Tracking

Nessuna violazione della Constitution da giustificare.
