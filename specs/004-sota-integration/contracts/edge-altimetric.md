# Contract — `get_altimetric_profile` Supabase Edge Function

**Status**: già deployata. Path repo backend: `ham_qrg_supabase/supabase/functions/get_altimetric_profile/`.
**Invocation**: Supabase Functions client — `_client.functions.invoke('get_altimetric_profile', body: {...})`.
**Auth**: JWT Supabase richiesto (`verifySupabaseJWT`). Gli utenti anonimi dell'app ne hanno comunque uno.

## Naming legacy

I campi `repeater_lat`/`repeater_lon` derivano dal primo caso d'uso (repeaters). Per SOTA: si passa `summit.latitude` come `repeater_lat` e `summit.longitude` come `repeater_lon`. Funzionalmente sono solo le "coordinate destinazione".

## Request

```jsonc
{
  "repeater_lat": 44.7803,        // double, [-90, 90]. Coordinate cima (destinazione)
  "repeater_lon": 7.3736,         // double, [-180, 180].
  "user_lat": 45.4642,            // double, [-90, 90]. Coordinate utente (osservatore)
  "user_lon": 9.1900,             // double, [-180, 180].
  "num_points": 100               // int optional, [10, 200]. Default 100. Numero punti campionamento.
}
```

### Validation server-side

- Tutti e 4 i campi coordinate obbligatori. Mancanza → `400 Missing required fields`.
- `repeater_lat`/`user_lat` ∈ `[-90, 90]` → altrimenti `400 Latitude must be between -90 and 90`.
- `repeater_lon`/`user_lon` ∈ `[-180, 180]` → altrimenti `400 Longitude must be between -180 and 180`.
- `num_points` clampato a `[10, 200]` server-side (no errore se fuori range, viene normalizzato).

### Client-side pre-check (FR-025, R7)

Prima di invocare la function, il client verifica:

| Condizione | Azione client |
|-----------|---------------|
| Coordinate utente non disponibili | Non invocare; `pursuitUnavailable = noUserLocation` |
| `distanceKm < 0.5` | Non invocare; `pursuitUnavailable = tooClose` |
| `distanceKm > 500` | Non invocare; `pursuitUnavailable = tooFar` |
| Summit lat/lon nulli | Non invocare; `pursuitUnavailable = summitCoordinatesMissing` |
| Tutte ok | Invocare con `num_points = 100` |

## Response

```jsonc
{
  "points": [
    {
      "lat": 44.7803,
      "lon": 7.3736,
      "elevation_m": 462.0,        // double (in metri)
      "distance_km": 0.0           // double (distanza cumulativa da repeater_lat/lon)
    },
    { "lat": 44.852, "lon": 7.518, "elevation_m": 350.2, "distance_km": 14.3 },
    // ... fino a num_points elementi
  ],
  "total_distance_km": 89.5,        // double
  "num_points": 100                 // int (effettivo)
}
```

### Note

- `points[0]` corrisponde a `repeater_*` (= summit per SOTA). `points[n-1]` corrisponde a `user_*`.
- **Ordine**: l'orientamento è "da destinazione a osservatore". Il classifier LOS lato client deve indicizzare di conseguenza (vedi R6 in research.md — `h0 = points[0]` può rappresentare la cima a seconda della convenzione client).
- `elevation_m` proviene da Open-Meteo (Copernicus DEM 90 m). Accuratezza: ±5–15 m tipica.
- `distance_km` arrotondato a 3 decimali (1 m).

### HTTP codes

| Code | Body | Significato |
|------|------|-------------|
| `200` | `ProfileResult` JSON | OK |
| `400` | `{ "error": "Missing ..." }` | Validazione fallita |
| `401` | `{ "error": "Unauthorized" }` | JWT assente o invalido |
| `500` | `{ "error": "..." }` | Errore interno (es. Open-Meteo down) |

## Client invocation (Flutter)

Esiste già:

```dart
// lib/src/features/repeaters/data/datasource/altimetric_profile_supabase_datasource.dart
final response = await _client.functions.invoke(
  'get_altimetric_profile',
  body: {
    'repeater_lat': repeaterLat,
    'repeater_lon': repeaterLon,
    'user_lat': userLat,
    'user_lon': userLon,
  },
);
```

E il provider Riverpod già esiste:

```dart
// lib/src/features/repeaters/provider/get_altimetric_profile/get_altimetric_profile_provider.dart
@riverpod
Future<AltimetricProfile> getAltimetricProfile(
  Ref ref, {
  required double repeaterLat,
  required double repeaterLon,
}) async { ... }
```

**SOTA reuse**: il dettaglio SOTA chiama lo stesso `getAltimetricProfileProvider` con i parametri summit, dopo aver superato la pre-check distanza/GPS.

## Performance budget

- Invocazione client → response: target ≤2 s al p90 in condizioni nominali (SC-002).
- Open-Meteo elevation API è il collo di bottiglia: ~500–1500 ms per 100 punti tipicamente.
- Edge function overhead: ~50–100 ms (Deno cold start raro; warm <50 ms).

## Mapping response → domain (esistente, riusato)

```
{points, total_distance_km, num_points}  → AltimetricProfileModel.fromJson
                                          → AltimetricProfileMapper.fromModel
                                          → AltimetricProfile {
                                               points: List<AltimetricProfilePoint>,
                                               totalDistanceKm,
                                               numPoints,
                                             }
```

Non si introduce nessun nuovo mapping per SOTA — il dominio `AltimetricProfile` è già consumato dal provider esistente.

## Contract test

NON re-implementato lato SOTA. La function ha già contract test in `ham_qrg_supabase/supabase/tests/` (vincolo costituzionale: backend e client testano i rispettivi lati). Il test client SOTA verifica solo l'integrazione end-to-end nel dettaglio:

```dart
testWidgets('SOTA spot detail loads Summit Pursuit successfully', (tester) async {
  // … pumpWidget di SotaSpotDetailPage con uno spot reale
  await tester.pumpAndSettle();
  expect(find.text('Vista libera'), findsOneWidget); // o "Possibile ostruzione"
}, tags: ['integration']);
```
