# Feature Specification: SOTA Integration con "Summit Pursuit" (WOW)

**Feature Branch**: `004-sota-integration`
**Created**: 2026-05-19
**Status**: Draft
**Input**: Voglio integrare SOTA. API: `https://api-db2.sota.org.uk/api/spots/200/all/all` per gli spot live, `https://api-db2.sota.org.uk/api/summits/{summit_code}` per il dettaglio del summit. Analogo a POTA. Studiare l'API e fornire una **funzionalità WOW** ben curata a livello di UI/UX e posizionamento nell'app.

## Premesse di prodotto

SOTA (**Summits On The Air**) è un programma analogo a POTA, ma si attivano **cime montane** anziché parchi. L'API espone dati ricchi e specifici delle montagne — **altitudine in m e ft**, **punteggio SOTA** (1–10 in base alla quota), **codice associazione/regione**, **locatore Maidenhead**, **coordinate**, **stato di validità della cima** — che permettono di costruire un'esperienza distintiva rispetto a POTA, non un semplice clone.

La funzionalità WOW di questa feature è il **"Summit Pursuit"**: il dettaglio di uno spot SOTA mostra il **profilo altimetrico del terreno tra la posizione dell'utente e la cima attivata** (sfruttando la edge function `get_altimetric_profile` già presente nel backend), trasformando lo spot da semplice riga in tabella a uno strumento di valutazione propagativa: *"posso sentirlo da qui? c'è una montagna in mezzo?"*. È un valore unico che POTA non può offrire (i parchi sono pianeggianti, le cime no) e che differenzia il prodotto sul mercato dei tool ham radio.

## Clarifications

### Session 2026-05-19

- Q: Disponibilità e firma di `get_altimetric_profile` per la WOW feature → A: Function presente nel backend `ham_qrg_supabase/supabase/functions/get_altimetric_profile/`. Auth: richiede JWT Supabase (anche utenti anonimi vanno bene, hanno sessione Supabase). Request: `{repeater_lat, repeater_lon, user_lat, user_lon, num_points?}` (i campi `repeater_*` sono legacy, accettano qualunque coppia di coordinate — si passa summit_lat→repeater_lat). Response: `{points: [{lat, lon, elevation_m, distance_km}], total_distance_km, num_points}`. `num_points` 10–200 (default 100). Backend elevation provider: Open-Meteo.
- Q: Posizionamento SOTA nella dashboard mobile → A: 4 tab paritari (Ripetitori / Spot / POTA / SOTA) per MVP, con riserva di rivisitazione a posteriori se l'UX risulta stretta su device piccoli — la variante "Outdoor con sotto-toggle" resta opzione documentata di refactoring futuro.
- Q: Politica di refresh della lista SOTA → A: Solo pull-to-refresh manuale, in parità con POTA. Nessun auto-refresh in foreground per MVP — preserva la coerenza UX e azzera il rischio rate-limit sull'API pubblica SOTA.
- Q: Cache locale degli spot SOTA → A: Solo cache in-memory via Riverpod ProviderContainer, niente persistenza su disco. Allinea SOTA al pattern POTA. Apertura della pagina offline mostra stato di errore standard senza ultima copia; FR-006 viene riformulato in coerenza.
- Q: Strumentazione analytics per misurare l'adozione della WOW (SC-004) → A: Nessuna strumentazione per MVP. SC-004 viene riformulato come obiettivo qualitativo verificato in UX testing post-release con 10+ utenti, non come KPI quantitativo da telemetria.

### Session 2026-05-19 — Decisioni autonome durante /speckit.specify

- **Posizionamento principale**: SOTA segue lo stesso pattern di POTA — pagina lista + mappa + dettaglio, esposte sotto `/sota`, `/sota/map`, `/sota/:spotId/:summitCode`. Punto di accesso primario: tab nel selettore dashboard.
- **WOW feature**: la differenziazione SOTA vs POTA è il **Summit Pursuit** — profilo altimetrico del terreno tra utente e cima, sfruttando la edge function `get_altimetric_profile` esistente. Non un clone di POTA.
- **Frequenze in MHz**: lo standard SOTA è MHz; la UI mostra MHz nativamente.
- **Punti come "trofeo"**: il badge punti è il secondo elemento visivo distintivo dopo l'altitudine — colore gradato per fascia 1/2/4/6/8/10.

## Studio dell'API SOTA

### Endpoint spots — `GET /api/spots/200/all/all`

Restituisce ~280 spot delle ultime ore. Ogni spot contiene:

