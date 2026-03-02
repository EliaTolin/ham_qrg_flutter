# HamQRG - Feature Roadmap

Analisi delle funzionalità integrabili nell'app, organizzate per priorità e impatto.

---

## Stato attuale

L'app copre: autenticazione multi-provider (Google, Apple, email, anonimo), mappa interattiva Mapbox con clustering, lista ripetitori con ricerca fuzzy (pg_trgm), dettaglio ripetitore completo, feedback della community con health score, preferiti, profilo altimetrico con LOS, integrazione BrandMeister, deep linking, e localizzazione italiana.

---

## Quick Wins (infrastruttura già presente)

Funzionalità con codice già parzialmente implementato o dipendenze già installate.

| Feature | Stato attuale | Effort |
|---------|---------------|--------|
| Auth guard | Codice commentato in `app_router.dart` | Basso |
| Push notifications | OneSignal configurato, manca handler Flutter | Basso |
| BrandMeister talkgroups nel dettaglio | Widget `BmTalkgroupsWidget` esiste, non collegato | Basso |
| "Vedi tutti i feedback" | Pulsante presente, navigazione TODO | Basso |
| Filtro per banda nella lista | Enum `FrequencyBand` esiste nel dominio | Medio |
| Onboarding interattivo | Package `introduction_screen` installato | Medio |
---

## Nuove funzionalità proposte

### 1. Logbook QSO

**Priorità**: Alta (già promesso come benefit nella registration prompt)

Il testo di registrazione menziona un "Logbook" come feature futura. Sarebbe la funzionalità più attesa dagli utenti.

**Funzionalità**:
- Registro QSO: data/ora, frequenza, modo, callsign contattato, RST inviato/ricevuto, note
- Auto-fill da pagina dettaglio ripetitore (frequenza, modo, CTCSS)
- Statistiche: conteggio QSO per modo, banda, periodo
- Export ADIF (formato standard per LoTW, eQSL, ClubLog)
- Collegamento opzionale al ripetitore utilizzato

**Architettura suggerita**:
```
lib/src/features/logbook/
├── data/
│   ├── datasource/      # Tabella Supabase `qso_logs`
│   ├── model/           # QsoLogModel (DTO)
│   ├── mappers/
│   └── repository/
├── domain/
│   └── qso_log.dart     # QsoLog entity
├── presentation/
│   ├── logbook_page/    # Lista QSO con filtri
│   └── add_qso_page/   # Form inserimento
└── provider/
    └── export_adif/     # Provider per export
```

**Tabella Supabase**:
```sql
CREATE TABLE qso_logs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users NOT NULL,
  repeater_id uuid REFERENCES repeaters(id),
  callsign_worked text NOT NULL,
  frequency_hz bigint NOT NULL,
  mode text NOT NULL,
  rst_sent text,
  rst_received text,
  station_kind text, -- portable, mobile, fixed
  latitude double precision,
  longitude double precision,
  comment text,
  qso_at timestamptz NOT NULL DEFAULT now(),
  created_at timestamptz NOT NULL DEFAULT now()
);
```

---

### 2. I miei report — Storico segnalazioni utente

**Priorità**: Alta (infrastruttura di invio già presente in `ReportIssuePage`)

L'utente può già inviare segnalazioni su ripetitori con dati errati, ma non ha modo di vedere lo storico dei propri report né il loro stato di lavorazione. Questa pagina colma il gap.

**Funzionalità**:
- Lista dei report inviati dall'utente con stato (in attesa, in lavorazione, risolto, rifiutato)
- Dettaglio singolo report: ripetitore segnalato, descrizione, data invio, stato attuale, eventuale risposta del coordinatore
- Badge/indicatore nella pagina impostazioni se ci sono aggiornamenti non letti
- Filtro per stato (tutti, aperti, chiusi)

**Navigazione**: Raggiungibile dalla pagina **Impostazioni utente** (`UserSettingsRoute`) come voce dedicata.

