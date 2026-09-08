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

### NEVER hardcode user-facing text

- **NEVER** put a user-facing string literal in a widget (`Text('Ciao')`, button
  labels, titles, snackbars, dialogs, tooltips, semantic labels, etc.). ALWAYS
  use `context.localization.<key>` (extension in `lib/common/extension/l10n_extension.dart`).
- This includes **default parameter values** of shared widgets: never
  `this.ctaLabel = 'Sblocca con PRO'`. Make the param nullable and resolve the
  default in `build` via `ctaLabel ?? context.localization.<key>`.
- Strings with variables/plurals use ARB **placeholders / ICU plural**, never
  string interpolation (`'Raggiungi $n ponti'` ❌ → `l10n.reachSheetCount(n)` ✅).
- Workflow for every new string:
  1. Add the key (English camelCase) + Italian value to `lib/l10n/app_it.arb`
     (with `@key` placeholder metadata if it has args).
  2. **Translate it into ALL locale files** (`app_en`, `app_es`, … all 15) —
     do NOT leave other languages to fall back to Italian.
  3. Run `flutter gen-l10n` and confirm **zero** "untranslated message(s)".
- The only acceptable literals in widgets are non-linguistic symbols (e.g. the
  blurred `'-•• dBm · •• km'` teaser mock, the `'PRO'` brand acronym).

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

## UI & Theme Rules

- **NEVER hardcode colors** (`Color(0x...)`, `Colors.xxx`, `AppColors.xxx`) in widgets. ALWAYS use `theme.colorScheme.*` (`error`, `surface`, `primary`, `onSurface`, etc.).
- **NEVER hardcode text styles**. ALWAYS use `theme.textTheme.*`.
- **Shadows**: use `theme.shadowColor`, not `Colors.black`.
- **Surfaces** (bottom sheets, cards, dialogs): use `theme.colorScheme.surface`, never `isDark ? AppColors.x : AppColors.y`.
- **Access mode colors** (`AccessModeHelper`) are the only exception — they are brand colors defined in the design system.
- If the theme doesn't have the right token for a use case, **flag it to the user** instead of inventing workarounds.

## Cache condivisa dei ripetitori (`remote_caching`)

La consultazione offline delle postazioni salvate poggia su una cache condivisa
con chiave `repeater:v1:<id>`. Due invarianti **non verificabili dal
compilatore** la tengono in piedi:

- **Mai `RemoteCaching.instance.clearCache()`.** Svuota l'intera tabella e con
  essa l'offline di ogni postazione salvata. Per invalidare un altro dominio si
  usa `clearCacheByPrefix('<prefisso>:')`.
- **Ogni voce `repeater:` si scrive con la sentinella `kNeverExpires`.**
  `RemoteCaching.init()` esegue `DELETE FROM cache WHERE expires_at < now`: una
  voce con scadenza normale verrebbe cancellata al riavvio successivo. Oggi la
  garanzia è strutturale — esiste un solo metodo di scrittura e la scadenza non
  è un suo parametro — ma va preservata se si aggiungono scrittori.

La cache resta un **acceleratore, non una dipendenza dura**: `getRepeaterById`
ricade sul repository se il database locale è inagibile.

Entrambe le invarianti sparirebbero se `remote_caching` supportasse
`expires_at NULL` = "non scade mai". Il pacchetto è interno: è un miglioramento
realistico.

## Vendita di Pro: superfici, paywall e funnel

Ogni punto dell'app da cui si può comprare è una voce di `PaywallPlacement`
(`lib/src/features/subscriptions/domain/paywall_placement.dart`). La paywall
non si apre mai chiamando direttamente il client: si passa da `openPaywall`,
`openPaywallInPlace` o `requirePro` in
`lib/src/features/subscriptions/presentation/require_pro.dart`.

Aggiungendo una placement servono **tre** cose, non una:

1. la voce in `PaywallPlacement`;
2. il placement omonimo nella dashboard RevenueCat (altrimenti quel punto
   mostra la paywall di default);
3. una voce corrispondente in `AnalyticsSurface`. Il parametro `surface` di
   quelle funzioni è **obbligatorio** apposta: una superficie non strumentata
   non è solo poco misurata, rende incomparabili anche le altre, perché il
   totale degli acquisti non torna più con la somma delle superfici.

Regole di composizione, tutte già disponibili come widget condivisi:

- **Mai una paywall a freddo.** Dove il tocco dell'utente non è già una
  richiesta d'acquisto (una voce di menu, una card informativa) ci va prima un
  passo di valore: `showProUpsellDialog`
  (`subscriptions/presentation/widgets/pro_upsell_dialog.dart`), che compone
  testata → promessa → vantaggi → CTA → prezzo → "più tardi" e restituisce
  `true` solo se l'acquisto è andato a buon fine.
