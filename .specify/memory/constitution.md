<!--
## Sync Impact Report
- **Version change**: 0.0.0 → 1.0.0
- **Bump rationale**: Initial adoption — all principles are new (MAJOR)
- **Added principles**:
  - I. Clean Architecture Discipline
  - II. Testing Standards
  - III. User Experience Consistency
  - IV. Performance & Reliability
- **Added sections**:
  - Technology Constraints
  - Development Workflow
  - Governance
- **Removed sections**: None (initial version)
- **Templates requiring updates**:
  - `.specify/templates/plan-template.md` — ✅ No updates needed (Constitution Check section is generic)
  - `.specify/templates/spec-template.md` — ✅ No updates needed (requirements section compatible)
  - `.specify/templates/tasks-template.md` — ✅ No updates needed (phase structure compatible)
- **Follow-up TODOs**: None
-->

# HamQRG Flutter Constitution

## Core Principles

### I. Clean Architecture Discipline

Every feature MUST follow the strict layered hierarchy:
**Datasource → Repository → Provider → Controller → Page**.

- Data layer (`data/`) owns DTOs (`@freezed` models with `fromJson`),
  abstract datasource interfaces, Supabase implementations, and mappers.
- Domain layer (`domain/`) owns pure `@freezed` entities with no
  serialization logic.
- Presentation layer (`presentation/`) owns pages (`HookConsumerWidget`
  with `@RoutePage()`), controllers (`@riverpod` notifiers), and
  `@freezed` state classes.
- Providers (`provider/`) own application-level notifiers and simple
  data-fetching providers.
- Pages MUST receive only primitive IDs, never domain entities.
- All imports MUST use the `package:hamqrg/...` prefix.
- Generated files (`*.g.dart`, `*.freezed.dart`) MUST NOT be committed;
  `build_runner` MUST be run after any `@riverpod` or `@freezed` change.

**Rationale**: Strict boundaries prevent coupling between layers, make
features independently testable, and keep the codebase navigable as the
feature count grows.

### II. Testing Standards

All code changes MUST pass `flutter analyze` with zero warnings before
merge. The project extends `very_good_analysis`.

- **Integration tests** (real Supabase): flat naming at `test/` root,
  tagged `@Tags(['integration'])`, authenticated via anonymous sign-in,
  using `ProviderContainer` with real overrides.
- **Unit tests**: placed in `test/common/` or `test/` root, mocking
  external dependencies.
- New features MUST include at least one integration test covering the
  primary user journey when the feature touches Supabase data.
- Providers that perform RPC calls MUST have an integration test
  verifying the query returns expected shape against the real database.
- `dart format lib test` MUST produce no changes on committed code.

**Rationale**: Real-database integration tests caught a production
migration failure that mocked tests missed. Static analysis and
formatting gates prevent style drift across contributors.

### III. User Experience Consistency

The app MUST deliver a coherent, predictable experience across all
screens and interaction flows.

- Access mode colors (Analog=Blue, DMR=Purple, C4FM=Teal, D-STAR=Orange)
  MUST be used consistently everywhere a mode is displayed; definitions
  live in `app_colors.dart` and `access_mode_helper.dart`.
- Localization keys MUST follow the `[feature][element]` camelCase
  pattern with English keys and Italian values in `app_it.arb`.
- All user-facing strings MUST be localized — no hardcoded strings in
  presentation code.
- Error states in async pages MUST preserve existing data and show a
  retry banner; the page MUST NOT collapse to a full-screen error when
  data was previously loaded (see Riverpod error-handling pattern in
  CLAUDE.md).
- Anonymous users encountering auth-gated actions MUST see the
  registration prompt without navigating away from the current page.

**Rationale**: Ham radio operators rely on color-coded mode
identification at a glance. Preserving page state during transient
errors keeps the app usable in low-connectivity field conditions.

### IV. Performance & Reliability

The app MUST remain responsive and stable under real-world field
conditions (variable connectivity, large repeater datasets).

- Supabase queries involving joins, fuzzy search, or multi-filter
  combinations MUST use RPC functions (PostgreSQL functions) instead of
  complex PostgREST `!inner` queries, which can silently drop data.
- `pg_trgm` with `similarity()` and trigram GIN indexes MUST be used
  for fuzzy search ranking.
- Auth state changes MUST invalidate ALL auth-related providers
  (`getProfileProvider`, `checkNeedsPostLoginOnboardingProvider`,
  `getUserIdProvider`, `isAnonymousProvider`) to prevent stale JWT
  cache → RLS violations.
- Controllers MUST NOT use `AsyncValue.copyWithPrevious` (internal API
  in Riverpod 3.x) and MUST NOT let mutation errors replace
  `AsyncData` with `AsyncError` on pages that display persistent data.
- Map and list pages MUST handle network timeouts gracefully, retaining
  the last-known dataset and surfacing a non-blocking error indicator.

**Rationale**: Field use (POTA/SOTA activations) means unreliable
network. Silent data loss from PostgREST join bugs caused production
issues. Stale auth cache after anonymous→authenticated transition
caused RLS violations.

## Technology Constraints

- **Framework**: Flutter (Dart) with Riverpod 3.x (`riverpod_annotation:
  ^4.0`), `@freezed` for immutable models, `auto_route` for navigation.
- **Backend**: Supabase (PostgreSQL, Auth, Storage). Auth methods:
  Google, Apple, Anonymous.
- **Maps**: Mapbox with custom repeater markers.
- **Error tracking**: Sentry via Talker logging.
- **Analysis**: `very_good_analysis` — zero warnings policy.
- **Code generation**: `build_runner` for Riverpod, Freezed, and
  auto_route. MUST run after modifying annotated classes.
- **Localization**: `flutter gen-l10n` with `app_it.arb` as template.

## Development Workflow

- Every feature branch MUST pass `flutter analyze` and `dart format`
  checks before merge.
- Code generation (`build_runner`) MUST be run and verified after any
  change to `@riverpod`, `@freezed`, or `@RoutePage()` annotated files.
- Commit messages MUST follow the `[type]: [description]` convention
  (e.g., `feat:`, `fix:`, `refactor:`, `dev:`).
- Complex Supabase queries MUST be implemented as PostgreSQL functions
  in the `ham_qrg_supabase` repo and called via `_client.rpc()`.
- New localization keys MUST be added to all ARB files (`app_it.arb`,
  `app_en.arb`, `app_es.arb`, `app_fr.arb`).

## Governance

This constitution is the authoritative source of non-negotiable project
standards. It supersedes ad-hoc decisions and informal conventions.

- **Amendments**: Any change to principles MUST be documented with a
  version bump, rationale, and updated Sync Impact Report.
- **Versioning**: Semantic versioning (MAJOR.MINOR.PATCH).
  - MAJOR: Principle removed or fundamentally redefined.
  - MINOR: New principle or section added, or existing principle
    materially expanded.
  - PATCH: Wording clarifications, typo fixes, non-semantic edits.
- **Compliance review**: All PRs MUST be checked against active
  principles. The plan template's "Constitution Check" section gates
  implementation.
- **Runtime guidance**: `CLAUDE.md` provides detailed implementation
  patterns and MUST remain aligned with this constitution.

**Version**: 1.0.0 | **Ratified**: 2026-04-05 | **Last Amended**: 2026-04-05
