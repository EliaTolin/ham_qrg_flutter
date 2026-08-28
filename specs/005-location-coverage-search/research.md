# Phase 0 — Research: Ricerca località / punto libero con ricezione stimata (Pro)

**Feature**: `005-location-coverage-search` · **Data**: 2026-08-26

Ogni decisione qui è stata presa leggendo il codice reale (app e pacchetto), non la documentazione di superficie. Dove il comportamento verificato contraddice l'assunzione di partenza, è segnalato esplicitamente.

---

## R1 — `remote_caching`: cosa fa davvero, e cosa significa "scadenza infinita"

**Fonte**: sorgente locale `~/Desktop/Aurora/Progetti/remote_caching` (autore: Elia Tolin), versione sorgente 1.0.18, pub-cache fino a 1.0.19.

### Fatti verificati nel sorgente

| Fatto | Riferimento | Conseguenza |
|---|---|---|
| Lo schema è `cache(key TEXT PRIMARY KEY, data TEXT, created_at INTEGER, expires_at INTEGER NOT NULL)` | `remote_caching_impl.dart:550` | **Non esiste una rappresentazione di "non scade mai"**: ogni riga deve avere una data di scadenza |
| `init()` chiama `_cleanupExpiredEntries()`, che esegue `DELETE FROM cache WHERE expires_at < now` | `:172`, `:565` | Le voci scadute vengono **fisicamente cancellate** all'avvio dell'app |
| `_getCachedData` restituisce `null` se `expires_at <= now` | `:373` | Una voce scaduta è un miss ancora prima di essere cancellata |
| `clearCache()` esegue `DELETE FROM cache` senza filtri | `:578` | Una singola chiamata distruggerebbe tutti i dati offline della feature |
| `_executeNetworkFirst` in caso di errore rete usa `_getCachedDataWithFallback`, che **ignora la scadenza** | `:340` | Il fallback offline funziona anche su voci scadute, ma solo finché non sono state cancellate da un `init()` |
| `created_at` esiste in tabella ma **non è esposto** da alcuna API pubblica | `getCacheStats()` lo aggrega soltanto | La freschezza per singola voce va incapsulata nel payload |

### Decision

**"Scadenza infinita" si implementa con una sentinella temporale**: `cacheExpiring: DateTime.utc(9999, 12, 31)`. Non esiste un flag nativo; è l'unico modo per rendere `expires_at < now` sempre falso e quindi neutralizzare sia `_cleanupExpiredEntries()` sia il miss per scadenza.

Ne discendono **due invarianti non negoziabili** per l'app, perché la sentinella protegge dalla scadenza ma non dalla cancellazione esplicita:

- **INV-1**: `RemoteCaching.instance.clearCache()` NON deve essere chiamato in nessun punto dell'app. Per invalidare altri domini si usa `clearCacheByPrefix()` sul prefisso di quel dominio.
- **INV-2**: ogni voce sotto il prefisso `repeater:` si scrive **sempre** con la sentinella. Una singola scrittura con `cacheDuration` di default (1 ora) renderebbe quel ripetitore cancellabile al riavvio successivo, bucando l'offline di ogni postazione che lo contiene.

**Rationale**: è la lettura corretta di "credenza infinita" indicata dal richiedente, ed è compatibile con FR-051 (nessuna rimozione automatica) purché le due invarianti siano rispettate.

**Alternatives considered**:
- *Estendere il pacchetto con `expires_at NULL` = mai*: sarebbe la soluzione pulita (il pacchetto è nostro), ma richiede una migrazione di schema, una release e un allineamento di versione fuori dallo scope di questa feature. **Da valutare come miglioramento successivo**: renderebbe INV-2 non necessaria.
- *TTL lungo (es. 10 anni) invece della sentinella*: equivalente in pratica, ma una data finita invita a essere "aggiustata" e reintroduce silenziosamente il rischio. La sentinella dichiara l'intento.

---

## R2 — Separazione fra dato dell'utente e dato rigenerabile

**Decision**: due archivi distinti, con responsabilità che non si sovrappongono.