- **Ogni CTA porta il prezzo e il ripristino**, tramite `ProPriceLine`
  (slot `footer` di `ProBlurGate`, o direttamente sotto il bottone). Il prezzo
  arriva sempre da `StoreProduct` via `RevenueCatClient.priceHint`: già
  localizzato, già nella valuta dello store. **Non si compone mai un prezzo a
  mano** — un numero scritto nell'app e diverso da quello dello store è una
  promessa rotta nel punto peggiore del funnel. Quando `priceHint` torna
  `null` (offline, SDK non configurato) la riga sparisce e la superficie resta
  comprabile: il prezzo è un rinforzo della CTA, mai una sua precondizione.
- **`inPlace` quando il contesto è il motivo dell'acquisto.** `openPaywall`
  ricostruisce l'albero di navigazione e riporta l'utente sulla tab iniziale;
  `openPaywallInPlace` lascia in piedi la pagina. Serve dove ciò che l'utente
  ha costruito prima di pagare è la ragione per cui paga (il punto scelto
  sulla mappa, FR-031) o dove subito dopo lo si vuole portare in ciò che ha
  appena comprato.
- **Il badge `PRO` è `ProBadge`** (`common/widgets/pro/`), non una `Container`
  scritta a mano: `ProBadge()` su fondo neutro, `ProBadge.onGold()` sopra
  l'oro. Va su ogni voce che al tocco chiede di pagare, altrimenti quel tocco
  è una trappola.
- **Il riflesso dorato (`ProShineSurface`) sta su due superfici, e basta.**
  Card Pro del profilo e CTA della card copertura: le uniche due in cui
  l'invito compete con altro contenuto (una lista di righe uguali, i dati
  tecnici del ripetitore). Nei `ProBlurGate` e nei dialog di upsell la CTA
  dorata è già l'unica cosa accesa sulla schermata, quindi il riflesso
  aggiungerebbe movimento senza attenzione. Se luccicano cinque superfici
  l'effetto è speso e resta solo il consumo: ogni istanza è un ticker che
  ridipinge di continuo. A chi ha già Pro non luccica nulla.
- **In `ProBlurGate` l'esempio sta sopra, non dietro.** Il mock sfocato
  occupa una striscia sua in cima; lucchetto, promessa, CTA e prezzo stanno
  sotto, su superficie piena. Sovrapposti — com'erano — nessuna sfocatura più
  leggera rende l'esempio visibile: al massimo lo trasforma in disturbo dietro
  alle parole. La striscia è **tagliata** (58 px compatta, 132 piena) perché il
  mock intero costava 450 px al teaser a piena pagina: due righe dicono com'è
  fatta la risposta, la terza aggiunge solo scroll.
- **`blurSigma` è basso (4) di proposito.** Nel mock non c'è nulla da
  proteggere — sono segnaposto inventati e dietro un gate chiuso non gira
  alcun calcolo (FR-014) — quindi la sfocatura fa solo il lavoro estetico di
  dire "bloccato". Alzarla cancella l'unica ragione per cui il mock esiste. I
  valori restano mascherati **nel mock** (`-•• dBm`), non dalla sfocatura: così
  l'esempio non può essere scambiato per una risposta vera. Mostrare invece il
  dato reale sfocato è da evitare su tutti i fronti: il blur non è sicurezza,
  farebbe pagare compute per traffico gratuito, manderebbe la posizione di
  ogni utente free al servizio, e metà delle volte sfocherebbe un "Fuori
  copertura" — cioè chiederebbe di pagare per leggere meglio un no.
- **La variante `dense`** serve dove il gate sta *dentro* una pagina di
  contenuto invece di esserne il contenuto (il badge di raggiungibilità sul
  dettaglio ripetitore). `test/pro_blur_gate_layout_test.dart` blocca sia il
  rapporto con la forma piena sia un tetto assoluto di altezza — e verifica
  che comprimere non abbia voluto dire tagliare: titolo, promessa e CTA
  restano tutti.
- **L'acquisto anonimo non si sbarra con una registrazione.** Un muro di login
  prima del pagamento perde conversioni già maturate; il collegamento
  dell'account si propone **dopo**, in `showProLinkAccountPrompt`, chiamato da
  `require_pro.dart` quando chi ha comprato è ancora anonimo.

## Cache offline Pro (`OfflineCacheGate`)

I datasource remoti sono avvolti da decorator `CachedXDatasource` costruiti
sul gate condiviso `lib/common/cache/offline_cache_gate.dart`:

- `gate.remote()` corto-circuita offline (`OfflineException`) e applica il
  timeout del gate; `gate.cached()` / `cachedNullable()` aggiungono la cache
  network-first **solo per i Pro**. Mai reimplementare guard o cache in un
  decorator: si aggiunge al gate.
- Il wiring nei provider dei datasource è uno solo:
  `ref.watchOfflineCacheGate(remoteTimeout: CachedX.remoteTimeout)`.
- Frammenti di chiave (coordinate arrotondate, hash di id, modalità) solo via
  `CacheKeys` (`lib/common/cache/cache_keys.dart`): le chiavi devono restare
  deterministiche per la stessa richiesta logica.
- Test di round-trip online → offline: `test/cached_datasources_offline_test.dart`
  (`RemoteCaching` su DB in-memory, funziona nei test VM).