| Campo | Tipo | Esempio | Uso UI |
|-------|------|---------|--------|
| `id` | int | 312182 | Identificatore univoco |
| `timeStamp` | ISO 8601 UTC | "2026-05-19T19:52:39Z" | Freshness indicator (verde <5m, ambra <15m, grigio oltre) |
| `activatorCallsign` | string | "I1WKN" | Riga primaria della card |
| `activatorName` | string | "Beppe" | Sottotitolo opzionale |
| `summitCode` | string | "I/PM-272" | Riferimento canonico (analogo a `reference` POTA) |
| `summitName` | string | "La Rocca / Rocca di Cavour" | Nome della cima |
| `AltM` / `AltFt` | int | 462 / 1516 | **Badge altitudine prominente** |
| `points` | int | 1–10 | **Badge "trofeo"** colorato per fascia di punti |
| `frequency` | float (MHz) | 14.065 | Frequenza |
| `mode` | string | "SSB", "CW", "FM", "DATA" | Badge modo |
| `comments` | string\|null | "[SOTA Activator] last call" | Riga commenti |
| `type` | string\|null | "NORMAL", "QRT" | Badge "QRT" se l'attivatore ha chiuso |
| `callsign` | string | "RBNHOLE" | Stazione che ha postato lo spot (riga secondaria, opzionale) |
| `userID` | int | 11703 | Solo logging |
| `epoch` | uuid | … | Solo logging |

### Endpoint summit — `GET /api/summits/{summitCode}`

| Campo | Tipo | Esempio | Uso UI |
|-------|------|---------|--------|
| `summitCode` | string | "I/PM-272" | Header |
| `name` | string | "La Rocca / Rocca di Cavour" | Titolo |
| `associationName` / `associationCode` | string | "Italy" / "I" | Bandiera + nome paese |
| `regionName` / `regionCode` | string | "Piemonte" / "PM" | Sottotitolo regione |
| `latitude` / `longitude` | decimal | 44.7803 / 7.3736 | Mappa + Summit Pursuit |
| `altM` / `altFt` | int | 462 / 1516 | Badge altitudine |
| `points` | int | 1 | Trofeo punti |
| `locator` | string | "JN34qs" | Locatore Maidenhead |
| `validFrom` / `validTo` / `valid` | ISO ts / bool | … / true | Badge "valid" se attiva, "expired" altrimenti |
| `restrictionMask` / `restrictionList` | bool / array | false / [] | Avviso "accesso con restrizioni" se presente |
| `activationCount`, `myActivations`, `myChases` | null nella response pubblica | null | Riservati a utenti loggati SOTA — fuori scope |
| `notes` | string | "" | Note del summit, se presenti |

### Pattern di integrazione

Speculare a POTA: `lib/src/features/sota/` con datasource API, model freezed con `fromJson`, mapper Model→Entity, repository, provider Riverpod, controller per pagina. Stesso pattern dei file `lib/src/features/pota/*` per consistenza e velocità di sviluppo.

## User Scenarios & Testing *(mandatory)*

### User Story 1 — Vedere gli spot SOTA live (Priority: P1)

Un radioamatore apre l'app e accede alla sezione SOTA. Vede una lista di spot SOTA recenti — ordinati per orario decrescente — con per ogni spot: callsign attivatore, frequenza + banda, modo, codice e nome della cima, **badge altitudine** (es. "1516 m") e **badge punti** (es. "8 pt") con gradazione colore in base alla fascia di punti. Un freshness indicator a colori (verde/ambra/grigio) comunica a colpo d'occhio quanto è recente lo spot.

L'utente può filtrare per banda e per modo (stessa UX dei filtri POTA), e può ordinare per orario o per distanza dalla propria QTH. Pull-to-refresh aggiorna manualmente la lista; un refresh periodico aggiorna automaticamente in background.

**Why this priority**: È il cuore della feature. Senza la lista degli spot la funzionalità non esiste. Da sola eroga valore: l'utente trova attivatori SOTA da inseguire.

**Independent Test**: L'utente apre la pagina SOTA, vede la lista popolata, applica un filtro banda (es. "20m"), vede solo gli spot in 20m, fa pull-to-refresh, vede uno spot nuovo comparire entro pochi secondi, e tocca uno spot per aprire il dettaglio.

**Acceptance Scenarios**:

1. **Given** l'utente apre la pagina SOTA per la prima volta, **When** la pagina si carica, **Then** vede gli ultimi 200 spot SOTA in ordine decrescente di orario, con badge altitudine e badge punti su ogni card.
2. **Given** l'utente è nella pagina SOTA, **When** seleziona il filtro banda "40m", **Then** vede solo gli spot con frequenza nella banda 40m.
3. **Given** l'utente è nella pagina SOTA con geolocalizzazione attiva, **When** seleziona "Ordina per distanza", **Then** la lista è riordinata dalla cima più vicina alla più lontana, con la distanza in km visibile su ogni card.
4. **Given** l'utente è nella pagina SOTA, **When** esegue pull-to-refresh, **Then** la lista si aggiorna dall'API e mostra eventuali spot nuovi.
5. **Given** uno spot ha `type = "QRT"`, **When** viene visualizzato, **Then** è marcato con un badge "QRT" e leggermente attenuato per indicare che l'attivatore ha chiuso.
6. **Given** lo spot è stato pubblicato meno di 5 minuti fa, **When** viene visualizzato, **Then** il freshness indicator è verde; tra 5 e 15 minuti è ambra; oltre 15 minuti è grigio.
7. **Given** l'API SOTA è irraggiungibile, **When** l'utente apre la pagina, **Then** vede uno stato di errore comprensibile in italiano con pulsante "Riprova" e — se disponibili — gli ultimi spot in cache (non viene mai mostrata una pagina bianca).

