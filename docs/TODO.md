# HamQRG - TODO & Roadmap

Funzionalità ancora da implementare, organizzate per priorità.

> Ultimo aggiornamento stato: 2026-06-15
> Legenda: `[ ]` da fare · `[~]` parziale/in corso · `[x]` completato

---

## ✅ Completato (non in roadmap originale)

- [x] **Abbonamenti RevenueCat + PRO gating** — Client RevenueCat, `requirePro()`, `openProPaywall()`, modelli stato subscription
- [x] **Integrazione SOTA** — Feature `sota/` completa (datasource, repository, domain, presentation), pagine spot + dettaglio con bearing, integrazione dashboard

---

## Fase 1 - Quick Wins

- [ ] **"Vedi tutti i feedback"** — Navigazione dal pulsante esistente (skeleton in `community_reports_section.dart`)
- [ ] **Filtro per banda nella lista** — Usare enum `FrequencyBand` già nel dominio
- [ ] **"Portami là" — Navigazione al sito** — Pulsante apertura Google Maps / Apple Maps / Waze via `url_launcher` (già presente)
- [~] **Richiesta di recensione (In-App Review)** — Provider `in_app_review` già presente (`lib/clients/in_app_review/`), ma manca il trigger effettivo (`requestReview`) nelle feature

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
- [~] **Copertura RF stimata** — Feature `coverage_map/` implementata (datasource HTTP, repository, domain, mapper, pagina mappa copertura, PRO-gated)
  - [x] Servizio copertura + mappa di copertura
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
- [~] **F4 — Bearing e bussola**
  - Calcolo bearing già presente in feature SOTA (`sota/data/mappers/sota_mappers.dart`)
  - Azimut, bussola visuale rotante, angolo di elevazione — da portare sul dettaglio ripetitore
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

- [~] **F8 — Storia e attivita del ripetitore**
  - Health score + likes/reports + timestamp ultima attività già mostrati (`detail/widgets/performance_metrics_section.dart`)
  - [ ] Timeline: data inserimento, ultimo aggiornamento, ultimo feedback
  - [ ] Grafico sparkline health score
- [ ] **F9 — Confronto con la media regionale**
  - RPC statistiche aggregate per regione
  - Quota, health score, banda vs media
- [ ] **F10 — Panorama 360° e vista dal sito**
  - Google Street View embed
  - Mappa elevazione a raggiera

---

## Altre Feature (priorita da definire)

- [~] **Push notifications intelligenti** — Preferenza `cluster_notifications_enabled` nel profilo; manca la logica intelligente (preferito down/up, nuovo ripetitore in zona, aggiornamento su report)
- [~] **Ricerca avanzata e filtri** — Ricerca testuale + filtri AccessMode (CTCSS/DCS) e raggio/distanza già presenti; mancano filtro per rete, health score e locator Maidenhead
- [ ] **Integrazione servizi esterni** — QRZ.com lookup, APRS tracking, EchoLink status, Cluster DX
- [ ] **Apple Watch complication** — Frequenza e tono ripetitore piu vicino
- [ ] **Quick Actions (3D Touch)** — Accesso rapido a mappa, ricerca, preferiti
