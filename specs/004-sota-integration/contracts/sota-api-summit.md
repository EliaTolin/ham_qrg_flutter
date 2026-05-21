# Contract — SOTA Summit Detail API

**Endpoint**: `GET https://api-db2.sota.org.uk/api/summits/{summitCode}`
**Auth**: nessuna (public)
**Path parameter**: `summitCode` — formato `ASSOC/REG-NNN` (es. `I/PM-272`, `W6/SC-453`). Lo slash interno è parte del path e va passato senza encoding aggressivo.
**Content-Type response**: `application/json; charset=utf-8`

## Response

`200 OK` — JSON object.

### Schema

```jsonc
{
  "associationName": "Italy",
  "associationCode": "I",
  "regionName": "Piemonte",
  "regionCode": "PM",
  "summitCode": "I/PM-272",
  "name": "La Rocca / Rocca di Cavour",
  "notes": "",                                   // string (può essere vuota)
  "points": 1,
  "altM": 462,                                   // int — camelCase (non PascalCase qui!)
  "altFt": 1516,                                 // int — camelCase
  "activationCount": null,                       // null nella response anonima
  "activationCall": null,                        // null
  "activationDate": null,                        // null
  "gridRef1": "7.3736",                          // string (legacy SOTA — longitudine come stringa)
  "gridRef2": "44.7803",                         // string (legacy SOTA — latitudine come stringa)
  "locator": "JN34qs",                           // Maidenhead
  "myChases": null,                              // null anonimo (richiede OAuth SOTA)
  "myActivations": null,                         // null anonimo
  "latitude": 44.7803,                           // decimal
  "longitude": 7.3736,                           // decimal
  "validTo": "2099-12-31T00:00:00Z",
  "validFrom": "2017-10-01T00:00:00Z",
  "valid": true,
  "restrictionMask": false,
  "restrictionList": []                          // array di string
}
```

### Required vs Optional

| Field | Required nel DTO | Note |
|-------|------------------|------|
| `summitCode` | ✓ | |
| `name` | ✓ | |
| `associationName` / `associationCode` | ✓ | |
| `regionName` / `regionCode` | ✓ | |
| `latitude` / `longitude` | ✓ | dataset SOTA ha sempre coordinate; protezione difensiva nel mapper comunque presente |
| `altM` / `altFt` | ✓ | int |
| `points` | ✓ | |
| `locator` | ✓ | |
| `validFrom` / `validTo` / `valid` | ✓ | |
| `restrictionMask` | ✓ | |
| `restrictionList` | optional | default `[]` |
| `notes` | optional | spesso vuoto |
| `gridRef1` / `gridRef2` | optional | non usati (latitudine/longitudine come decimal sono già nel modello) |
| `activationCount` / `activationCall` / `activationDate` / `myChases` / `myActivations` | optional | sempre `null` nella response pubblica anonima — ignorati dal DTO |

### Errori

| HTTP code | Significato | Mappato in client a |
|-----------|-------------|---------------------|
| `404` | Summit code non esistente | `SotaSummitNotFound(summitCode)` |
| `5xx` | Errore SOTA backend | `SotaApiException(message, statusCode)` |
| `DioException` (timeout, no network) | Errore rete | `SotaApiException(message)` |

## Differenza notable rispetto alla response spots

I campi `AltM`/`AltFt` nella response **spots** sono PascalCase. Nella response **summit** sono `altM`/`altFt` camelCase. Il DTO `SotaSummitModel` NON usa `@JsonKey(name: ...)` su questi campi — solo il DTO `SotaSpotModel` lo fa per i campi PascalCase. Questa è una stranezza dell'API SOTA che il `data-model.md` documenta.

## Mapping client → domain

```
SotaSummitModel.fromJson(rawJson)
  → SotaMappers.summitFromModel(model)
  → SotaSummit(
      code: model.summitCode,
      name: model.name,
      associationName: model.associationName,
      associationCode: model.associationCode,
      regionName: model.regionName,
      regionCode: model.regionCode,
      latitude: model.latitude,
      longitude: model.longitude,
      altitudeM: model.altM,
      altitudeFt: model.altFt,
      points: model.points,
      locator: model.locator,
      validFrom: DateTime.parse(model.validFrom),
      validTo: DateTime.parse(model.validTo),
      valid: model.valid,
      hasRestrictions: model.restrictionMask,
      restrictions: model.restrictionList,
      notes: model.notes?.isEmpty == true ? null : model.notes,
    )
```

## Caching (client-side)

Una cima è di fatto immutabile (`validTo` ~99 anni). Il repository SOTA mantiene `Map<String, SotaSummit>` in memoria — la stessa cima richiesta più volte nella sessione viene servita dalla cache senza round-trip. Vedi `pota_repository.dart` per il pattern identico applicato ai POTA parks.

## Contract test (integration)

`test/sota_provider_test.dart`:

```dart
test('getSummit("I/PM-272") returns valid summit with coordinates', () async {
  final repo = container.read(sotaRepositoryProvider);
  final summit = await repo.getSummit('I/PM-272');
  expect(summit.code, 'I/PM-272');
  expect(summit.name, contains('Rocca'));
  expect(summit.latitude, closeTo(44.78, 0.01));
  expect(summit.longitude, closeTo(7.37, 0.01));
  expect(summit.altitudeM, 462);
  expect(summit.points, 1);
  expect(summit.valid, isTrue);
});

test('getSummit with invalid code throws SotaSummitNotFound', () async {
  final repo = container.read(sotaRepositoryProvider);
  await expectLater(
    () => repo.getSummit('XX/INVALID-999'),
    throwsA(isA<SotaSummitNotFound>()),
  );
});
```
