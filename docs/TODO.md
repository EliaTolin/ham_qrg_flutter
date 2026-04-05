# HamQRG - TODO & Roadmap

Funzionalità ancora da implementare, organizzate per priorità.

---

## Fase 1 - Quick Wins

- [ ] **"Vedi tutti i feedback"** — Navigazione dal pulsante esistente (skeleton in `community_reports_section.dart`)
- [ ] **Filtro per banda nella lista** — Usare enum `FrequencyBand` già nel dominio
- [ ] **"Portami là" — Navigazione al sito** — Pulsante apertura Google Maps / Apple Maps / Waze via `url_launcher` (già presente)

---

## Fase 2 - Core Features

- [ ] **Logbook QSO (base)**
  - [ ] Tabella Supabase `qso_logs`
  - [ ] Feature `logbook/` con Clean Architecture
  - [ ] Pagina lista QSO con filtri
  - [ ] Form inserimento QSO
  - [ ] Auto-fill da pagina dettaglio ripetitore

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
- [ ] **Widget home screen** — Widget iOS/Android ripetitore più vicino

---

## Funzionalità Pagina Dettaglio Ripetitore

### Sprint 2 (API gratuite, alto impatto)

- [ ] **F2 — Meteo in tempo reale al sito**
  - Open-Meteo Forecast API (gratuita, no API key)
  - Card con temperatura, vento, umidita, visibilita
- [ ] **F4 — Bearing e bussola**
  - Azimut, bussola visuale rotante, angolo di elevazione
  - Tutto lato client (formula haversine)
- [ ] **F12 — Indice di propagazione in tempo reale**
  - Solar Flux Index, K-index (API NOAA/HamQSL gratuite)
  - Previsione per banda specifica
  - Badge colorato nell'header

### Sprint 3 (calcoli avanzati)

- [ ] **F5 — Link budget e stima segnale**
  - FSPL, clearance zona di Fresnel
  - Stima potenza ricevuta con slider TX power
  - Verdetto semaforo verde/giallo/rosso
- [ ] **F3 — Alba, tramonto e condizioni di luce**
  - Orario alba/tramonto al sito, durata giorno
  - Barra visuale giorno/notte
- [ ] **F6 — Radio horizon e copertura teorica**
  - Radio horizon in km, overlay sulla mini-mappa
  - Confronto "tu sei a Y km"

### Sprint 4 (dati aggregati)

- [ ] **F8 — Storia e attivita del ripetitore**
  - Timeline: data inserimento, ultimo aggiornamento, ultimo feedback
  - Grafico sparkline health score
- [ ] **F9 — Confronto con la media regionale**
  - RPC statistiche aggregate per regione
  - Quota, health score, banda vs media
- [ ] **F10 — Panorama 360° e vista dal sito**
  - Google Street View embed
  - Mappa elevazione a raggiera

---

## Altre Feature (priorita da definire)

- [ ] **Push notifications intelligenti** — Ripetitore preferito down/up, nuovo ripetitore nella zona, aggiornamento su report
- [ ] **Ricerca avanzata e filtri** — Per rete, CTCSS/DCS, health score, locator Maidenhead
- [ ] **Integrazione servizi esterni** — QRZ.com lookup, APRS tracking, EchoLink status, Cluster DX
- [ ] **Apple Watch complication** — Frequenza e tono ripetitore piu vicino
- [ ] **Quick Actions (3D Touch)** — Accesso rapido a mappa, ricerca, preferiti