---

### User Story 2 — Summit Pursuit: profilo altimetrico verso la cima (Priority: P1) 🌟 WOW

Un radioamatore tocca uno spot SOTA dalla lista e apre il **dettaglio dello spot**. Nella parte alta vede una "Summit Card" con: nome della cima, badge altitudine (es. "1516 m"), badge punti con gradazione colore (es. "8 pt" oro), bandiera + nome dell'associazione e regione, distanza dalla propria QTH, **bearing/azimut** (gradi N/E/S/W), e dislivello altimetrico tra l'osservatore e la cima (es. "+1054 m").

Sotto la Summit Card, **il momento WOW**: un grafico del **profilo altimetrico del terreno** lungo la linea retta tra la posizione dell'utente e la cima. La curva mostra:

- L'andamento del terreno (riempimento gradient verde→marrone→bianco neve a seconda della quota)
- Un marker arancione/rosso alla cima (estremo destro) con l'altitudine
- Un marker blu sulla posizione dell'utente (estremo sinistro)
- Eventuali ostacoli orografici intermedi tra i due (montagne, valli)
- Una linea tratteggiata che rappresenta la **linea di vista geometrica** (line-of-sight) tra i due punti
- Un'indicazione testuale: "Vista libera ✓" (LOS senza ostacoli) o "Possibile ostruzione ⚠" (terreno interseca la linea di vista)

Sotto, le info dello spot stesso: frequenza, modo, commenti, orario, attivatore. Un pulsante "Apri sulla mappa" centra la cima nella mappa principale. Un pulsante "Copia frequenza" copia la frequenza.

**Why this priority**: È il fattore differenziante. Sapere *prima di cercare* se l'attivatore è geometricamente raggiungibile è un'informazione che né l'app SOTA ufficiale né i tool concorrenti offrono in forma visiva. Vale P1 perché senza questa l'integrazione SOTA è un clone di POTA — la funzionalità WOW deve atterrare nell'MVP.

**Independent Test**: L'utente con geolocalizzazione attiva apre il dettaglio di uno spot. Entro 2 secondi vede la Summit Card popolata e il grafico altimetrico tra la sua posizione e la cima. Cambia spot e il profilo si ricalcola per la nuova cima. Disattiva la geolocalizzazione: il grafico non viene mostrato ma le info della cima restano disponibili.

**Acceptance Scenarios**:

1. **Given** l'utente con geolocalizzazione attiva apre il dettaglio di uno spot SOTA, **When** la pagina si carica, **Then** vede entro 2 secondi: Summit Card con altitudine + punti + bandiera, distanza + bearing + dislivello rispetto alla propria QTH, e il grafico del profilo altimetrico tra la propria posizione e la cima.
2. **Given** il profilo altimetrico è stato calcolato, **When** non ci sono ostacoli orografici sopra la linea di vista, **Then** il grafico mostra "Vista libera ✓" con icona verde.
3. **Given** il profilo altimetrico mostra terreno che interseca la linea di vista geometrica, **When** viene visualizzato, **Then** mostra "Possibile ostruzione ⚠" con icona ambra e l'altezza dell'ostacolo principale visibile sul grafico.
4. **Given** l'utente non ha concesso il permesso di geolocalizzazione, **When** apre il dettaglio, **Then** la Summit Card mostra comunque tutte le info della cima e dello spot, ma la sezione "Summit Pursuit" è sostituita da un invito non invasivo ad attivare la geolocalizzazione per vedere il profilo verso la cima.
5. **Given** la edge function `get_altimetric_profile` fallisce o restituisce un errore, **When** l'utente apre il dettaglio, **Then** il resto della pagina rimane usabile e la sezione del profilo mostra un messaggio di errore con pulsante "Riprova" — la pagina NON va in errore globale.
6. **Given** la distanza tra utente e cima è eccessiva (oltre una soglia ragionevole, es. >2000 km) o coordinate dell'utente non disponibili, **When** apre il dettaglio, **Then** il profilo non viene calcolato e viene mostrato un messaggio esplicativo ("Cima troppo distante per il profilo di terreno") senza degradare il resto della pagina.
7. **Given** uno spot SOTA ha campi `AltM`/`points`/`summitName` direttamente nella risposta dell'API spots, **When** l'utente apre il dettaglio, **Then** la Summit Card viene mostrata immediatamente con i dati già disponibili dallo spot mentre il dettaglio del summit completo viene caricato in background per arricchire (locatore, validità, regione).
8. **Given** la cima ha `valid = false` o `restrictionMask = true`, **When** l'utente apre il dettaglio, **Then** un banner informativo segnala lo stato (es. "Cima non più valida dal …" o "Accesso con restrizioni").