| | Postazione salvata | Payload ripetitore |
|---|---|---|
| **Natura** | Dato **dell'utente** (l'ha creata lui, non è ricostruibile) | Dato **rigenerabile e condiviso** (viene dal backend) |
| **Dove** | Archivio proprio (`StorageClient`, vedi R3) | `remote_caching`, prefisso `repeater:v1:` |
| **Scadenza** | Nessuna: FR-051 | Sentinella infinita (R1) |
| **Contenuto** | Punto, nome, livello di ampiezza, data, e per ogni voce `{repeaterId, dbm, distanceKm, reachable}` | Entità `Repeater` completa + `cachedAt` |

**Rationale**: è l'architettura descritta dal richiedente ed è anche quella corretta. Il verdetto di raggiungibilità è **specifico di quel punto** e non ha senso fuori dalla postazione; i dati operativi del ripetitore sono **gli stessi per tutti** e vanno condivisi. La conseguenza è che 5 postazioni nella stessa regione tengono **una sola copia** di ciascun ripetitore invece di cinque.

**Effetto sulla dimensione**: una postazione "estesa" con 300 ripetitori pesa ~18 KB (solo ID + verdetti) invece dei ~400 KB che costerebbe duplicare i payload. È ciò che rende praticabile l'archivio a chiave-valore di R3.

**Alternatives considered**:
- *Snapshot completo dentro ogni postazione*: massimo isolamento (nessuna invariante da rispettare, immune a `clearCache()`), ma duplica i dati, li congela al momento del salvataggio e rinuncia all'aggiornamento indiretto di R5 — cioè al beneficio principale del disegno. Rifiutata.
- *Tutto dentro `remote_caching`, postazioni comprese*: viola FR-051, perché le postazioni finirebbero in una tabella che `clearCache()` è progettato per svuotare.

---

## R3 — Archivio delle postazioni salvate

**Decision**: `StorageClient` già esistente (`lib/clients/storage/`, implementazione SharedPreferences), con una chiave indice `coverage_search.stations.index` (lista di ID) e una chiave per postazione `coverage_search.station.<id>` contenente il JSON del record.

**Rationale**: grazie a R2 il record è piccolo (~18 KB nel caso peggiore, tipicamente 2–5 KB). Con 20 postazioni si resta sotto i ~400 KB, gestibile da SharedPreferences. Nessuna nuova dipendenza, nessun database da versionare, e l'astrazione `StorageClient` è già il punto di accesso previsto dall'architettura.

**Alternatives considered**:
- *Tabella `sqflite` dedicata*: più scalabile e con query vere, ma introduce una dipendenza diretta (oggi `sqflite` entra solo in modo transitivo da `remote_caching`) e un DB con migrazioni proprie. Sproporzionato per una lista che l'utente terrà nell'ordine delle decine. **Percorso di migrazione documentato** in caso l'uso reale smentisca la stima.
- *`remote_caching` per le postazioni*: escluso da FR-051 (vedi R2).

**Rischio noto**: su Android SharedPreferences carica tutte le chiavi in memoria all'avvio. La stima resta ampiamente sotto soglia, ma se in futuro si consentissero postazioni molto più numerose la valutazione va rifatta.

---

## R4 — Freschezza per singola voce

**Decision**: incapsulare il payload in un envelope serializzato, `CachedRepeaterModel { Repeater repeater; DateTime cachedAt }`, invece di affidarsi a `created_at` della tabella.

**Rationale**: `created_at` esiste ma non è leggibile dall'API pubblica del pacchetto (solo aggregato in `getCacheStats()`). Senza envelope non si potrebbe soddisfare FR-046 (segnalare il dato oltre i 30 giorni) né mostrare la data corretta quando una postazione contiene ripetitori aggiornati in momenti diversi.

**Conseguenza sulla UI**: la data mostrata per una postazione è quella **della voce più vecchia** fra i suoi ripetitori, non la data del salvataggio — è l'unica onesta, perché con l'aggiornamento indiretto (R5) le voci divergono nel tempo.

