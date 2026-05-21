# Quickstart — SOTA Integration

**Audience**: developer che implementa la feature dopo `/speckit.tasks`.

## Prerequisiti

- Branch attivo: `004-sota-integration` (già checked out).
- Flutter SDK e Dart installati come da `pubspec.yaml` del progetto.
- Accesso al monorepo `ham_qrg_supabase` (per verificare la edge function già deployata).
- Account Supabase con anonymous sign-in funzionante (richiesto dai test integration).

## 1. Setup iniziale

```bash
# dalla root del repo
flutter pub get
```

Verificare che `pubspec.yaml` contenga già `dio`, `freezed_annotation`, `json_annotation`, `riverpod_annotation`, `fl_chart` (dovrebbero esserci tutti — sono usati da POTA/repeaters). Se manca qualcosa, aggiungerlo e ri-runnare `pub get`.

## 2. Assets richiesti

```bash
ls assets/images/sota_logo.png 2>/dev/null || echo "MISSING"
ls assets/images/sota_marker_low.png 2>/dev/null || echo "MISSING"
ls assets/images/sota_marker_mid.png 2>/dev/null || echo "MISSING"
ls assets/images/sota_marker_high.png 2>/dev/null || echo "MISSING"
```

Asset richiesti:

- `assets/images/sota_logo.png` — 28×28, alpha. Da scaricare da `sota.org.uk` (verificare licenza) o fallback icona generica montagna.
- `assets/images/sota_marker_low.png` — 48×48, triangolo verde.
- `assets/images/sota_marker_mid.png` — 48×48, triangolo ambra.
- `assets/images/sota_marker_high.png` — 48×48, triangolo blu/bianco con snowcap.

Aggiungere in `pubspec.yaml` sotto `flutter > assets` se non già coperto da wildcard.

## 3. Localizzazione

Aggiungere le seguenti chiavi in **tutti** gli ARB (`app_it.arb` è la lingua template; aggiungere copie in `app_en.arb`, `app_es.arb`, `app_fr.arb` — vincolo costituzionale).

Chiavi nuove (esempio dei valori italiani; tradurre per le altre lingue):

```jsonc
{
  "sotaTitle": "SOTA",
  "sotaListEmpty": "Nessuno spot SOTA al momento",
  "sotaLoadError": "Errore nel caricamento spot SOTA",
  "sotaRetry": "Riprova",
  "sotaSummitPursuit": "Vista verso la cima",
  "sotaLosClear": "Vista libera",
  "sotaLosObstructed": "Possibile ostruzione",
  "sotaLosObstructionAt": "Ostacolo a {distance} km, +{height} m",
  "@sotaLosObstructionAt": {
    "placeholders": {
      "distance": {"type": "String"},
      "height": {"type": "String"}
    }
  },
  "sotaPointsBadge": "{count} pt",
  "@sotaPointsBadge": {
    "placeholders": {"count": {"type": "int"}}
  },
  "sotaAltitudeMeters": "{m} m",
  "@sotaAltitudeMeters": {
    "placeholders": {"m": {"type": "int"}}
  },
  "sotaFilterAll": "Tutti",
  "sotaSortByTime": "Tempo",
  "sotaSortByDistance": "Distanza",
  "sotaFilterPoints": "Punti",
  "sotaFilterAssociation": "Paese",
  "sotaSpotQrt": "QRT",
  "sotaSummitInvalidFrom": "Cima non più valida dal {date}",
  "@sotaSummitInvalidFrom": {
    "placeholders": {"date": {"type": "String"}}
  },
  "sotaSummitRestrictions": "Accesso con restrizioni",
  "sotaPursuitNoLocation": "Attiva la posizione per vedere il profilo verso la cima",
  "sotaPursuitTooClose": "Sei praticamente sulla cima",
  "sotaPursuitTooFar": "Cima troppo distante per il profilo di terreno",
  "sotaPursuitError": "Impossibile calcolare il profilo. Riprova.",
  "sotaCopyFrequency": "Copia frequenza",
  "sotaOpenOnMap": "Apri sulla mappa",
  "sotaShare": "Condividi",
  "sotaViewAll": "Vedi tutti",
  "sotaTabDashboard": "SOTA",
  "sotaIntroEmpty": "SOTA: Summits On The Air. Inseguì i radioamatori che attivano cime montane.",
  "sotaSpotCount": "{count} spot",
  "@sotaSpotCount": {
    "placeholders": {"count": {"type": "int"}}
  }
}
```

Rigenerare:

```bash
flutter gen-l10n
```

## 4. Scaffolding feature

Creare struttura directory (parità POTA):