---

### User Story 3 — Mappa degli spot SOTA con marker altimetrici (Priority: P2)

L'utente passa dalla lista SOTA alla **mappa SOTA** (icona mappa in app bar, stesso pattern POTA). Vede i marker delle cime con spot attivi sulla mappa. **I marker SOTA sono visivamente distinti** da quelli POTA:

- Un'icona "triangolo montagna" (anziché l'albero parchi di POTA)
- Colore tinto in base alla **fascia di altitudine** (verde fino a 1000 m, ambra 1000–2000 m, bianco/blu oltre 2000 m) — la scala richiama visivamente il concetto di "andare in alto"
- Un piccolo badge punti sull'angolo

Toccando un marker si apre un bottom sheet con la Summit Card e il pulsante "Apri dettaglio" che porta al Summit Pursuit. Marker raggruppati in cluster quando densi (riusa il pattern esistente). L'utente può alternare i layer mappa (light/dark/terrain).

**Why this priority**: Estende il valore dalla lista alla visualizzazione geografica. Il valore aggiunto rispetto alla lista è la consapevolezza spaziale (capire in quale catena montuosa è la cima, vedere cluster di attività in una regione). Non è P1 perché la lista da sola è già fruibile.

**Independent Test**: L'utente apre la mappa SOTA, vede marker triangolari colorati per fascia altimetrica. Tocca un marker, si apre il bottom sheet della cima. Da lì apre il Summit Pursuit.

**Acceptance Scenarios**:

1. **Given** l'utente apre la mappa SOTA, **When** la mappa si carica, **Then** vede i marker delle cime con spot attivi posizionati alle coordinate corrette.
2. **Given** la cima è sotto 1000 m, **When** il marker viene mostrato, **Then** il colore del marker è verde; tra 1000 e 2000 m è ambra; sopra 2000 m è bianco/blu.
3. **Given** la mappa contiene molti marker vicini, **When** lo zoom è basso, **Then** i marker vengono raggruppati in cluster con contatore.
4. **Given** l'utente tocca un marker, **When** il marker è selezionato, **Then** si apre un bottom sheet con Summit Card e pulsante per aprire il dettaglio.
5. **Given** la geolocalizzazione utente è disponibile, **When** la mappa si carica per la prima volta, **Then** è centrata sulla posizione dell'utente con uno zoom che mostri almeno qualche cima vicina (fallback ragionevole se nessuna entro 100 km).

---

### User Story 4 — Accesso rapido dalla dashboard (Priority: P2)

La dashboard principale dell'app (con la sezione "tab" nel DraggableScrollableSheet, oggi composta da **Ripetitori / Spot Cluster / POTA**) viene estesa con un **quarto tab "SOTA"**. Il tab mostra i 5 spot SOTA più recenti in card compatte con badge altitudine + punti + freshness, e un pulsante "Vedi tutti" che apre la pagina SOTA full-screen. Un pulsante refresh permette di aggiornare manualmente.

Per l'MVP si adotta la **variante "4 tab paritari"** (decisione registrata in Clarifications). Resta documentata come opzione di refactoring post-rilascio la variante **"Outdoor con sotto-toggle POTA/SOTA"** qualora l'UX della SegmentedButton risulti stretta su device piccoli (≥360 dp da verificare in fase di QA).

**Why this priority**: Massimizza la scopribilità senza intralciare le funzioni primarie. Importante ma non bloccante: la pagina full-screen SOTA è raggiungibile anche da altre vie (mappa, deep link).

**Independent Test**: L'utente apre la dashboard, sceglie il tab SOTA (o sotto-toggle SOTA), vede i 5 spot più recenti, tocca uno spot e atterra sul dettaglio Summit Pursuit; tocca "Vedi tutti" e arriva sulla lista full-screen.

**Acceptance Scenarios**:

1. **Given** l'utente apre la dashboard, **When** seleziona il tab SOTA, **Then** vede una card compatta per ognuno dei 5 spot SOTA più recenti, con altitudine + punti + freshness.
2. **Given** l'utente è sul tab SOTA della dashboard, **When** tocca "Vedi tutti", **Then** apre la pagina lista SOTA full-screen.
3. **Given** l'utente è sul tab SOTA della dashboard, **When** tocca uno spot, **Then** apre il dettaglio Summit Pursuit per quello spot.
4. **Given** nessuno spot SOTA è disponibile (API vuota), **When** l'utente apre il tab, **Then** vede uno stato vuoto educativo che descrive cos'è SOTA con icona/illustrazione.
5. **Given** il tab SOTA ha almeno uno spot recente (≤15 min), **When** la dashboard si carica, **Then** sul label del tab SOTA appare un badge "live" (analogo al pattern POTA del codebase) con il contatore degli spot.

