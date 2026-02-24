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
| Banner ads | Unit ID definiti in `AppConfigs` | Medio |

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

### 2. Push Notifications intelligenti

**Priorità**: Alta (OneSignal già configurato)

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

### 3. Copertura RF stimata

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

### 4. Modalità offline

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

### 5. Ricerca avanzata e filtri

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

### 6. Navigazione verso il ripetitore

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

### 7. Widget e complicazioni

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

### 8. Confronto ripetitori

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

### 9. Community avanzata

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

### 10. Integrazione servizi radioamatoriali esterni

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

### 11. Monetizzazione

**Priorità**: Da definire (unit ID ads già configurati)

**Modelli possibili**:
- Banner non invasivi nella lista ripetitori (ogni N elementi)
- Interstitial prima di funzionalità premium
- Freemium: logbook illimitato, export ADIF, mappe offline come features premium
- Rimozione ads con abbonamento o acquisto una tantum

**Implementazione**:
- Google Mobile Ads SDK (package `google_mobile_ads`)
- RevenueCat per gestione abbonamenti cross-platform
- Feature flags per abilitare/disabilitare funzionalità premium

---

### 12. Onboarding migliorato

**Priorità**: Bassa (package `introduction_screen` già installato)

**Funzionalità**:
- Tutorial interattivo al primo accesso
- Spiegazione mappa, filtri, feedback, preferiti
- "Tour guidato" con highlight delle funzionalità principali
- Possibilità di rivederlo dalle impostazioni

---

## Roadmap suggerita

### Fase 1 - Quick wins
1. Abilitare auth guard
2. Collegare `BmTalkgroupsWidget` al dettaglio ripetitore
3. Implementare "Vedi tutti i feedback"
4. Handler push notifications OneSignal

### Fase 2 - Core features
5. Logbook QSO (base: inserimento + lista)
6. Filtro per banda nella ricerca/lista
7. Navigazione verso ripetitore ("Portami là")

### Fase 3 - Esperienza avanzata
8. Modalità offline (cache ripetitori + mappe)
9. Copertura RF stimata
10. Logbook QSO (export ADIF + statistiche)

### Fase 4 - Community e crescita
11. Community avanzata (commenti, foto)
12. Confronto ripetitori
13. Monetizzazione
14. Widget home screen