**Architettura suggerita**:
```
lib/src/features/user_reports/
├── data/
│   ├── datasource/        # Abstract + Supabase implementation
│   ├── model/             # UserReportModel (DTO)
│   ├── mappers/           # Model ↔ Entity
│   └── repository/        # UserReportsRepository
├── domain/
│   └── user_report.dart   # UserReport entity (@freezed)
├── presentation/
│   └── user_reports_page/
│       ├── user_reports_page.dart
│       └── controller/
│           ├── user_reports_controller.dart
│           └── state/
│               └── user_reports_state.dart
└── provider/
    └── get_user_reports/  # Provider per fetch lista
```

**Entità dominio**:
```dart
@freezed
class UserReport with _$UserReport {
  const factory UserReport({
    required String id,
    required String repeaterId,
    required String repeaterCallsign,
    required String? repeaterName,
    required String description,
    required UserReportStatus status,
    required String? coordinatorResponse,
    required DateTime createdAt,
    required DateTime? resolvedAt,
  }) = _UserReport;
}

enum UserReportStatus { pending, inProgress, resolved, rejected }
```

**Backend (Supabase)**:
- Aggiungere colonne alla tabella report esistente: `status` (enum), `coordinator_response` (text), `resolved_at` (timestamptz)
- RPC `get_user_reports(p_user_id uuid)` che restituisce i report con join sul ripetitore per callsign e nome
- RLS policy: l'utente può leggere solo i propri report

**Route**: Nuova rotta figlia di `ProfileRouter`:
```
ProfileRouter
├── ProfileRoute
├── UserSettingsRoute
└── UserReportsRoute  ← nuova
```

---

### 3. Push Notifications intelligenti

**Priorità**: Alta (OneSignal già configurato, si collegano anche ai report: notifica quando un report cambia stato)

**Scenari**:
- Ripetitore preferito segnalato come down/up dalla community
- Nuovo ripetitore aggiunto nella propria zona (raggio configurabile)
- Aggiornamenti su un ripetitore (cambio frequenza, CTCSS, rete)
- Feedback ricevuto sul proprio report

**Implementazione**:
- Handler OneSignal in Flutter per gestione notifiche in-app e background
- Supabase Database Webhooks o Edge Functions trigger su insert in `repeater_feedback`
- Preferenze utente per tipologia di notifica (settings page)

---

### 4. Copertura RF stimata

**Priorità**: Media-Alta (il profilo altimetrico e il LOS esistono già)

**Funzionalità**:
- Mappa di copertura: visualizzazione a raggiera del radio horizon del ripetitore
- Verdetto "Mi copre?": coperto / parziale / non coperto, con spiegazione
- Integrazione potenza e altezza antenna (già disponibili in `BmDevice`: `powerWatts`, `antennaHeightM`)
- Calcolo zona di Fresnel per valutare la qualità del collegamento

**Backend**:
- Nuova Edge Function `estimate_coverage` che calcola profili altimetrici su N direzioni (es. ogni 10°)
- Cache dei risultati per ripetitore (la copertura non cambia frequentemente)

---

### 5. Modalità offline

**Priorità**: Media-Alta (uso tipico in montagna/zone senza copertura)

**Funzionalità**:
- Cache ripetitori per regione: download dati per consultazione offline
- Mappe offline Mapbox (il SDK supporta offline regions)
- Ultima posizione nota: mostrare ripetitori vicini anche senza GPS
- Sync delta al ritorno online

**Implementazione**:
- Database locale (Drift/SQLite o Isar) per ripetitori scaricati
- Mapbox `OfflineManager` per tile pack per regione
- Provider che fallback su dati locali quando offline
- Indicatore stato connessione nell'UI

---

### 6. Ricerca avanzata e filtri

**Priorità**: Media

**Nuovi filtri**:
- Per banda: 2m, 70cm, 23cm, etc. (enum `FrequencyBand` già nel dominio)
- Per rete: BrandMeister, TGIF, FreeDMR, etc.
- Per CTCSS/DCS: "trova ripetitori con tono 88.5 Hz"
- Per stato: basato sull'health score (attivo / problematico / down)
- Per locator Maidenhead: calcolo già presente in `MaidenheadLocator`

**Backend**:
- Estendere RPC `search_repeaters` con parametri aggiuntivi (`p_network_id`, `p_ctcss_hz`, `p_health_min`)
- Indici GIN aggiuntivi per le nuove colonne filtrate