---

### User Story 5 — Punti chase & filtri avanzati (Priority: P3)

Un radioamatore che insegue il punteggio SOTA Chaser vuole filtrare gli spot per **fascia di punti** (es. solo cime da 6+ punti, solo cime da 10 punti) e per **associazione/regione** (es. solo Italia, solo Alpi). I filtri si aggiungono ai filtri banda/modo già esistenti.

**Why this priority**: Funzionalità di nicchia per utenti SOTA seri ma con basso costo di sviluppo se basata sui campi `points` e `associationCode` già disponibili. Va in P3 perché serve solo una minoranza di utenti SOTA chaser dedicati.

**Independent Test**: L'utente filtra per "8+ punti", vede solo gli spot di cime con `points ≥ 8`. Filtra anche per "Italia", vede solo gli spot italiani. Rimuove i filtri, torna alla lista completa.

**Acceptance Scenarios**:

1. **Given** la lista SOTA mostra spot da varie fasce di punti, **When** l'utente applica il filtro "8+ punti", **Then** vede solo spot con `points >= 8`.
2. **Given** la lista SOTA contiene spot da più associazioni, **When** l'utente seleziona l'associazione "Italy", **Then** vede solo spot con `summitCode` che inizia con "I/".
3. **Given** filtri attivi su banda, modo, punti e associazione, **When** la lista è filtrata, **Then** una pillola riassuntiva mostra il numero di spot risultanti e un pulsante "Rimuovi filtri" rapido.

---

### Out of scope per MVP

- **Marcare cime già attivate / chased dall'utente**: l'API pubblica `/api/spots/200/all/all` non espone questi campi senza autenticazione SOTA (`myActivations`/`myChases` sono `null`). Si rimanda a una feature successiva (richiederebbe OAuth con `sota.org.uk` o un log manuale lato utente).
- **Notifiche push su SOTA spots**: il pattern OneSignal esiste ma legare le notifiche a "spot SOTA da chaser preferiti" o "spot su un'associazione preferita" è una feature di engagement futura.
- **Preferiti su cime**: aggiungere cime a una lista personale è interessante ma richiede modello dati lato app/Supabase, fuori scope MVP.

### Edge Cases

- **Geolocalizzazione non concessa**: la pagina Summit Pursuit funziona comunque (mostra info cima e spot) ma sostituisce la sezione profilo con un invito ad attivare la geolocalizzazione. Lista e mappa funzionano (ordinamento per distanza disabilitato).
- **API SOTA down o lenta (>10 s)**: timeout esplicito con stato di errore comprensibile. Se la pagina è già aperta con dati in memoria, FR-070 si applica (mantenimento dati visibili + flag `hasLoadError`). Non c'è fallback offline su disco.
- **Edge function altimetric profile lenta o down**: la Summit Card resta visibile, la sezione profilo mostra skeleton → errore con pulsante riprova. La pagina NON deve mai andare in `AsyncError` globale (rispetto delle linee guida CLAUDE.md su error handling nei controller Riverpod).
- **Coordinate utente e cima identiche o quasi (distanza <500 m)**: profilo non significativo, mostrare messaggio "Sei praticamente sulla cima" e omettere il grafico.
- **Distanza eccessiva (>2000 km) tra utente e cima**: il profilo terreno non è utile (oltre l'orizzonte ottico) → mostrare messaggio "Cima troppo distante per il profilo di terreno; rimane comunque distanza + bearing + dislivello".
- **Cima con `valid = false` (cima ritirata dal programma)**: banner informativo "Cima non più valida dal …" ma dati visibili.
- **Cima con `restrictionMask = true` o `restrictionList` non vuoto**: banner informativo "Accesso con restrizioni" + dettagli se presenti in `restrictionList`.
- **Spot con `type = "QRT"`**: il record viene mostrato attenuato e marcato "QRT" — significa che l'attivatore ha lasciato la cima, l'utente deve sapere che probabilmente non è più in frequenza.
- **Numero di spot vuoto (API restituisce array vuoto)**: stato vuoto educativo con illustrazione e breve descrizione di cos'è SOTA.
- **Localizzazione mancante per una cima** (`latitude`/`longitude` nulli): la cima non appare sulla mappa, ma è visibile nella lista; in dettaglio si mostra "Coordinate non disponibili" e si omette la sezione Summit Pursuit.
- **Cambio rapido di spot da parte dell'utente**: cancellazione delle richieste pendenti (debounce/abort) per evitare race condition sul profilo altimetrico.
- **Dispositivo offline**: prima apertura mostra stato di errore con "Riprova" (nessuna cache su disco). Se la lista è già aperta con dati in memoria, i dati restano visibili e un banner segnala la perdita connessione.
- **Frequenza in MHz vs kHz**: lo spot POTA usa kHz (formato `String`), SOTA usa MHz (`double`). Il display SOTA mostra la frequenza in MHz (formato standard del programma SOTA) — è una scelta voluta per coerenza con la community SOTA, non un'incoerenza interna.

## Requirements *(mandatory)*

### Functional Requirements

#### Dati & API

- **FR-001**: Il sistema MUST recuperare gli spot SOTA live dall'endpoint pubblico `GET https://api-db2.sota.org.uk/api/spots/200/all/all` ed esporre i dati come entità di dominio interne (no leak del DTO API nei layer di presentazione).
- **FR-002**: Il sistema MUST recuperare il dettaglio di una cima dall'endpoint `GET https://api-db2.sota.org.uk/api/summits/{summitCode}` su richiesta (lazy, quando l'utente apre il dettaglio dello spot), con cache in memoria per evitare richieste ripetute alla stessa cima nella stessa sessione.
- **FR-003**: Il sistema MUST gestire i campi della response API: `id`, `timeStamp`, `activatorCallsign`, `activatorName`, `summitCode`, `summitName`, `AltM`, `AltFt`, `points`, `frequency` (MHz), `mode`, `comments`, `type`, `callsign`. Campi opzionali devono essere nullable nel modello.
- **FR-004**: Il sistema MUST validare e gestire i valori di `type` riconosciuti (almeno `NORMAL` e `QRT`), trattando valori sconosciuti come `NORMAL` con logging non bloccante.
- **FR-005**: Il sistema MUST fornire il refresh manuale (pull-to-refresh) della lista spot. Per MVP NON si implementa auto-refresh in background — la freschezza è azione esplicita dell'utente, in parità con POTA.
- **FR-006**: Il sistema MUST mantenere una cache in-memory degli spot caricati (lifecycle del ProviderContainer Riverpod) per evitare richieste ripetute e per supportare i filtri lato client. NON si implementa cache persistente su disco per MVP — apertura della pagina offline mostra lo stato di errore standard.