---

## R5 — Aggiornamento indiretto: il meccanismo richiesto dal richiedente

**Scenario da soddisfare**: una postazione salvata a ottobre contiene il ripetitore X. A febbraio l'utente apre la scheda di X dalla lista o dalla mappa, fuori dalla postazione. Quando in seguito riaprirà la postazione, X deve mostrare i dati di febbraio senza che nessuno abbia rieseguito il calcolo.

**Decision**: un'unica chiave di cache per ripetitore, letta con **due strategie diverse a seconda del contesto**.

| Contesto | Strategia | Effetto |
|---|---|---|
| Scheda ripetitore aperta ovunque nell'app (`getRepeaterByIdProvider`) | `CacheStrategy.networkFirst` + sentinella | Online: prende da Supabase e **riscrive** la voce → tutte le postazioni che contengono X ne beneficiano. Offline: `_getCachedDataWithFallback` restituisce la copia conservata |
| Rendering di una postazione salvata | `CacheStrategy.cacheFirst` + sentinella | La voce **non scade mai**, quindi `cacheFirst` la restituisce sempre e **non tocca mai la rete**: apertura istantanea, nessuna richiesta per 300 ripetitori, funziona identica online e offline |

Il punto elegante è che la sentinella non serve solo alla durabilità: rende `cacheFirst` un accesso puramente locale e deterministico, che è esattamente ciò che serve per rendere una postazione offline. Le due strategie condividono chiave e formato, quindi l'aggiornamento fatto da una è visto dall'altra senza alcun codice di sincronizzazione.

**Write-through al salvataggio**: al momento di salvare una postazione, ogni ripetitore del risultato viene scritto in cache con la sentinella. Così una postazione è **autosufficiente per costruzione** dal primo istante, senza dipendere da visite precedenti.

**Degradazione difensiva**: se alla lettura una voce manca (INV-1 violata, disinstallazione parziale, corruzione), quel singolo ripetitore si mostra come "dato non disponibile offline" e **la postazione resta consultabile**. Non si fa fallire l'intera schermata per una voce mancante.

**Alternatives considered**:
- *`forceRefresh: true` sulla scheda ripetitore*: equivalente online, ma perde il fallback offline che `networkFirst` fornisce gratis. Rifiutata.
- *Refresh in background di tutte le voci*: fuori scope (escluso esplicitamente dalla spec) e sprecherebbe rete su dati che l'utente non sta guardando.

---

## R6 — Geocodifica delle località

**Fatto verificato**: `mapbox_maps_flutter` (2.25.0 in pub-cache) **non espone alcuna API di geocodifica** — nessuna occorrenza di `geocod` in `lib/`. Il Search SDK di Mapbox è un prodotto separato.

**Decision**: chiamata diretta all'endpoint **Mapbox Geocoding v6 forward** via `Dio`, riusando il token già configurato in `AppConfigs.getMapboxAccessToken()`. Debounce 350 ms, minimo 3 caratteri, `limit=5`, lingua dalla locale dell'app.

**Rationale**: nessuna nuova dipendenza, credenziale già presente e già pagata, controllo completo su debounce e cancellazione delle richieste in volo — che è anche la leva di contenimento dei costi, dato che la barra è aperta ai non Pro (FR-011).

**Alternatives considered**:
- *`mapbox_search`*: pacchetto di terze parti che avvolge la stessa API REST aggiungendo una dipendenza e un layer di modelli da mappare. Nessun beneficio.
- *Nominatim (OSM)*: gratuito, ma la usage policy vieta di fatto l'uso in app commerciali ad alto volume senza self-hosting.

**Costo, punto rimasto aperto dalla sessione di clarify**: la geocodifica è fatturata a richiesta e il traffico non Pro vi accede. Le mitigazioni già previste (3 caratteri minimi, debounce, cancellazione delle richieste superate) contengono il volume; il piano non introduce un tetto rigido perché non ci sono ancora dati d'uso su cui tararlo. **Da rivalutare dopo il primo mese**, con i dati del funnel di R8.