### Riverpod 3: i provider senza listener attivo sono sospesi

`isProProvider` (stream keepAlive) e `offlineStatusProvider` sono letti in
modo sincrono (`.value ?? false`) dai datasource. Senza un listener **attivo**
lo stream non emette nemmeno il primo valore e `.future` resta appeso: il root
widget (`lib/src/app.dart`) e la splash tengono un `ref.listen` su entrambi.
Non rimuoverli — `test/is_pro_provider_test.dart` documenta il comportamento.

## Unità di misura: distanze e quote

Distanze e quote si scrivono **solo** tramite `context.units`
(`lib/common/extension/unit_system_extension.dart`). Nessun file fuori da
`lib/common/utils/unit_format_helper.dart` contiene un simbolo di unità di
lunghezza in una stringa, e nessuna chiave ARB ne contiene uno accanto a un
placeholder: il segnaposto riceve la stringa già formattata.

- `distance` / `distanceFromKm` per le distanze, `elevation` per le quote,
  `threshold` per le soglie citate nei testi (arrotondate **per difetto**, così
  la soglia dichiarata non è mai più larga di quella verificata),
  `presetRadius` per i raggi predefiniti (arrotondati al più vicino, con
  l'identità metrica del preset invariata).
- La preferenza è di **presentazione**: confronti, ordinamenti e verifiche di
  soglia restano sul valore metrico. Le postazioni salvate e la cache
  continuano a memorizzare metri e chilometri.
- Lo scope (`UnitSystemScope`) è installato nel `builder` di
  `MaterialApp.router`. Un widget test che monta un widget con una distanza
  deve avvolgerlo nello scope, altrimenti l'assert scatta — è voluto: un
  fallback silenzioso al metrico nasconderebbe proprio i punti dimenticati.
- Il controllo di copertura è `python3 tool/check_units.py`: deve tornare
  verde prima di ogni commit che tocchi una superficie con distanze o quote.
- **Non si converte** ciò che non è una distanza: frequenze, toni CTCSS, dBm,
  byte, coordinate, locator, azimut — e la **lunghezza d'onda** delle bande
  (`2 m`, `70 cm`), che è in metri ma è il nome della banda, identico in tutto
  il mondo.

## Coding Conventions

- **DRY principle**: Before creating any widget, helper, or utility, check if a similar one already exists in `lib/common/widgets/` or other features. If it does, extend/generalize it. If a new widget could be reused elsewhere, place it in `lib/common/widgets/` from the start.
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

## Active Technologies
- Dart 3.x / Flutter 3.x + Riverpod 3.x (`riverpod_annotation: ^4.0`), `@freezed`, `auto_route`, `supabase_flutter`, `onesignal_flutter`, `mapbox_maps_flutter` (002-cluster-spots-frontend)
- Supabase (PostgreSQL via Edge Functions + PostgREST + Realtime) (002-cluster-spots-frontend)
- Dart 3.x / Flutter 3.x (versione vincolata da `pubspec.yaml` del progetto) + Riverpod 3.x (`riverpod_annotation: ^4.0`), `freezed_annotation`, `json_serializable`, `auto_route`, `dio` (HTTP), `supabase_flutter` (edge function invocation), `mapbox_maps_flutter`, `geolocator` (location), `fl_chart` (grafico altimetrico, già presente) (004-sota-integration)
- Nessuno per MVP — solo cache in-memory via `ProviderContainer` Riverpod. Nessuna scrittura su SharedPreferences/SQLite per SOTA. (004-sota-integration)
- Dart 3.x / Flutter 3.x (vincolati da `pubspec.yaml`) + Riverpod 3.x (`riverpod_annotation ^4.0`), `freezed`, `auto_route`, `dio ^5.7`, `supabase_flutter`, `mapbox_maps_flutter ^2.4` (2.25 risolta), `shared_preferences ^2.3`, **`remote_caching ^1.0.19` (nuova, pacchetto interno)** (005-location-coverage-search)
- due archivi distinti — `StorageClient`/SharedPreferences per le postazioni (dato utente, durata illimitata); `remote_caching` (SQLite) con scadenza sentinella per i payload ripetitore (dato rigenerabile e condiviso) (005-location-coverage-search)
- Dart 3.x / Flutter 3.x (vincolati da `pubspec.yaml`) + `hooks_riverpod ^3.1` con `riverpod_annotation ^4.0`, `shared_preferences ^2.3`, `intl` (già presente, per il separatore decimale), `flutter_localizations` + `gen-l10n` su 15 locale (006-imperial-units)
- `SharedPreferences` tramite `SharedPrefStorageClient`, chiave `unit_system`. Nessuna scrittura su Supabase, nessuna migrazione, nessun campo remoto (006-imperial-units)

## Recent Changes
- 002-cluster-spots-frontend: Added Dart 3.x / Flutter 3.x + Riverpod 3.x (`riverpod_annotation: ^4.0`), `@freezed`, `auto_route`, `supabase_flutter`, `onesignal_flutter`, `mapbox_maps_flutter`
