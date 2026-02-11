# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Development Commands

```bash
# Dependencies
flutter pub get

# Code generation (REQUIRED after modifying @riverpod or @freezed classes)
dart run build_runner build --delete-conflicting-outputs

# Localization (after editing lib/l10n/app_it.arb)
flutter gen-l10n

# Run app
flutter run

# Analysis & formatting
flutter analyze
dart format lib test

# Testing
flutter test                                    # all tests (unit + integration)
flutter test test/common/utils/                 # all unit tests in a directory
flutter test test/repeaters_provider_test.dart   # single test file
flutter test --tags integration                 # only integration tests
flutter test --coverage
```

**Package name**: `package:hamqrg/...` (use this prefix for all imports)

## Architecture Overview

This is a Flutter app for ham radio repeater discovery using **Clean Architecture** with **Riverpod** for state management.

### Features
`lib/src/features/`: authentication, brandmeister, dashboard, favorites, home, params, post_login_onboarding, profile, repeaters, splashscreen

### Supporting Modules
- `lib/clients/` — External service abstractions: supabase, api (Dio), storage (SharedPreferences + SecureStorage), image_picker, package_info, in_app_review
- `lib/common/` — Shared code: abstracts, dialogs, entity, errors, extension, provider, service (location), utils, widgets (17 categories: buttons, forms, cards, loading, snackbars, etc.)
- `lib/router/` — auto_route configuration
- `lib/config/` — App config + constants (map keys, map layers)
- `lib/themes/` — Material theme, colors, light theme variant
- `lib/l10n/` — Localization (Italian template)
- `lib/log/` — Talker + Sentry logging

### Route Structure
`AppRouter` (auto_route) with auth guard. Tab navigation via `HomeRoute`:
- **MainRouter**: dashboard, map, list, favorites, repeater detail (`/repeater/:repeaterId`), report, repeater map
- **ProfileRouter**: profile, user settings

### Feature Structure
Each feature follows this strict hierarchy:
```
lib/src/features/[feature]/
├── data/
│   ├── datasource/      # Abstract interface + Supabase implementation
│   ├── model/           # DTOs with @freezed + fromJson
│   ├── mappers/         # Model ↔ Entity converters
│   └── repository/      # Business logic, returns domain entities
├── domain/              # @freezed entities (no JSON methods)
├── presentation/
│   └── [page_name]/
│       ├── controller/  # @riverpod notifier
│       │   └── state/   # @freezed state class
│       └── [page_name]_page.dart
├── provider/            # Action-specific providers
└── errors/              # Feature-specific exceptions
```

### Key Patterns

**State Management**: Riverpod 3.x with annotations (`riverpod_annotation: ^4.0`)
- Controllers extend `_$[PageName]Controller` (generated)
- Use `AsyncValue.guard()` for initial loads and simple operations
- Each page has its own controller and state (no sharing)

**Error handling in AsyncNotifier (Riverpod best practices)**:
- **Initial load** (`build()`): Let exceptions propagate — Riverpod sets `AsyncError` automatically.
- **Mutations/refreshes** (methods that update data while the page is visible):
  - NEVER let the state go to `AsyncError` if the page must remain usable (e.g., map, lists with data).
  - Catch errors inside try/catch, keep `AsyncData` with previous data, and set an error flag in the `@freezed` state (e.g., `hasLoadError`, same pattern as `locationError`).
  - Clear the error flag on the next successful load.
  - NEVER use `AsyncValue.copyWithPrevious` — it is `@internal` in Riverpod 3.x.
  - NEVER wrap `AsyncValue.guard()` around code that already has try/catch — pick one.
- **In the UI**: use the state error flag (e.g., `mapState?.hasLoadError ?? false`) to show a retry banner, NOT `asyncState.hasError`.
- **After modifying `@freezed` state classes**: ALWAYS run `dart run build_runner build --delete-conflicting-outputs` before analyzing.

```dart
// GOOD: mutation preserves state on error
Future<void> loadData() async {
  final currentState = state.value;
  try {
    final result = await _fetch();
    state = AsyncData(MyState(data: result));
  } catch (_) {
    state = AsyncData(
      (currentState ?? const MyState()).copyWith(hasLoadError: true),
    );
  }
}

// BAD: mutation wipes the page
Future<void> loadData() async {
  state = await AsyncValue.guard(() async {
    return MyState(data: await _fetch()); // error → AsyncError → page gone
  });
}
```

**Data Flow**: Datasource → Repository → Provider → Controller → Page
- Datasources return Models (DTOs)
- Repositories convert Models to Domain Entities
- Pages receive only primitive IDs, not entities

**Pages**: Use `HookConsumerWidget` with `@RoutePage()` annotation
```dart
final controller = ref.watch(pageNameControllerProvider);
return controller.when(data: ..., error: ..., loading: ...);
```

## Localization Rules