**Coordinate digitate**: riconosciute localmente con espressione regolare (`lat, lon` con virgola o spazio, gradi decimali, range validato ±90 / ±180). Nessuna chiamata di rete, quindi nessun costo e risposta istantanea.

---

## R7 — Riuso del motore di reachability

**Fatto verificato**: `getReachableRepeatersProvider(latitude:, longitude:, radiusKm:)` è **già parametrizzato sul punto e sul raggio** (`get_reachable_repeaters_provider.dart:22`). Non serve alcun nuovo datasource né endpoint: il punto arbitrario sostituisce le coordinate GPS e il livello scelto alimenta `radiusKm`.

**Decision**: riuso diretto, con due accortezze obbligatorie.

- **Nessun filtro di modo nella chiamata**: `getRepeatersNearby` accetta `accessModes`, ma FR-027 impone che calcolo e salvataggio comprendano sempre tutti i modi. Il parametro **non va passato**; il filtro si applica solo in presentazione (FR-028).
- **Il livello di ampiezza fa parte dell'identità del risultato**: 80 / 100 / 150 km producono risultati diversi sullo stesso punto, quindi il livello viene conservato nella postazione (FR-026) e la famiglia di provider è keyed anche su di esso.

Il filtro `_maxFrequencyMhz` già presente (scarta i candidati oltre 20 GHz, non validi per il modello ITM) resta invariato.

---

## R8 — Strumentazione del funnel

**Fatto verificato**: l'app **non possiede alcun sistema di analytics** — zero occorrenze di `analytics`, `track(`, `logEvent`, PostHog, Mixpanel, Firebase Analytics in `lib/` e in `pubspec.yaml`.

**Decision**: tabella Supabase dedicata `analytics_events`, scritta da un `AnalyticsClient` in `lib/clients/analytics/`, in modalità fire-and-forget.

**Rationale**: nessun SDK di terze parti significa nessun nuovo trasferimento di dati verso terzi, nessuna nuova dichiarazione di privacy sugli store, e il dato resta nel backend che già possediamo e sappiamo interrogare.

**Vincoli implementativi che derivano dai requisiti**:
- FR-068 (mai bloccante): invio non atteso (`unawaited`), errori catturati e inoltrati a Talker, mai propagati alla UI.
- FR-067 (nessun dato sensibile): il payload accetta **solo** valori da enum chiusi e contatori. Coordinate e nomi di località sono esclusi a livello di tipo, non per convenzione — il metodo di invio non espone un parametro in cui possano finire.
- FR-066: la strumentazione copre anche `ReachableMapButton` e `RepeaterReachBadge`, oggi privi di misurazione.

**Dipendenza esterna**: migrazione nel repo `ham_qrg_supabase` con RLS di solo inserimento (nessuna `SELECT` dal client). È l'unico artefatto di questa feature che vive fuori da questo repository.

---

## R9 — Interazione di pressione prolungata sulla mappa

**Fatto verificato**: `LongTapInteraction` esiste in `mapbox_maps_flutter` 2.25 (`interactive_features.dart:31`) ed è registrabile con `addInteraction`.

**Decision**: usare `addInteraction(LongTapInteraction(...))`, coerente con la migrazione già effettuata in questo repo da `onTapListener` al pattern `addInteraction`.

---

## R10 — Punti chiusi senza necessità di ricerca

- **Layout responsive**: `ResponsiveLayout` + `kTabletBreakpoint` (840) già disponibili in `lib/common/widgets/responsive/`. Nessuna alternativa da valutare: la costituzione impone questo widget e vieta i `LayoutBuilder` inline nelle pagine.
- **Paywall e stato Pro**: `requirePro`, `openReachabilityPaywall`, `isProProvider` e `_onProPurchased` (che invalida `isProProvider` e ricostruisce l'albero) già esistono e coprono FR-034 e FR-038.
- **Gate esistente**: `AppConfigs.reachabilityRequiresPro` è già l'interruttore centralizzato citato dalle Assumptions; la nuova superficie vi si aggancia invece di introdurne uno proprio.
