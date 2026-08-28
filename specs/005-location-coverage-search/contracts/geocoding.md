# Contract — Geocodifica delle località

Fornitore: **Mapbox Geocoding v6**, chiamato via `Dio` con il token già configurato in `AppConfigs.getMapboxAccessToken()`. Nessuna nuova dipendenza, nessuna nuova credenziale (R6).

## Richiesta

```
GET https://api.mapbox.com/search/geocode/v6/forward
  ?q=<query>
  &limit=5
  &language=<locale app>
  &access_token=<token>
```

| Vincolo | Valore | Origine |
|---|---|---|
| Lunghezza minima query | 3 caratteri | FR-002 |
| Debounce | 350 ms | FR-002 |
| Risultati | 5 | FR-002 |
| Richiesta in volo superata | annullata via `CancelToken` | contenimento costo + coerenza dei suggerimenti |

## Risposta → `PlaceSuggestion`

| Campo API | Campo dominio | Note |
|---|---|---|
| `features[].properties.name` | `label` | |
| `features[].properties.place_formatted` | `context` | distingue gli omonimi (FR-003) |
| `features[].geometry.coordinates[1]` | `latitude` | |
| `features[].geometry.coordinates[0]` | `longitude` | ordine GeoJSON: **lon, lat** |

## Comportamento verificato: Mapbox non restituisce quasi mai zero risultati

Riscontro dell'integration test contro l'API reale: su `"zzzqqqxxxwwwvvv non esiste questo posto"` l'endpoint aggancia il frammento `posto` e restituisce **Postoloprty, Poston, Postomino, Poštorná, La Postolle**. Su una query contenente cifre aggancia un civico e propone un indirizzo negli Stati Uniti.

Conseguenza di prodotto, che corregge un'assunzione della spec: lo stato vuoto "nessun risultato" **si vedrà di rado**. Il fallimento reale da gestire non è l'assenza di suggerimenti, ma la loro **irrilevanza**.

Quindi la via d'uscita — inserire coordinate oppure tenere premuto sulla mappa — deve restare **sempre visibile** nel pannello dei suggerimenti, e non comparire soltanto quando la lista è vuota. Lo stato vuoto resta comunque implementato: si presenta con query troppo corte e nei casi di errore.

Nessun filtro di rilevanza lato client: scartare risultati confrontando la stringa digitata con l'etichetta rischierebbe di eliminare corrispondenze legittime (esonimi, toponimi in lingua diversa, abbreviazioni).

## Errori

| Caso | Comportamento |
|---|---|
| Nessun risultato (raro, vedi sopra) | Stato vuoto con suggerimento di usare coordinate o pressione prolungata |
| Rete assente | Messaggio non bloccante + scorciatoia alle postazioni salvate (che restano consultabili) |
| Errore HTTP / timeout | Messaggio recuperabile con azione di ripetizione; la mappa non si muove |

## Coordinate digitate — nessuna chiamata di rete

Riconosciute localmente prima di interrogare la geocodifica:

```
^\s*(-?\d{1,2}(?:[.,]\d+)?)\s*[,\s]\s*(-?\d{1,3}(?:[.,]\d+)?)\s*$
```

Validazione: latitudine −90…90, longitudine −180…180 (FR-009). Fuori range ⇒ messaggio esplicito e **la vista mappa non cambia**. Il separatore decimale accetta sia `.` sia `,` purché il separatore fra i due valori resti distinguibile.

## Nota di costo

La barra è funzionante anche per gli utenti non Pro (FR-011), quindi genera traffico di geocodifica fatturabile da parte di utenti che non pagano. Il contenimento è affidato ai tre vincoli sopra. Nessun tetto rigido è stato introdotto: non ci sono ancora dati d'uso su cui tararlo. **Da rivalutare dopo il primo mese** con i dati del funnel.
