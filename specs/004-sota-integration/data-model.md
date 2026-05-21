# Data Model — SOTA Integration

**Feature**: 004-sota-integration
**Date**: 2026-05-19

Tutti i modelli DTO sono `@freezed` con `fromJson` generato da `json_serializable`. Tutte le entità di dominio sono `@freezed` puro (nessuna serializzazione). Tutti gli state sono `@freezed`.

---

## DTO (data/model/)

### `SotaSpotModel`

File: `lib/src/features/sota/data/model/sota_spot_model.dart`

```dart
@freezed
abstract class SotaSpotModel with _$SotaSpotModel {
  const factory SotaSpotModel({
    required int id,
    required String timeStamp,            // ISO 8601 UTC, suffisso "Z"
    required String activatorCallsign,
    String? activatorName,
    required String summitCode,
    required String summitName,
    @JsonKey(name: 'AltM') required int altM,
    @JsonKey(name: 'AltFt') required int altFt,
    required int points,
    required double frequency,            // MHz
    required String mode,                 // "SSB" | "CW" | "FM" | "DATA" | …
    String? comments,
    String? type,                         // "NORMAL" | "QRT" | null
    String? callsign,                     // spotter callsign (può essere "RBNHOLE", "SOTAWatch", o un OM)
    int? userID,                          // logging only
    String? epoch,                        // logging only (UUID)
  }) = _SotaSpotModel;

  factory SotaSpotModel.fromJson(Map<String, dynamic> json) =>
      _$SotaSpotModelFromJson(json);
}
```

**Validation note**: i campi `userID` ed `epoch` sono opzionali nel DTO solo perché non li usiamo — l'API li fornisce sempre. Tutti gli altri campi obbligatori riflettono garanzie API.

---

### `SotaSummitModel`

File: `lib/src/features/sota/data/model/sota_summit_model.dart`

```dart
@freezed
abstract class SotaSummitModel with _$SotaSummitModel {
  const factory SotaSummitModel({
    required String summitCode,
    required String name,
    required String associationName,
    required String associationCode,
    required String regionName,
    required String regionCode,
    required double latitude,
    required double longitude,
    required int altM,
    required int altFt,
    required int points,
    required String locator,              // Maidenhead (es. "JN34qs")
    required String validFrom,            // ISO 8601 UTC
    required String validTo,              // ISO 8601 UTC
    required bool valid,
    required bool restrictionMask,
    @Default(<String>[]) List<String> restrictionList,
    String? notes,
    String? gridRef1,                     // longitudine come stringa (legacy SOTA)
    String? gridRef2,                     // latitudine come stringa (legacy SOTA)
  }) = _SotaSummitModel;

  factory SotaSummitModel.fromJson(Map<String, dynamic> json) =>
      _$SotaSummitModelFromJson(json);
}
```

**Discarded fields from API response**: `activationCount`, `activationCall`, `activationDate`, `myChases`, `myActivations` — sono sempre `null` nella response anonima e fuori scope MVP (richiederebbero OAuth SOTA).

---

## Domain entities (domain/)

### `SotaSpot`

File: `lib/src/features/sota/domain/sota_spot.dart`

```dart
@freezed
abstract class SotaSpot with _$SotaSpot {
  const factory SotaSpot({
    required int id,
    required DateTime timestamp,          // toLocal() applicato in mapper
    required String activator,
    String? activatorName,
    required String summitCode,
    required String summitName,
    required int altitudeM,
    required int altitudeFt,
    required int points,
    required double frequencyMhz,
    required String mode,
    String? comments,
    required SotaSpotType type,
    String? spotter,
  }) = _SotaSpot;
}

enum SotaSpotType { normal, qrt }
```

**Mapping `type` da API**: `"NORMAL"` → `SotaSpotType.normal`; `"QRT"` → `SotaSpotType.qrt`; qualsiasi altro valore (incluso `null`) → `SotaSpotType.normal` con log Talker.

---

### `SotaSummit`

File: `lib/src/features/sota/domain/sota_summit.dart`

```dart
@freezed
abstract class SotaSummit with _$SotaSummit {
  const factory SotaSummit({
    required String code,
    required String name,
    required String associationName,
    required String associationCode,
    required String regionName,
    required String regionCode,
    required double latitude,
    required double longitude,
    required int altitudeM,
    required int altitudeFt,
    required int points,
    required String locator,
    required DateTime validFrom,
    required DateTime validTo,
    required bool valid,
    required bool hasRestrictions,
    @Default(<String>[]) List<String> restrictions,
    String? notes,
  }) = _SotaSummit;
}
```

---

### `SummitPursuit` (result della WOW feature)

File: `lib/src/features/sota/domain/summit_pursuit.dart`