#### Lista SOTA

- **FR-010**: La pagina Lista SOTA MUST mostrare gli spot in ordine decrescente di `timeStamp` come default.
- **FR-011**: La pagina Lista SOTA MUST esporre un filtro banda (deriva la banda dalla frequenza in MHz tramite la stessa utility usata da POTA, estesa o riusata) e un filtro modo (`SSB`, `CW`, `FM`, `DATA`, ecc.).
- **FR-012**: La pagina Lista SOTA MUST esporre l'ordinamento per distanza dalla QTH dell'utente quando la geolocalizzazione è disponibile (parità con POTA).
- **FR-013**: Ogni riga lista MUST mostrare: callsign attivatore, frequenza in MHz, banda, badge modo, nome cima, codice cima, badge altitudine (m), badge punti, freshness indicator a colori.
- **FR-014**: Il badge punti MUST essere colorato in fascia: 1–2 grigio, 4 verde, 6 ambra, 8 arancio, 10 oro/rosso (valori standard SOTA: 1, 2, 4, 6, 8, 10).
- **FR-015**: Spot con `type = "QRT"` MUST essere visivamente attenuati e portare badge "QRT".

#### Summit Pursuit (dettaglio) — WOW

- **FR-020**: La pagina dettaglio spot MUST mostrare una "Summit Card" con: nome cima, codice cima, altitudine (m + ft), badge punti, associazione (con bandiera/icona paese se disponibile), regione, locatore Maidenhead, distanza dalla QTH utente, bearing in gradi, dislivello altimetrico.
- **FR-021**: La pagina dettaglio spot MUST chiamare la edge function `get_altimetric_profile` (già esistente nel backend del progetto) passando le coordinate utente (`user_lat`/`user_lon`) e le coordinate cima (`repeater_lat`/`repeater_lon` — naming legacy della function, accetta qualunque coppia di coordinate destinazione), opzionalmente `num_points` (10–200, default 100). La response contiene `points: [{lat, lon, elevation_m, distance_km}]`, `total_distance_km`, `num_points`. La function richiede JWT Supabase (gli utenti anonimi dell'app ne hanno comunque uno).
- **FR-022**: Il grafico del profilo altimetrico MUST mostrare: marker dell'utente (estremo sinistro), marker della cima (estremo destro), curva del terreno con gradient colorato per fascia altitudine, linea di vista geometrica tratteggiata tra utente e cima, indicazione testuale "Vista libera" o "Possibile ostruzione" basata sull'intersezione del terreno con la linea di vista.
- **FR-023**: La sezione profilo MUST gestire indipendentemente i propri stati (loading / error / data) senza propagare gli errori al resto della pagina dettaglio.
- **FR-024**: Se la geolocalizzazione utente non è disponibile, la sezione Summit Pursuit MUST essere sostituita da un invito non invasivo ad attivare la geolocalizzazione, senza bloccare la visualizzazione delle info della cima e dello spot.
- **FR-025**: Se la distanza utente↔cima supera la soglia di significatività del profilo (vedi Q2), la sezione MUST mostrare un messaggio esplicativo invece del grafico, preservando comunque distanza/bearing/dislivello.
- **FR-026**: La pagina dettaglio MUST esporre azioni rapide: "Copia frequenza", "Apri sulla mappa", "Condividi".

#### Mappa SOTA

- **FR-030**: La mappa SOTA MUST mostrare un marker per ogni cima con almeno uno spot recente, alle coordinate `latitude`/`longitude` della cima.
- **FR-031**: I marker SOTA MUST essere visivamente distinti da quelli POTA tramite forma "triangolo montagna" e colore gradato per fascia di altitudine (verde <1000 m, ambra 1000–2000 m, bianco/blu >2000 m).
- **FR-032**: La mappa SOTA MUST supportare clustering quando i marker sono densi (riuso del pattern POTA/repeaters).
- **FR-033**: Toccare un marker MUST aprire un bottom sheet con Summit Card e pulsante per aprire il dettaglio.
- **FR-034**: La mappa SOTA MUST essere accessibile dalla pagina lista SOTA tramite icona mappa nell'app bar (stesso pattern POTA).

#### Integrazione Dashboard

- **FR-040**: La dashboard MUST esporre un punto di accesso a SOTA come **quarto tab paritario** nel selettore (Ripetitori / Spot / POTA / SOTA). La variante "Outdoor con sotto-toggle" è esplicitamente fuori scope MVP e considerata come possibile refactoring futuro.
- **FR-041**: Il tab SOTA della dashboard MUST mostrare i 5 spot più recenti in formato compatto con badge altitudine + punti + freshness, un pulsante refresh, e un pulsante "Vedi tutti" che porta alla lista full-screen.
- **FR-042**: Il tab SOTA MUST mostrare un badge "live" con contatore di spot freschi (≤15 min) sull'etichetta del tab (analogo al pattern POTA esistente).

#### Localizzazione & Tema

- **FR-050**: Tutte le stringhe utente MUST essere localizzate via `lib/l10n/app_it.arb` (chiavi in inglese camelCase, valori in italiano), con prefisso `sota` (es. `sotaTitle`, `sotaSummitPursuit`, `sotaPointsBadge`, ecc.).
- **FR-051**: Nessun colore o stile di testo MUST essere hardcoded: tutti i colori passano da `theme.colorScheme.*` e i testi da `theme.textTheme.*`. Eccezione consentita: la palette punteggio SOTA, definita come costanti `AppColors` perché brand-specific (analoga alla `AccessModeHelper`).

#### Routing & Navigazione

- **FR-060**: Il router app MUST esporre i path `/sota` (lista), `/sota/map` (mappa), `/sota/:spotId/:summitCode` (dettaglio) coerenti con il pattern POTA.
- **FR-061**: La navigazione tra lista, mappa e dettaglio MUST conservare lo scroll/zoom precedente al ritorno indietro (riuso del comportamento auto_route).

#### Error handling & Resilienza

- **FR-070**: La pagina lista SOTA MUST seguire le linee guida `CLAUDE.md` per error handling in `AsyncNotifier`: errori sul refresh non MUST far perdere i dati già visibili (uso di flag `hasLoadError` in `@freezed` state, non `AsyncError`).
- **FR-071**: La pagina dettaglio MUST gestire indipendentemente gli errori dei due fetch (summit detail + altimetric profile), senza che il fallimento di uno comprometta l'altro.

#### Privacy & Sicurezza

- **FR-080**: L'integrazione MUST chiamare solo gli endpoint pubblici SOTA documentati. Nessun dato sensibile dell'utente (callsign, coordinate, ecc.) viene inviato a SOTA.
- **FR-081**: Le coordinate dell'utente passate alla edge function `get_altimetric_profile` MUST viaggiare via canale sicuro (HTTPS) e non vengono persistite dal backend oltre la durata della richiesta.

### Key Entities

- **SotaSpot**: rappresenta un singolo spot SOTA pubblicato. Attributi: id, timestamp UTC, callsign attivatore, nome attivatore, codice cima, nome cima, altitudine (m e ft), punti, frequenza (MHz), modo, commenti, tipo (NORMAL/QRT), callsign poster (chi ha postato lo spot).
- **SotaSummit**: rappresenta il dettaglio di una cima SOTA. Attributi: codice, nome, associazione (codice + nome), regione (codice + nome), latitudine, longitudine, altitudine (m e ft), punti, locatore Maidenhead, intervallo di validità (validFrom, validTo, valid), eventuali restrizioni di accesso.
- **SummitPursuit**: rappresenta il risultato del calcolo del profilo altimetrico tra l'utente e una cima. Attributi: punti del profilo terreno (lista di (distanza, quota)), altitudine origine, altitudine cima, distanza totale, bearing, dislivello, flag "line-of-sight libera", eventuale ostacolo principale (distanza dell'apice + altezza).
- **SotaSpotsState**: stato della pagina lista. Attributi: lista spot, lista filtrata, filtri attivi (banda, modo, punti, associazione), ordinamento, flag `hasLoadError`, flag `isRefreshing`, distanze pre-calcolate per cima.
- **SotaSpotDetailState**: stato della pagina dettaglio. Attributi: SotaSpot di riferimento, SotaSummit (nullable, lazy), SummitPursuit (nullable, lazy), flag separati per error/loading di ciascuna sezione.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Un utente può aprire la pagina SOTA e vedere la lista popolata in **meno di 2 secondi** su connessione 4G mediana (tempo da apertura tab a primo spot visibile sopra la piega).
- **SC-002**: Il dettaglio Summit Pursuit mostra Summit Card popolata **entro 500 ms** dall'apertura (i dati base provengono dallo spot già caricato, no round-trip) e il profilo altimetrico completo **entro 2 secondi** in condizioni nominali di rete.
- **SC-003**: Tasso di errore della pagina dettaglio (intera pagina in errore non utilizzabile) **inferiore allo 0.5%** sul totale aperture nei primi 30 giorni dal rilascio (escluso offline accertato).
- **SC-004**: In una sessione di UX testing con ≥10 utenti radioamatori dopo il rilascio, **almeno 8 su 10** notano spontaneamente e descrivono come "utile" la sezione Summit Pursuit (validazione qualitativa del fattore WOW, in assenza di telemetria di prodotto).
- **SC-005**: Riferimento qualitativo: feedback positivo della community ham radio italiana sulla feature nei primi 60 giorni (canali Discord/Telegram/store reviews) senza segnalazioni di regressioni bloccanti.
- **SC-006**: Sul piano operativo, **zero regressioni** sui flussi pre-esistenti POTA, Spot Cluster e Repeaters dopo il rilascio (verificato tramite test smoke prima del rilascio).
- **SC-007**: Lo stato vuoto è raggiungibile da utenti novizi: il **90% degli utenti** che apre il tab SOTA per la prima volta capisce cos'è SOTA senza dover uscire dall'app (validabile via UX testing su 10+ utenti).
- **SC-008**: La copertura test (unit + integration) della feature SOTA è **almeno equivalente a quella POTA** in termini di file di test al rilascio.

