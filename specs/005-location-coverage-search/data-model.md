# Phase 1 — Data Model: Ricerca località / punto libero con ricezione stimata (Pro)

**Feature**: `005-location-coverage-search` · **Data**: 2026-08-26

Tutte le entità di dominio sono `@freezed` **senza** metodi JSON; la serializzazione vive nei modelli `data/model/`. Convenzione da costituzione: dominio puro, DTO separati, mapper espliciti.

---

## 1. Dominio (`lib/src/features/coverage_search/domain/`)

### `SearchPoint`

Il punto scelto dall'utente.

| Campo | Tipo | Note |
|---|---|---|
| `latitude` | `double` | validato −90…90 (FR-009) |
| `longitude` | `double` | validato −180…180 (FR-009) |
| `label` | `String` | nome località, oppure coordinate formattate se `origin == mapLongPress` |
| `origin` | `SearchPointOrigin` | `placeSearch` \| `coordinates` \| `mapLongPress` |
| `context` | `String?` | contesto amministrativo (comune/regione/nazione) per distinguere omonimi (FR-003) |

**Regola di prossimità (FR-048)**: due `SearchPoint` sono "lo stesso punto" se la distanza haversine è ≤ **200 m**. Implementata come funzione pura `bool isSamePlace(SearchPoint a, SearchPoint b)` — testabile senza I/O.

### `SearchBreadth`

Enum dell'ampiezza di ricerca (FR-024). Il valore in km alimenta `radiusKm`.

| Valore | km | Etichetta (localizzata) |
|---|---|---|
| `quick` | 80 | "Rapida" — parità con la reachability da GPS |
| `medium` | 100 | "Media" |
| `extended` | 150 | "Estesa" |

Default iniziale: `quick`. L'ultimo valore scelto è persistito (FR-026) sotto `coverage_search.breadth`.

> Non è un `int` libero: un enum chiuso impedisce che un raggio arbitrario entri nell'identità di una postazione e renda incomparabili due risultati.

### `CoverageResult`

Esito di una valutazione. **Sempre completo di tutti i modi** (FR-027): il filtro è una lente di presentazione.

| Campo | Tipo | Note |
|---|---|---|
| `point` | `SearchPoint` | |
| `breadth` | `SearchBreadth` | fa parte dell'identità del risultato |
| `computedAt` | `DateTime` | momento del calcolo |
| `entries` | `List<CoverageEntry>` | ordinate per `dbm` decrescente (FR-017) |

Derivati (getter, non campi): `reachableCount`, `entriesFor(Set<AccessMode>)` per la lente di presentazione.

### `CoverageEntry`

Riusa `ReachableEntry` esistente (`repeaters/domain/reachable/`) quando il ripetitore è in memoria; nella forma persistita tiene solo il riferimento.

| Campo | Tipo | Note |
|---|---|---|
| `repeaterId` | `String` | chiave verso la cache condivisa |
| `dbm` | `double` | intensità stimata |
| `distanceKm` | `double` | distanza dal punto |
| `reachable` | `bool` | verdetto |

> `Repeater` **non** è un campo: è risolto a runtime dalla cache condivisa (R2/R5). È la scelta che tiene il record piccolo e che abilita l'aggiornamento indiretto.

### `SavedStation`

La postazione salvata. Durata illimitata (FR-051).

| Campo | Tipo | Note |
|---|---|---|
| `id` | `String` | UUID generato alla creazione |
| `name` | `String` | modificabile, precompilato da `point.label` (FR-042) |
| `point` | `SearchPoint` | |
| `breadth` | `SearchBreadth` | conservata e mostrata (FR-026) |
| `entries` | `List<CoverageEntry>` | solo riferimenti + verdetti |
| `computedAt` | `DateTime` | data del calcolo originale |
| `lastRefreshedAt` | `DateTime` | aggiornata da refresh singolo o massivo |

**Stati** (derivati, non persistiti):

```
fresh ──(dato più vecchio > 30 giorni)──> stale ──(refresh riuscito)──> fresh
```

`stale` segnala soltanto (FR-046): non blocca la consultazione e **non** autorizza alcuna rimozione.