```dart
@freezed
abstract class SummitPursuit with _$SummitPursuit {
  const factory SummitPursuit({
    required AltimetricProfile profile,    // entità esistente (riusata)
    required double distanceKm,
    required double bearingDegrees,        // 0–360
    required int elevationDeltaM,          // summit.altitudeM - user.elevationM (può essere negativo se utente più alto)
    required LineOfSight lineOfSight,
  }) = _SummitPursuit;
}

@freezed
abstract class LineOfSight with _$LineOfSight {
  const factory LineOfSight({
    required bool clear,                   // true se LOS geometrica libera
    int? obstructionElevationM,            // quota max ostacolo (m) se clear=false
    double? obstructionDistanceKm,         // distanza dell'ostacolo da utente
    int? obstructionMarginM,               // di quanto l'ostacolo supera la LOS (m)
  }) = _LineOfSight;
}
```

**Reuse**: `AltimetricProfile` è il dominio entity già esistente in `lib/src/features/repeaters/domain/altimetric_profile/altimetric_profile.dart`. NON duplichiamo. La feature SOTA importa il tipo come-è.

**Computation**: tutti i campi sono derivati client-side. `distanceKm` = `profile.totalDistanceKm`. `bearingDegrees` = formula `atan2` standard tra coordinate. `elevationDeltaM` = `summit.altitudeM - profile.points.first.elevationM`. `lineOfSight` = R6 classifier in [research.md](research.md#r6-line-of-sight-classifier).

---

## State classes (presentation/*/controller/state/)

### `SotaSpotsState`

File: `lib/src/features/sota/presentation/sota_spots_page/controller/state/sota_spots_state.dart`

```dart
@freezed
abstract class SotaSpotsState with _$SotaSpotsState {
  const factory SotaSpotsState({
    @Default(<SotaSpot>[]) List<SotaSpot> spots,
    @Default(<SotaSpot>[]) List<SotaSpot> filteredSpots,
    @Default(false) bool hasLoadError,
    @Default(false) bool isRefreshing,
    String? selectedBand,                  // es. "20m", null = nessun filtro
    String? selectedMode,                  // es. "SSB", null = nessun filtro
    int? minPoints,                        // filtro punti minimi, null = nessun filtro
    String? selectedAssociation,           // associationCode (es. "I"), null = nessun filtro
    @Default(SotaSpotsSortOrder.time) SotaSpotsSortOrder sortOrder,
    @Default(<String, double>{}) Map<String, double> distanceBySummitCode,
    @Default(<String>[]) List<String> availableBands,
    @Default(<String>[]) List<String> availableModes,
    @Default(<String>[]) List<String> availableAssociations,
  }) = _SotaSpotsState;
}

enum SotaSpotsSortOrder { time, distance }
```

**State transitions**:

```
[initial]
   ↓ build() → fetch spots
[AsyncData(spots=N, filteredSpots=N, hasLoadError=false)]
   ↓ filterByBand(band)
[AsyncData(.., selectedBand=band, filteredSpots=subset)]
   ↓ refresh() → success
[AsyncData(.., spots=N', filteredSpots=N'', hasLoadError=false)]
   ↓ refresh() → failure
[AsyncData(.., hasLoadError=true)]    // ⚠ NON AsyncError; FR-070
   ↓ refresh() → success
[AsyncData(.., hasLoadError=false)]
```

**Constraint costituzionale**: errore di mutazione NON sostituisce `AsyncData` con `AsyncError` (CLAUDE.md error-handling pattern).

---

### `SotaSpotDetailState`

File: `lib/src/features/sota/presentation/sota_spot_detail_page/controller/state/sota_spot_detail_state.dart`

```dart
@freezed
abstract class SotaSpotDetailState with _$SotaSpotDetailState {
  const factory SotaSpotDetailState({
    required SotaSpot spot,                // sempre presente (passato come argument al provider)
    SotaSummit? summit,                    // lazy: null finché non caricato
    @Default(false) bool summitLoading,
    @Default(false) bool summitError,
    SummitPursuit? pursuit,                // lazy: null finché non caricato
    @Default(false) bool pursuitLoading,
    @Default(false) bool pursuitError,
    PursuitUnavailableReason? pursuitUnavailable,  // motivo se non calcolabile
  }) = _SotaSpotDetailState;
}

enum PursuitUnavailableReason {
  noUserLocation,           // utente non ha concesso GPS
  tooClose,                 // distanza <500 m
  tooFar,                   // distanza >500 km
  summitCoordinatesMissing, // edge case
}
```

**Lazy independent loading**: la pagina è AsyncData(initial state) dal primo frame. I due fetch (summit detail + altimetric profile) corrono in parallelo e ognuno aggiorna in modo indipendente i propri flag (FR-071). Il fallimento di uno NON impatta l'altro.

**State transitions**:

```
[AsyncData(spot, summitLoading=true, pursuitLoading=true)]
   ↓ getSotaSummit(code) → success
[AsyncData(.., summit=S, summitLoading=false)]
   ↓ computeSummitPursuit() → success
[AsyncData(.., pursuit=P, pursuitLoading=false)]

[AsyncData(.., summitLoading=true)]
   ↓ getSotaSummit(code) → failure
[AsyncData(.., summitLoading=false, summitError=true)]   // banner riprova, no crash pagina

[AsyncData(.., pursuitLoading=true)]
   ↓ no GPS → distance unknown
[AsyncData(.., pursuitLoading=false, pursuitUnavailable=noUserLocation)]
```

---

## Mappers (data/mappers/)

File: `lib/src/features/sota/data/mappers/sota_mappers.dart`

### Funzioni esposte

```dart
class SotaMappers {
  SotaSpot spotFromModel(SotaSpotModel model);
  SotaSummit summitFromModel(SotaSummitModel model);
}

// Pure utilities (no class, standalone for testability)
String? bandFromFrequencyMhz(double mhz);     // → "160m" | "80m" | … | "70cm" | null
AltitudeBand altitudeBand(int meters);         // enum {low, mid, high}
SotaPointsTier pointsTier(int points);         // enum {tier1, tier2, tier4, tier6, tier8, tier10}
LineOfSight classifyLineOfSight(AltimetricProfile profile);
double bearingDegrees(double fromLat, double fromLon, double toLat, double toLon);

enum AltitudeBand { low, mid, high }
enum SotaPointsTier { tier1, tier2, tier4, tier6, tier8, tier10 }
```

### `bandFromFrequencyMhz` truth table

| MHz range | Output |
|-----------|--------|
| 1.8–2.0 | "160m" |
| 3.5–4.0 | "80m" |
| 5.3–5.5 | "60m" |
| 7.0–7.3 | "40m" |
| 10.1–10.15 | "30m" |
| 14.0–14.35 | "20m" |
| 18.068–18.168 | "17m" |
| 21.0–21.45 | "15m" |
| 24.89–24.99 | "12m" |
| 28.0–29.7 | "10m" |
| 50.0–54.0 | "6m" |
| 144.0–148.0 | "2m" |
| 420.0–450.0 | "70cm" |
| altrove | `null` |

Identico a `bandFromFrequencyKhz` di POTA modulo unità.

### `altitudeBand` truth table

| Meters | Band |
|--------|------|
| <1000 | `low` |
| 1000–1999 | `mid` |
| ≥2000 | `high` |

### `pointsTier` mapping diretto

| points | tier |
|--------|------|
| 1 | tier1 |
| 2 | tier2 |
| 4 | tier4 |
| 6 | tier6 |
| 8 | tier8 |
| 10 | tier10 |
| altro (es. 3, 5) | tier più vicino arrotondato per difetto |

---

## Errors

File: `lib/src/features/sota/errors/sota_errors.dart`

```dart
class SotaApiException implements Exception {
  const SotaApiException(this.message, {this.statusCode});
  final String message;
  final int? statusCode;
}

class SotaSummitNotFound extends SotaApiException {
  const SotaSummitNotFound(String code)
      : super('Summit $code not found', statusCode: 404);
}
```

---

## Cache strategy

**Layer**: `SotaRepository` (singleton-ish via `@Riverpod(keepAlive: true)`).

```dart
class SotaRepository {
  final Map<String, SotaSummit> _summitCache = {};
  // niente cache spot persistente; gli spot sono refetched ad ogni invalidate
}
```

- TTL: nessuno per summit (i dati cima sono praticamente immutabili — `validTo` ~99 anni). La cache vive per la sessione utente.
- Invalidation: `ref.invalidate(sotaRepositoryProvider)` resetta tutto. Caso d'uso raro (logout o memory pressure).

---

## Riepilogo file generati

| File | Tipo | LOC stima |
|------|------|-----------|
| `data/model/sota_spot_model.dart` | DTO freezed | ~25 |
| `data/model/sota_summit_model.dart` | DTO freezed | ~30 |
| `domain/sota_spot.dart` | Entity freezed | ~20 |
| `domain/sota_summit.dart` | Entity freezed | ~25 |
| `domain/summit_pursuit.dart` | Entity freezed | ~30 |
| `data/mappers/sota_mappers.dart` | Functions | ~120 |
| `errors/sota_errors.dart` | Exceptions | ~15 |
| `presentation/.../state/sota_spots_state.dart` | State freezed | ~25 |
| `presentation/.../state/sota_spots_sort_order.dart` | enum | ~5 |
| `presentation/.../state/sota_spot_detail_state.dart` | State freezed | ~25 |

Totale modelli/state/mapper: ~320 LOC core (esclusi generated `.g.dart` / `.freezed.dart`).