## Assumptions

- L'API pubblica SOTA `api-db2.sota.org.uk` è **stabile, anonima, senza autenticazione richiesta** e con rate limit ragionevole per uso client mobile (assunzione conservativa: non superare 1 richiesta lista ogni 60 s per utente attivo).
- L'app può chiamare direttamente l'API SOTA da client (no proxy backend necessario), in analogia con la struttura POTA esistente.
- La edge function `get_altimetric_profile` è disponibile in `ham_qrg_supabase/supabase/functions/get_altimetric_profile/` con firma confermata: request `{repeater_lat, repeater_lon, user_lat, user_lon, num_points?}` (campi `repeater_*` legacy, accettano qualsiasi coordinata destinazione), response `{points: [{lat, lon, elevation_m, distance_km}], total_distance_km, num_points}`, JWT richiesto. Backend usa Open-Meteo come provider di elevazioni — rate limit dell'upstream è il vincolo effettivo, niente soglia hard-coded lato function.
- Tutti gli utenti dell'app (anche anonimi) possono usare la feature SOTA in sola lettura — non è richiesta autenticazione per consultare gli spot. Eventuali azioni future (preferiti su cime, log personali) richiederanno autenticazione, ma sono fuori scope MVP.
- Il dispositivo è online quando l'utente apre per la prima volta SOTA. Apertura offline è un caso degradato accettato: stato di errore con "Riprova", nessuna cache persistente su disco (MVP scelta esplicita per parità POTA).
- La community SOTA italiana e internazionale usa convenzionalmente **MHz** per le frequenze SOTA (a differenza di POTA che usa kHz) — la UI SOTA mostra le frequenze in MHz.
- Il design system esistente (theme, colorScheme, AccessModeHelper) copre l'80% delle esigenze visive. La palette punti SOTA (1/2/4/6/8/10) sarà aggiunta come costanti `AppColors` perché brand-specific — eccezione analoga e già accettata per le mode colors POTA/DMR/C4FM/D-STAR.
- Il tab SOTA in dashboard si aggiunge come 4° tab paritario. L'usabilità della SegmentedButton va verificata su device ≥360 dp in QA; un'eventuale degradazione viene affrontata come refactoring post-MVP (variante "Outdoor con sotto-toggle"), non blocca il rilascio.
- Le icone/illustrazioni necessarie (logo SOTA, marker triangolo, bandiere associazioni) sono disponibili o producibili — il logo SOTA ufficiale è scaricabile da `sota.org.uk`. Se ci fossero vincoli di licenza per l'uso del logo nell'app, si userà un'icona generica di montagna.
- I dati `myActivations` / `myChases` / `activationCount` sono `null` nell'API pubblica anonima — la funzionalità "marca cima già attivata" è esplicitamente fuori scope MVP.