**Freschezza mostrata**: `min(cachedAt)` fra i ripetitori risolti, **non** `lastRefreshedAt` (R4). Con l'aggiornamento indiretto le voci divergono, e la data onesta è quella della più vecchia.

### `HydratedStation` (solo a runtime)

Composizione di `SavedStation` + i `Repeater` risolti dalla cache. Non persistita.

| Campo | Tipo |
|---|---|
| `station` | `SavedStation` |
| `repeaters` | `Map<String, CachedRepeater>` |
| `missingIds` | `Set<String>` — voci non risolte, mostrate come "non disponibile offline" senza far fallire la pagina |

### `PlaceSuggestion`

Risultato della geocodifica.

| Campo | Tipo |
|---|---|
| `label` | `String` |
| `context` | `String?` |
| `latitude` / `longitude` | `double` |

### `RecentSearch`

Cronologia locale (FR-010), tetto **10** voci, FIFO.

| Campo | Tipo |
|---|---|
| `label` | `String` |
| `latitude` / `longitude` | `double` |
| `usedAt` | `DateTime` |

---

## 2. Modelli persistiti (`data/model/`)

### `CachedRepeaterModel` — envelope della cache condivisa

Chiave: `repeater:v1:<repeaterId>` · Scadenza: **sentinella** `DateTime.utc(9999, 12, 31)` (R1, INV-2)

```jsonc
{
  "repeater": { /* Repeater serializzato per intero: frequenza, modo, accessi, toni, DMR, network */ },
  "cachedAt": "2026-08-26T10:12:00.000Z"
}
```

`cachedAt` è nel payload e non letto da `created_at`, che il pacchetto non espone (R4). Il prefisso porta una versione (`v1`) così che un cambio di forma del `Repeater` possa essere gestito con un prefisso nuovo invece che con una cancellazione.

### `SavedStationModel` — archivio dell'utente

| Chiave | Contenuto |
|---|---|
| `coverage_search.stations.index` | `["<id>", "<id>", …]` ordinati per `lastRefreshedAt` decrescente |
| `coverage_search.station.<id>` | JSON del `SavedStationModel` |
| `coverage_search.breadth` | ultimo `SearchBreadth` scelto |
| `coverage_search.recent` | fino a 10 `RecentSearch` |

Indice e record sono chiavi separate: la lista si legge senza deserializzare ogni postazione, e la corruzione di un record non porta giù l'intera lista.

**Dimensione attesa**: ~60 byte per voce → ~18 KB per una postazione estesa da 300 ripetitori; il caso tipico è 2–5 KB.

---

## 3. Regole di validazione

| Regola | Origine | Dove vive |
|---|---|---|
| Latitudine −90…90, longitudine −180…180 | FR-009 | parser coordinate, funzione pura |
| Minimo 3 caratteri per i suggerimenti | FR-002 | controller della barra |
| Debounce 350 ms sulla digitazione | FR-002 | controller della barra |
| Prossimità ≤ 200 m ⇒ proponi aggiornamento, rifiutabile | FR-048 | `isSamePlace`, funzione pura |
| Dato > 30 giorni ⇒ `stale` | FR-046 | getter su `SavedStation` |
| Cronologia recenti ≤ 10 | FR-010 | repository |
| Calcolo e salvataggio sempre su tutti i modi | FR-027 | provider: **non** passare `accessModes` |
| Ogni scrittura `repeater:` usa la sentinella | INV-2 (R1) | unico metodo di scrittura, mai chiamato altrove |

---

## 4. Relazioni

```
SavedStation ──1:N──> CoverageEntry ──repeaterId──> [cache condivisa] ──> CachedRepeaterModel ──> Repeater
     │                                                      ▲
     └── point: SearchPoint                                 │
                                                  scritta anche da
                                          getRepeaterByIdProvider (R5)
```

La freccia laterale è il cuore del disegno: la cache ha **due scrittori** (il salvataggio di una postazione e l'apertura di una qualsiasi scheda ripetitore) e **due lettori** con strategie diverse. Nessuna postazione possiede i dati di un ripetitore; tutte li condividono.
