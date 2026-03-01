# HamQRG - TODO Funzionalità

Checklist completa delle funzionalità da implementare, organizzata per fase.

---

## Fase 1 - Quick Wins (infrastruttura già presente)

- [ ] **Auth guard** — Attivare il codice commentato in `app_router.dart`
- [ ] **BrandMeister talkgroups nel dettaglio** — Collegare `BmTalkgroupsWidget` alla pagina dettaglio ripetitore
- [ ] **"Vedi tutti i feedback"** — Implementare navigazione dal pulsante esistente
- [ ] **Push notifications (handler)** — Handler OneSignal in Flutter per notifiche in-app e background
- [ ] **I miei report** — Pagina storico segnalazioni utente raggiungibile da Impostazioni
  - [ ] Backend: aggiungere `status`, `coordinator_response`, `resolved_at` alla tabella report
  - [ ] Backend: RPC `get_user_reports` con join ripetitore
  - [ ] Backend: RLS policy (utente legge solo i propri)
  - [ ] Feature `user_reports/` con Clean Architecture completa
  - [ ] Rotta `UserReportsRoute` in `ProfileRouter`
  - [ ] Voce in pagina Impostazioni
- [ ] **Filtro per banda nella lista** — Usare enum `FrequencyBand` già nel dominio
- [ ] **Onboarding interattivo** — Package `introduction_screen` già installato
- [ ] **Banner ads** — Unit ID definiti in `AppConfigs`

---

## Fase 2 - Core Features

- [ ] **Logbook QSO (base)**
  - [ ] Tabella Supabase `qso_logs`
  - [ ] Feature `logbook/` con Clean Architecture
  - [ ] Pagina lista QSO con filtri
  - [ ] Form inserimento QSO
  - [ ] Auto-fill da pagina dettaglio ripetitore
- [ ] **Navigazione verso ripetitore ("Portami là")** (F11)
  - [ ] Pulsante apertura Google Maps / Apple Maps / Waze
  - [ ] Tempo di percorrenza stimato

---

## Fase 3 - Esperienza Avanzata

- [ ] **Modalità offline**
  - [ ] Database locale (Drift/SQLite) per ripetitori scaricati
  - [ ] Mappe offline Mapbox (`OfflineManager`)
  - [ ] Provider con fallback su dati locali
  - [ ] Indicatore stato connessione
- [ ] **Copertura RF stimata**
  - [ ] Edge Function `estimate_coverage`
  - [ ] Mappa di copertura a raggiera
  - [ ] Verdetto "Mi copre?" (coperto / parziale / non coperto)
  - [ ] Integrazione potenza e altezza antenna da BrandMeister
- [ ] **Logbook QSO (avanzato)**
  - [ ] Export ADIF
  - [ ] Statistiche (conteggio per modo, banda, periodo)

---

## Fase 4 - Community e Crescita

- [ ] **Community avanzata**
  - [ ] Commenti sui ripetitori (thread)
  - [ ] Foto del sito (galleria crowdsourced)
  - [ ] Segnalazione QRM/QRN
  - [ ] Classifica contributori (gamification)
- [ ] **Confronto ripetitori** — Side-by-side 2-3 ripetitori
- [ ] **Monetizzazione**
  - [ ] Banner nella lista ripetitori
  - [ ] Freemium (logbook, export, offline come premium)
  - [ ] RevenueCat per abbonamenti
- [ ] **Widget home screen** — Widget iOS/Android ripetitore più vicino

---

## Funzionalità Fisiche — Pagina Dettaglio Ripetitore

### Sprint 1 (bassa complessità, alto impatto)

- [ ] **F1 — Scheda fisica del sito**
  - [ ] Quota s.l.m. (Open-Meteo Elevation API)
  - [ ] Altezza antenna e potenza TX (da BrandMeister)
  - [ ] Lunghezza d'onda (calcolo client: λ = c / f)
  - [ ] Banda operativa con nome colloquiale
- [ ] **F7 — Curiosità sulla frequenza ("Lo sapevi?")**
  - [ ] Lunghezza d'onda con confronto dimensionale
  - [ ] Oscillazioni al secondo
  - [ ] Tempo di propagazione utente → ripetitore
  - [ ] Caratteristiche della banda
- [ ] **F11 — Navigazione al sito** (incluso in Fase 2)

### Sprint 2 (API gratuite, alto impatto)

- [ ] **F2 — Meteo in tempo reale al sito**
  - [ ] Open-Meteo Forecast API
  - [ ] Card con temperatura, vento, umidità, visibilità
- [ ] **F4 — Bearing e bussola**
  - [ ] Azimut (gradi dal Nord)
  - [ ] Bussola visuale rotante
  - [ ] Angolo di elevazione
  - [ ] Direzione cardinale testuale
- [ ] **F12 — Indice di propagazione in tempo reale**
  - [ ] Solar Flux Index, K-index
  - [ ] Previsione per banda specifica
  - [ ] Badge colorato nell'header

### Sprint 3 (calcoli avanzati)

- [ ] **F5 — Link budget e stima segnale**
  - [ ] Free Space Path Loss (FSPL)
  - [ ] Clearance zona di Fresnel
  - [ ] Stima potenza ricevuta con slider TX power
  - [ ] Verdetto semaforo verde/giallo/rosso
- [ ] **F3 — Alba, tramonto e condizioni di luce**
  - [ ] Orario alba/tramonto al sito
  - [ ] Durata giorno e crepuscolo civile
  - [ ] Barra visuale giorno/notte
- [ ] **F6 — Radio horizon e copertura teorica**
  - [ ] Radio horizon in km
  - [ ] Overlay sulla mini-mappa
  - [ ] Confronto "tu sei a Y km"

### Sprint 4 (dati aggregati)

- [ ] **F8 — Storia e attività del ripetitore**
  - [ ] Timeline: data inserimento, ultimo aggiornamento, ultimo feedback
  - [ ] Grafico sparkline health score
- [ ] **F9 — Confronto con la media regionale**
  - [ ] RPC statistiche aggregate per regione
  - [ ] Quota, health score, banda vs media
- [ ] **F10 — Panorama 360° e vista dal sito**
  - [ ] Google Street View embed
  - [ ] Mappa elevazione a raggiera

---

## Altre Feature (priorità da definire)

- [ ] **Push notifications intelligenti**
  - [ ] Ripetitore preferito down/up
  - [ ] Nuovo ripetitore nella zona
  - [ ] Aggiornamento su report inviato
  - [ ] Preferenze utente per tipo notifica
- [ ] **Ricerca avanzata e filtri**
  - [ ] Filtro per rete (BrandMeister, TGIF, FreeDMR)
  - [ ] Filtro per CTCSS/DCS
  - [ ] Filtro per stato (health score)
  - [ ] Filtro per locator Maidenhead
- [ ] **Integrazione servizi esterni**
  - [ ] QRZ.com lookup callsign
  - [ ] APRS tracking sulla mappa
  - [ ] EchoLink status
  - [ ] Cluster DX
- [ ] **Apple Watch complication** — Frequenza e tono ripetitore più vicino
- [ ] **Quick Actions (3D Touch)** — Accesso rapido a mappa, ricerca, preferiti