---

### 7. Navigazione verso il ripetitore

**Priorità**: Media

**Funzionalità**:
- "Portami là": apertura navigatore esterno (Google Maps, Apple Maps, Waze)
- Bussola direzionale: indicatore che punta verso il ripetitore dalla posizione corrente
- Distanza in tempo reale: aggiornamento continuo mentre l'utente si muove

**Implementazione**:
- Package `url_launcher` (già in uso) per aprire app di navigazione
- Widget bussola con `StreamSubscription` su `Geolocator.getPositionStream()`
- Calcolo bearing con formula haversine

---

### 8. Widget e complicazioni

**Priorità**: Media-Bassa

**Funzionalità**:
- Widget iOS (WidgetKit) / Android (App Widget): ripetitore più vicino sulla home screen
- Apple Watch complication: frequenza e tono del ripetitore più vicino
- Quick Actions (3D Touch / Long press sull'icona): accesso rapido a mappa, ricerca, preferiti

**Implementazione**:
- Package `home_widget` per widget cross-platform
- Modulo nativo Swift per Apple Watch
- `quick_actions` package per 3D Touch

---

### 9. Confronto ripetitori

**Priorità**: Media-Bassa

**Funzionalità**:
- Selezione e confronto side-by-side di 2-3 ripetitori
- Parametri confrontati: copertura LOS, distanza, health score, modi disponibili, CTCSS
- "Miglior ripetitore per me": algoritmo basato su distanza, LOS, health score, modo preferito

**Implementazione**:
- Bottone "Confronta" nella lista e nei preferiti
- Stato di selezione gestito con Riverpod (lista di ID selezionati)
- Pagina confronto con tabella a colonne

---

### 10. Community avanzata

**Priorità**: Media-Bassa

**Funzionalità**:
- Commenti sui ripetitori: thread di discussione per ripetitore
- Foto del sito: galleria immagini dell'installazione
- Segnalazione QRM/QRN: report interferenze specifiche
- Classifica contributori: gamification per feedback utili

**Backend**:
```sql
CREATE TABLE repeater_comments (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  repeater_id uuid REFERENCES repeaters(id) NOT NULL,
  user_id uuid REFERENCES auth.users NOT NULL,
  parent_comment_id uuid REFERENCES repeater_comments(id),
  body text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE repeater_photos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  repeater_id uuid REFERENCES repeaters(id) NOT NULL,
  user_id uuid REFERENCES auth.users NOT NULL,
  storage_path text NOT NULL,
  caption text,
  created_at timestamptz NOT NULL DEFAULT now()
);
```

---

### 11. Integrazione servizi radioamatoriali esterni

**Priorità**: Bassa

**Funzionalità**:
- QRZ.com lookup: dettagli callsign del gestore del ripetitore
- APRS tracking: visualizzare stazioni APRS vicine sulla mappa (modo `aprs` già nell'enum `AccessMode`)
- EchoLink status: stato connessione per ripetitori EchoLink (modo `echolink` già nell'enum)
- Cluster DX: spot DX recenti

**Implementazione**:
- Nuovi client Dio in `lib/clients/` per le API esterne
- Widget dedicati nella pagina dettaglio, caricati on-demand

---

### 12. Onboarding migliorato

**Priorità**: Bassa (package `introduction_screen` già installato)

**Funzionalità**:
- Tutorial interattivo al primo accesso
- Spiegazione mappa, filtri, feedback, preferiti
- "Tour guidato" con highlight delle funzionalità principali
- Possibilità di rivederlo dalle impostazioni

---

## Funzionalità fisiche e curiosità sul ripetitore

Idee focalizzate sugli aspetti fisici, scientifici e di curiosità del singolo ripetitore, da integrare nella pagina dettaglio.

---

### F1. Scheda fisica del sito

Nuova sezione nella pagina dettaglio che mostra le caratteristiche fisiche del sito dove è installato il ripetitore.

**Dati mostrati**:
- **Quota s.l.m.** del ripetitore (da Open-Meteo Elevation API, già usata per il profilo altimetrico)
- **Altezza antenna** e **potenza TX** (da BrandMeister API, campi `antennaHeightM` e `powerWatts` già nel model `BmDevice`)
- **Lunghezza d'onda** della frequenza operativa (calcolabile lato client: λ = c / f)
- **Banda operativa** con nome colloquiale (es. "2 metri", "70 centimetri") dall'enum `FrequencyBand` già nel dominio

**Implementazione**: Calcoli puramente lato client. L'unica chiamata aggiuntiva è l'elevation del punto ripetitore (singola richiesta Open-Meteo, oppure riuso del primo/ultimo punto del profilo altimetrico già calcolato).

---

### F2. Meteo in tempo reale al sito del ripetitore

Il meteo al sito è rilevante: ghiaccio sulle antenne, vento forte, nebbia e umidità influenzano direttamente il funzionamento e la propagazione.

**Dati mostrati**:
- Temperatura attuale, percepita
- Vento (velocità, direzione, raffiche)
- Umidità relativa
- Visibilità
- Precipitazioni
- Icona condizioni meteo

**API**: Open-Meteo Forecast API (gratuita, senza API key, stessa infrastruttura già usata per l'elevation)
- `https://api.open-meteo.com/v1/forecast?latitude={lat}&longitude={lon}&current=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation,weather_code,wind_speed_10m,wind_direction_10m,wind_gusts_10m,visibility`

**UI suggerita**: Card compatta con icona meteo, temperatura prominente, e dettagli vento/umidità in riga sotto. Sfondo che cambia colore in base alle condizioni (azzurro sereno, grigio nuvole, ecc.).

---

### F3. Alba, tramonto e condizioni di luce

Utile per capire le condizioni di propagazione (inversioni termiche all'alba/tramonto favoriscono il tropo-ducting VHF/UHF) e per pianificare attivazioni in portatile.

**Dati mostrati**:
- Orario alba e tramonto al sito del ripetitore (non alla posizione dell'utente)
- Durata del giorno
- Crepuscolo civile (inizio/fine) — rilevante per attivazioni SOTA/POTA
- Indicatore "ora" sulla timeline giornaliera (barra visuale giorno/notte)

**API**: Open-Meteo (`&daily=sunrise,sunset`) oppure calcolo locale con formula astronomica (nessuna API necessaria, le coordinate bastano).

---

### F4. Bearing e azimut verso il ripetitore

L'utente vuole sapere dove puntare la propria antenna direzionale (Yagi, direttiva).

**Dati mostrati**:
- **Azimut** (gradi dal Nord) dall'utente al ripetitore
- **Bussola visuale**: indicatore rotante che punta verso il ripetitore
- **Angolo di elevazione**: inclinazione verticale ottimale dell'antenna (calcolabile da distanza + differenza di quota)
- **Direzione cardinale** testuale (es. "Nord-Est", "Sud-Ovest")

**Implementazione**: Tutto lato client.
- Bearing: formula haversine inversa `atan2(sin(Δlon)·cos(lat2), cos(lat1)·sin(lat2) − sin(lat1)·cos(lat2)·cos(Δlon))`
- Elevazione: `atan2(Δh, distanza)`
- Widget bussola con `Transform.rotate` e `Geolocator.getPositionStream()` per aggiornamento real-time

---

### F5. Link budget e stima del segnale

Calcolo di radiofrequenza che risponde alla domanda: "Il mio segnale arriverà a questo ripetitore?"

**Dati mostrati**:
- **Free Space Path Loss (FSPL)**: attenuazione in spazio libero in dB (`20·log10(d) + 20·log10(f) + 20·log10(4π/c)`)
- **Clearance zona di Fresnel**: la prima zona di Fresnel è libera da ostacoli? (dati dal profilo altimetrico già disponibile)
- **Stima potenza ricevuta**: dato un TX power tipico (5W portatile, 25W mobile, 50W base) e guadagno antenna tipico
- **Verdetto visuale**: semaforo verde/giallo/rosso con spiegazione testuale

**UI suggerita**: Card con slider per selezionare la propria potenza TX e tipo di antenna, con il verdetto che si aggiorna in tempo reale. Barra visuale che mostra il "budget" in dB con le varie voci (TX power → guadagno antenna → FSPL → sensibilità RX).

**Implementazione**: Calcoli lato client. La Fresnel zone richiede i dati del profilo altimetrico (già disponibili dopo la prima chiamata).

---

### F6. Radio horizon e copertura teorica

Quanto "lontano" può arrivare il segnale di questo ripetitore?

**Dati mostrati**:
- **Radio horizon** in km: `d = 4.12 × √(h)` dove h è l'altezza antenna in metri s.l.m.
- **Copertura teorica sulla mappa**: cerchio (o poligono se si considera il terreno) attorno al ripetitore
- **Confronto**: "Questo ripetitore copre teoricamente un raggio di X km — tu sei a Y km" con indicazione dentro/fuori

**UI suggerita**: Overlay sulla mini-mappa del dettaglio, attivabile con toggle. Cerchio semitrasparente colorato in verde (entro il 60% del raggio), giallo (60-90%), rosso (>90%).

---

### F7. Curiosità sulla frequenza e la banda

Sezione "Lo sapevi?" con fatti interessanti calcolati dalla frequenza del ripetitore.

**Contenuti generabili**:
- **Lunghezza d'onda fisica**: "La lunghezza d'onda di questo ripetitore è 2.06 m"
- **Quante volte il segnale oscilla al secondo**: "145.600.000 volte al secondo"
- **Tempo di propagazione** utente→ripetitore: "Il tuo segnale impiega X microsecondi ad arrivare" (`d / c`)
- **Numero di rimbalzi**: quanti cicli completi compie l'onda nel tragitto utente→ripetitore

**Implementazione**: Completamente lato client, nessuna API. Testi localizzati in `app_it.arb` con placeholder per i valori calcolati.

**UI suggerita**: Card con icona lampadina, un fatto alla volta con possibilità di scorrere (PageView dots) o un fatto random ogni volta che si apre il dettaglio.

---

### F8. Storia e attività del ripetitore

Timeline temporale del ripetitore costruita dai dati già disponibili.

**Dati mostrati**:
- **Data di inserimento** nel database (`createdAt` del ripetitore)
- **Ultimo aggiornamento dati** (`updatedAt`)
- **Ultimo feedback positivo** e **ultimo down report** (già in `RepeaterFeedbackStats`)
- **Andamento nel tempo**: grafico sparkline dell'health score negli ultimi N mesi
- **"Attivo da X giorni/mesi/anni"** — calcolato da `createdAt`

**Backend**: Nuova tabella o vista materializzata per health score storico (snapshot periodico). Oppure aggregazione dei feedback per mese via RPC.

**UI suggerita**: Timeline verticale compatta con icone e date, oppure grafico sparkline nell'area performance metrics.

---

### F9. Confronto con la media

Contestualizzare i dati del ripetitore rispetto agli altri nella stessa regione/banda.

**Dati mostrati**:
- "Questo ripetitore è a **X m s.l.m.**, più alto del **Y%** dei ripetitori nella regione"
- "Health score **Z%** — sopra/sotto la media regionale di **W%**"
- "Frequenza nella banda **2m** — la banda più/meno comune in questa regione"
- "È uno dei **N** ripetitori con accesso **DMR + Analogico** nella provincia"

**Backend**: RPC che calcola statistiche aggregate per regione/provincia (count, media quota, media health score). Cacheable lato server.

---

### F10. Panorama 360° e vista dal sito

Mostrare cosa si vede dalla posizione del ripetitore. Utile per capire intuitivamente la copertura.

**Opzioni di implementazione**:
- **Google Street View** (se disponibile nelle vicinanze): embed con `google_maps_flutter` o deep link all'app
- **Mappa di elevazione a raggiera**: vista top-down con raggi colorati in base alla distanza dell'orizzonte per ogni direzione (ogni 5°)
- **Foto della community**: galleria crowdsourced del sito (vedi feature "Community avanzata" nella sezione precedente)

---

### F11. "Portami là" — Navigazione al sito

Per radioamatori che vogliono visitare il sito del ripetitore (manutenzione, curiosità, attivazione portatile nelle vicinanze).

**Funzionalità**:
- Pulsante che apre Google Maps / Apple Maps / Waze con le coordinate
- Tempo di percorrenza stimato (a piedi e in auto)
- Indicazione se il sito è raggiungibile su strada o solo a piedi (basato su dati OSM o semplicemente sulla distanza dalla strada più vicina)

**Implementazione**: `url_launcher` (già presente) con schema `geo:` o URL diretti Maps.

---

### F12. Indice di propagazione in tempo reale

Condizioni solari e geomagnetiche che influenzano la propagazione radio, contestualizzate per la banda del ripetitore.

**Dati mostrati**:
- **Solar Flux Index (SFI)**: attività solare
- **K-index / A-index**: disturbi geomagnetici
- **Previsione propagazione** per la banda specifica (VHF è diverso da UHF)
- **Alert**: se le condizioni sono particolarmente buone (apertura tropo, sporadic-E) o cattive (tempesta geomagnetica)

**API**: NOAA Space Weather (`https://services.swpc.noaa.gov/json/`) oppure HamQSL Solar XML (`https://www.hamqsl.com/solarxml.php`) — entrambe gratuite.

**UI suggerita**: Badge colorato nell'header o nella sezione tecnica: "Propagazione: Buona" con icona sole/nuvola. Espandibile per i dettagli.

---

### Riepilogo priorità - Funzionalità fisiche

| # | Feature | Complessità | API esterna necessaria | Valore per l'utente |
|---|---------|-------------|----------------------|---------------------|
| F1 | Scheda fisica del sito | Bassa | No (riuso Open-Meteo) | Alto |
| F2 | Meteo al sito | Bassa | Open-Meteo (gratuita) | Alto |
| F3 | Alba/tramonto | Bassa | No (calcolo locale) | Medio |
| F4 | Bearing e bussola | Media | No (calcolo locale) | Alto |
| F5 | Link budget | Media | No (riuso profilo altim.) | Alto |
| F6 | Radio horizon | Media | Open-Meteo elevation | Medio-Alto |
| F7 | Curiosità frequenza | Bassa | No | Medio |
| F8 | Storia ripetitore | Media | No (dati interni) | Medio |
| F9 | Confronto con la media | Media | No (nuova RPC) | Medio |
| F10 | Panorama 360° | Alta | Google/OSM | Medio-Basso |
| F11 | Navigazione al sito | Bassa | No (url_launcher) | Alto |
| F12 | Indice propagazione | Bassa | NOAA/HamQSL (gratuita) | Alto |

### Ordine consigliato di implementazione

**Sprint 1** (bassa complessità, alto impatto):
1. F1 — Scheda fisica (quota, potenza, lunghezza d'onda)
2. F7 — Curiosità frequenza ("Lo sapevi?")
3. F11 — Navigazione al sito

**Sprint 2** (API gratuite, alto impatto):
4. F2 — Meteo al sito
5. F4 — Bearing e bussola
6. F12 — Indice propagazione

**Sprint 3** (calcoli avanzati):
7. F5 — Link budget
8. F3 — Alba/tramonto
9. F6 — Radio horizon su mappa

**Sprint 4** (dati aggregati):
10. F8 — Storia ripetitore
11. F9 — Confronto con la media
12. F10 — Panorama 360°

---

## Roadmap suggerita

### Fase 1 - Quick wins
1. Abilitare auth guard
2. Collegare `BmTalkgroupsWidget` al dettaglio ripetitore
3. Implementare "Vedi tutti i feedback"
4. Handler push notifications OneSignal
5. I miei report — Storico segnalazioni utente (pagina in Impostazioni)

### Fase 2 - Core features
6. Logbook QSO (base: inserimento + lista)
7. Filtro per banda nella ricerca/lista
8. Navigazione verso ripetitore ("Portami là")

### Fase 3 - Esperienza avanzata
9. Modalità offline (cache ripetitori + mappe)
10. Copertura RF stimata
11. Logbook QSO (export ADIF + statistiche)

### Fase 4 - Community e crescita
12. Community avanzata (commenti, foto)
13. Confronto ripetitori
14. Widget home screen