File: `lib/l10n/app_it.arb` (template)
- **Keys**: ALWAYS in English (camelCase)
- **Values**: ALWAYS in Italian
- Pattern: `[feature][element]` (e.g., `homeQuickAccess`, `repeaterDetails`)

## Backend & Services

- **Supabase**: Database, authentication (Google, Apple, Anonymous)
- **Mapbox**: Interactive maps with repeater markers
- **Sentry**: Error tracking
- **Backend repo**: `ham_qrg_supabase/supabase/` — migrations, RPC functions, RLS policies

### Supabase Query Patterns

- **Prefer RPC functions** over complex PostgREST queries with `!inner` joins + `inFilter` — PostgREST joins are fragile and can silently drop related data (e.g., `network:networks(*)` gets lost when switching to `!inner`).
- Complex queries (search with fuzzy match, filters, joins) should be PostgreSQL functions called via `_client.rpc('function_name', params: {...})`.
- RPC functions use the **LATERAL JOIN pattern** for loading accesses with their networks consistently.
- **pg_trgm extension** is enabled: use `similarity()` for fuzzy ranking and `ILIKE` with trigram GIN indexes for filtering.

### Authentication Provider Invalidation

When auth state changes (e.g., anonymous → authenticated via registration prompt), **ALL** auth-related providers must be invalidated:
```dart
ref
  ..invalidate(getProfileProvider)
  ..invalidate(checkNeedsPostLoginOnboardingProvider)
  ..invalidate(getUserIdProvider)
  ..invalidate(isAnonymousProvider);
```
Missing any of these causes stale cached values → RLS violations when the JWT token no longer matches the cached `userId`.

### Auth Gate Pattern (`requireAuthentication`)

`requireAuthentication(context, ref)` is used as an auth gate before protected actions (feedback, favorites, reports). The registration prompt shown to anonymous users must:
- Only close the modal (`Navigator.pop(true)`) after sign-in
- **NOT navigate away** (`pushAndPopUntil`) — that would destroy the caller's page mid-action
- Invalidate all auth providers before closing so the caller gets fresh state

## Repeater Domain Model

Core entities in `lib/src/features/repeaters/domain/`:
- **Repeater**: frequencyHz, mode (Analog/Digital/Mixed), accesses list, coordinates
- **RepeaterAccess**: mode enum, CTCSS tones (ctcssTxHz/ctcssRxHz), DMR params (colorCode, dmrId), network reference
- **Network**: name, kind (DMR network like BrandMeister, TGIF)
- **RepeaterFeedback**: user reviews with type, station kind, location

## Access Mode Colors

Defined in `lib/themes/app_colors.dart` and `lib/common/utils/access_mode_helper.dart`:
- Analog: Blue (#3B82F6)
- DMR: Purple (#A855F7)
- C4FM: Teal (#14B8A6)
- D-STAR: Orange (#FF6B35)

## Coding Conventions

- Files/directories: `snake_case`
- Classes: `UpperCamelCase`
- Variables/methods: `lowerCamelCase`
- Analysis: extends `very_good_analysis`
- Generated files excluded: `*.g.dart`, `*.freezed.dart`

### Riverpod Naming Conventions

| Type | Location | Naming | Example |
|------|----------|--------|---------|
| **Controller** | `presentation/[page]/controller/` | `*Controller` | `DashboardController` |
| **Notifier** | `provider/[name]_notifier/` | `*Notifier` | `FavoriteRepeatersNotifier` |
| **Provider** | `provider/[action]/` | `*Provider` (function) | `getProfileProvider` |

**When to use each:**
- `*Controller`: UI state management for a specific page. Lives in `presentation/`.
- `*Notifier`: Application-level state with methods (add/remove/update). Lives in `provider/`.
- `*Provider`: Simple data fetching or actions without complex state. Lives in `provider/`.

**Folder structure examples:**
```
# Controller (UI page state)
presentation/dashboard_page/controller/dashboard_controller.dart

# Notifier (app-level state with methods)
provider/favorite_repeaters_notifier/favorite_repeaters_notifier.dart

# Provider (simple action/fetch)
provider/get_profile/get_profile_provider.dart
```

## Testing Conventions

### Integration Tests (real Supabase)
- File naming: **flat** `test/FEATURE_provider_test.dart` (e.g., `test/repeaters_provider_test.dart`)
- Do NOT mirror `src/features/` folder structure in tests
- Use `@Tags(['integration'])` at file level to separate from unit tests
- Use `ProviderContainer` with real datasource/repository overrides
- Authenticate with `_client.auth.signInAnonymously()` for RLS permissions
- Run with: `flutter test --tags integration`
- Note: without `dart_test.yaml`, `flutter test` runs everything including integration tests

### Unit Tests
- Place in `test/common/` or `test/` root
- Mock dependencies when testing pure logic

## Commit Convention

Prefix format: `[type]: [description]`
- Examples: `dev:`, `refactor:`, `fix:`, `feat:`
- Each commit must pass `flutter analyze`
