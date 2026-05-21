# Contract — SOTA Spots API

**Endpoint**: `GET https://api-db2.sota.org.uk/api/spots/200/all/all`
**Auth**: nessuna (public)
**Rate limit**: non documentato. Convenzione interna: 1 chiamata per refresh manuale utente.
**Content-Type response**: `application/json; charset=utf-8`

## Path parameters (literal — non parametrizzati per MVP)

| Segment | Valore usato | Significato |
|---------|--------------|-------------|
| `200` | `200` | Numero massimo di spot da ritornare (cap server). |
| `all` | `all` | Filtro associazione (tutti). |
| `all` | `all` | Filtro regione (tutti). |

Per MVP si chiama sempre con `/api/spots/200/all/all`. Filtraggio per associazione/regione è lato client (FR-011, FR-015).

## Response

`200 OK` — array JSON di spot objects.

### Schema (ogni elemento)

```jsonc
{
  "id": 312182,                                          // int, identificatore univoco
  "userID": 11703,                                       // int (logging only)
  "timeStamp": "2026-05-19T19:52:39.564904Z",            // ISO 8601 UTC
  "comments": "[SOTA Activator] last call",              // string|null
  "callsign": "RBNHOLE",                                 // string (chi posta lo spot; "RBNHOLE" = bot Reverse Beacon)
  "summitCode": "I/PM-272",                              // string, riferimento canonico cima
  "activatorCallsign": "I1WKN",                          // string
  "activatorName": "Beppe",                              // string ("Unrecognized" se non in DB SOTA)
  "frequency": 7.115,                                    // float MHz
  "mode": "SSB",                                         // string ("SSB"|"CW"|"FM"|"DATA"|…)
  "summitName": "La Rocca / Rocca di Cavour",            // string
  "AltM": 462,                                           // int (PascalCase!)
  "AltFt": 1516,                                         // int (PascalCase!)
  "points": 1,                                           // int 1|2|4|6|8|10
  "type": "NORMAL",                                      // string ("NORMAL"|"QRT"|null)
  "epoch": "d476df14-ff6c-40d1-964a-ae562f4c81c9"        // UUID string (logging only)
}
```

### Required vs Optional

| Field | Required | Note |
|-------|----------|------|
| `id` | ✓ | |
| `timeStamp` | ✓ | sempre presente, formato ISO 8601 con Z |
| `activatorCallsign` | ✓ | |
| `summitCode` | ✓ | |
| `summitName` | ✓ | |
| `AltM` | ✓ | int (no decimali) |
| `AltFt` | ✓ | int |
| `points` | ✓ | |
| `frequency` | ✓ | float MHz |
| `mode` | ✓ | |
| `callsign` | ✓ | sempre presente (anche per bot) |
| `activatorName` | optional | può essere `"Unrecognized"` se non noto |
| `comments` | optional | può essere `null` o stringa vuota |
| `type` | optional | `null` trattato come `"NORMAL"` |
| `userID` | ✓ | non usato, ignorato dal mapper |
| `epoch` | ✓ | non usato, ignorato dal mapper |

### Errori

L'API ritorna `200` con array vuoto quando non ci sono spot. Errori di rete o `5xx` vengono propagati come `DioException` e mappati a `SotaApiException` nel datasource.

## Esempio response (troncato)

```json
[
  {
    "id": 312182,
    "userID": 11703,
    "timeStamp": "2026-05-19T19:52:39.564904Z",
    "comments": "[SOTA Activator] last call",
    "callsign": "I1WKN",
    "summitCode": "I/PM-272",
    "activatorCallsign": "I1WKN",
    "activatorName": "Beppe",
    "frequency": 7.115,
    "mode": "SSB",
    "summitName": "La Rocca / Rocca di Cavour",
    "AltM": 462,
    "AltFt": 1516,
    "points": 1,
    "type": "NORMAL",
    "epoch": "d476df14-ff6c-40d1-964a-ae562f4c81c9"
  },
  { ...altri 199... }
]
```

## Mapping client → domain

```
SotaSpotModel.fromJson(rawJson)
  → SotaMappers.spotFromModel(model)
  → SotaSpot(
      id: model.id,
      timestamp: DateTime.parse(model.timeStamp).toLocal(),
      activator: model.activatorCallsign,
      activatorName: model.activatorName,
      summitCode: model.summitCode,
      summitName: model.summitName,
      altitudeM: model.altM,
      altitudeFt: model.altFt,
      points: model.points,
      frequencyMhz: model.frequency,
      mode: model.mode,
      comments: model.comments,
      type: _parseType(model.type),     // "QRT" → SotaSpotType.qrt; else normal
      spotter: model.callsign,
    )
```

## Contract test (integration)

`test/sota_provider_test.dart`:

```dart
test('getActiveSpots returns spots with required fields', () async {
  final repo = container.read(sotaRepositoryProvider);
  final spots = await repo.getActiveSpots();
  expect(spots, isNotEmpty);
  for (final s in spots.take(5)) {
    expect(s.id, isPositive);
    expect(s.summitCode, isNotEmpty);
    expect(s.altitudeM, isPositive);
    expect(s.frequencyMhz, greaterThan(0));
    expect(s.mode, isNotEmpty);
  }
});
```