```bash
mkdir -p lib/src/features/sota/{data/{datasource,model,mappers,repository},domain,errors,provider/{get_sota_spots,get_sota_summit},presentation/{sota_spots_page/{controller/state,widgets},sota_spot_detail_page/{controller/state,widgets},sota_spots_map_page/widgets,widgets}}
```

## 5. Implementazione layer per layer

Ordine raccomandato (dipendenze pulite, ogni step pronto al `flutter analyze`):

### 5.1 Domain entities (no codegen)

1. `lib/src/features/sota/domain/sota_spot.dart`
2. `lib/src/features/sota/domain/sota_summit.dart`
3. `lib/src/features/sota/domain/summit_pursuit.dart`

Vedi [data-model.md](data-model.md) per gli schemi esatti.

### 5.2 DTOs + codegen

1. `lib/src/features/sota/data/model/sota_spot_model.dart`
2. `lib/src/features/sota/data/model/sota_summit_model.dart`

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5.3 Mappers e utilities

`lib/src/features/sota/data/mappers/sota_mappers.dart` — implementare:

- `spotFromModel`, `summitFromModel`
- `bandFromFrequencyMhz`
- `altitudeBand`, `pointsTier`
- `bearingDegrees` (formula `atan2`)
- `classifyLineOfSight(AltimetricProfile)` — pseudocode in [research.md#r6](research.md#r6-line-of-sight-classifier)

### 5.4 Errors

`lib/src/features/sota/errors/sota_errors.dart` — vedi data-model.md.

### 5.5 Datasource + repository

1. `lib/src/features/sota/data/datasource/sota_datasource.dart` (abstract)
2. `lib/src/features/sota/data/datasource/sota_api_datasource.dart` (Dio impl) — pattern POTA
3. `lib/src/features/sota/data/repository/sota_repository.dart` — con `_summitCache: Map<String, SotaSummit>`

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5.6 Providers

- `lib/src/features/sota/provider/get_sota_spots/get_sota_spots_provider.dart`
- `lib/src/features/sota/provider/get_sota_summit/get_sota_summit_provider.dart`

### 5.7 Estrazione widget altimetric chart (DRY)

1. Creare `lib/common/widgets/altimetric_profile_chart.dart` con il widget chart estratto da `altimetric_profile_bottom_sheet.dart` (manteniamo solo il chart + i marker + il classifier visivo, niente bottom-sheet wrapping).
2. Refactorare `lib/src/features/repeaters/presentation/detail/widgets/altimetric_profile_bottom_sheet.dart` per consumare il nuovo widget comune.
3. `flutter analyze` deve continuare a passare.

### 5.8 Theme — palette punti SOTA

Aggiungere a `lib/themes/app_colors.dart`:

```dart
class SotaPointsColors {
  static const Color tier1 = Color(0xFF94A3B8);
  static const Color tier2 = Color(0xFF64748B);
  static const Color tier4 = Color(0xFF16A34A);
  static const Color tier6 = Color(0xFFD97706);
  static const Color tier8 = Color(0xFFEA580C);
  static const Color tier10 = Color(0xFFCA8A04);

  static Color forPoints(int points) { ... }
}
```

### 5.9 Pagine

#### Lista (`sota_spots_page/`)

1. State `sota_spots_state.dart` + enum `sota_spots_sort_order.dart`
2. Controller `sota_spots_controller.dart` (pattern parità POTA)
3. Widget `sota_points_badge.dart`, `sota_altitude_badge.dart`, `sota_spot_list_item.dart`
4. Page mobile `sota_spots_page.dart` + tablet `sota_spots_tablet.dart`
5. Wrapping con `ResponsiveLayout`

#### Dettaglio (`sota_spot_detail_page/`)

1. State `sota_spot_detail_state.dart`
2. Controller `sota_spot_detail_controller.dart` con due fetch indipendenti (summit + pursuit)
3. Widget `summit_card.dart`, `summit_pursuit_section.dart` (usa `AltimetricProfileChart` comune), `summit_restrictions_banner.dart`
4. Page mobile + tablet
5. Pre-check distanza/GPS PRIMA di chiamare `getAltimetricProfileProvider`

#### Mappa (`sota_spots_map_page/`)

1. Page `sota_spots_map_page.dart` (clone POTA map)
2. Marker custom `sota_summit_marker.dart` con icona basata su `altitudeBand`

### 5.10 Routing

Estendere `lib/router/app_router.dart`:

```dart
AutoRoute(path: 'sota', page: SotaSpotsRoute.page),
AutoRoute(path: 'sota/map', page: SotaSpotsMapRoute.page),
AutoRoute(
  path: 'sota/:spotId/:summitCode',
  page: SotaSpotDetailRoute.page,
),
```

Run `build_runner` per rigenerare `app_router.gr.dart`.

### 5.11 Dashboard tab

Estendere `lib/src/features/dashboard/presentation/dashboard_page/dashboard_page.dart`:

1. Aggiungere valore `_DashboardTab.sota` all'enum.
2. Aggiungere `ButtonSegment` SOTA al `_TabSelector` con live badge.
3. Implementare `_SotaTabContent` (analogia `_PotaTabContent` esistente).
4. Aggiornare il `dashboard_controller.dart` per pre-fetchare i top 5 spot SOTA — usare `getSotaSpotsProvider` con `.take(5)`.
5. Verificare che il `dashboard_tablet.dart` riceva e mostri anche gli spot SOTA.

## 6. Build & verify

```bash
# Codegen completo
dart run build_runner build --delete-conflicting-outputs

# Localizzazioni
flutter gen-l10n

# Analisi statica
flutter analyze

# Format
dart format lib test

# Run
flutter run
```

## 7. Test

### Unit test

```bash
flutter test test/sota_mappers_test.dart
flutter test test/common/widgets/altimetric_profile_chart_test.dart
```

Coperture richieste:

- `bandFromFrequencyMhz`: tutte le bande della truth table + edge cases (0, MHz negativa, fuori range).
- `altitudeBand`: 999, 1000, 1999, 2000.
- `pointsTier`: tutti i 6 valori standard.
- `classifyLineOfSight`: caso piatto (clear), caso ostacolo singolo (obstructed con margin), caso ostacolo sotto soglia 10 m (clear).
- `bearingDegrees`: 4 direzioni cardinali da Roma a punti noti (Milano N, Bari E, Cagliari S, Genova W).

### Integration test

```bash
flutter test --tags integration test/sota_provider_test.dart
```

Vincoli: il device/emulatore deve avere rete e accesso a `api-db2.sota.org.uk` e all'istanza Supabase di staging.

### Smoke test manuale

- [ ] Aprire pagina SOTA: 200 spot caricati <2 s.
- [ ] Applicare filtri banda, modo, punti, associazione: lista si riduce coerentemente.
- [ ] Ordinare per distanza con GPS attivo: prima cima ≤ distanza della seconda.
- [ ] Aprire dettaglio di uno spot italiano: Summit Card popolata, grafico altimetrico visibile entro 2 s.
- [ ] Aprire dettaglio di uno spot americano (>500 km): grafico assente, mostra "Cima troppo distante".
- [ ] Disattivare GPS, aprire dettaglio: Summit Card visibile, sezione pursuit con invito ad attivare GPS.
- [ ] Aprire la mappa SOTA: marker triangolari con colori per fascia altitudinale.
- [ ] Toccare marker → bottom sheet → "Apri dettaglio".
- [ ] Dashboard: tab SOTA visibile, top 5 spot, "Vedi tutti" funziona, badge live se ci sono spot ≤15 min.
- [ ] **Tablet**: ripetere tutto su breakpoint ≥840 dp. Layout adattato, nessuna distorsione.
- [ ] **No regressioni**: POTA, Spot Cluster, Repeaters, Favoriti continuano a funzionare.

## 8. Commit & push

Sequenza di commit raccomandata (uno per layer):

```bash
git add lib/src/features/sota/domain
git commit -m "feat: SOTA domain entities (spot, summit, pursuit)"

git add lib/src/features/sota/data
git commit -m "feat: SOTA datasource, models, mappers, repository"

git add lib/common/widgets/altimetric_profile_chart.dart lib/src/features/repeaters/presentation/detail/widgets/altimetric_profile_bottom_sheet.dart
git commit -m "refactor: extract AltimetricProfileChart to common widgets for SOTA reuse"

git add lib/themes/app_colors.dart
git commit -m "feat: SotaPointsColors palette for tier badges"

git add lib/src/features/sota/provider lib/src/features/sota/presentation/sota_spots_page
git commit -m "feat: SOTA spots list page with filters and sort"

git add lib/src/features/sota/presentation/sota_spot_detail_page
git commit -m "feat: SOTA spot detail with Summit Pursuit (terrain profile)"

git add lib/src/features/sota/presentation/sota_spots_map_page
git commit -m "feat: SOTA spots map with altitude-banded markers"

git add lib/router/app_router.dart
git commit -m "feat: SOTA routes (/sota, /sota/map, /sota/:spotId/:summitCode)"

git add lib/src/features/dashboard
git commit -m "feat: SOTA tab in dashboard (4th tab parity with POTA)"

git add lib/l10n
git commit -m "feat: l10n keys for SOTA feature"

git add test
git commit -m "test: SOTA unit + integration tests"

git add assets/images
git commit -m "feat: SOTA logo and altitude-banded markers"
```

Ogni commit deve passare `flutter analyze`.

## 9. PR

`gh pr create --base main --title "feat: SOTA integration with Summit Pursuit terrain profile (WOW)"` con body che linka spec.md.
