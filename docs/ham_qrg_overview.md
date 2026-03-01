# HamQRG - Ripetitori Radio

## Cos'è HamQRG

HamQRG è un'applicazione mobile per la scoperta e l'interazione con i ripetitori radioamatoriali in Italia. Permette a radioamatori e ascoltatori di trovare ripetitori nelle vicinanze, consultare i dati tecnici, visualizzarli su mappa interattiva, lasciare feedback sulla qualità del segnale e gestire una lista di preferiti.

**Tagline:** "Scopri i ripetitori che ti circondano"

| Info | Dettaglio |
|------|-----------|
| Piattaforme | iOS, Android |
| Lingua | Italiano |
| Sito web | https://hamqrg.com/ |
| Community Telegram | https://t.me/hamqrg |
| Powered by | IU4VRB |
| Sviluppato da | Aurora Digital (info@auroradigital.it) |
| Fonte dati ripetitori | IZ8WNH (https://www.iz8wnh.it) |
| App Store ID (iOS) | 6754508610 |

---

## Utenti target

- **Radioamatori con licenza** — operatori con nominativo ufficiale (es. IU2XYZ)
- **Ascoltatori SWL** (Short Wave Listener) — appassionati senza licenza, con eventuale nominativo SWL (es. I1-12345-SWL)
- **Appassionati di radio** — chiunque voglia esplorare il mondo dei ripetitori

---

## Funzionalità principali

### 1. Dashboard (Home)

La schermata principale mostra una mappa Mapbox in stile OUTDOORS nella metà superiore, con i ripetitori nelle vicinanze. In alto a destra viene visualizzato il **Maidenhead locator** dell'utente (es. `JN54IO`), calcolato dal GPS.

Un bottom sheet trascinabile contiene:

- **Accesso rapido**: due card — "Lista ripetitori" (con conteggio totale) e "I miei preferiti" (con conteggio salvati)
- **Vicino a te**: lista scrollabile dei 10 ripetitori più vicini, con badge del modo operativo, frequenza e distanza

Al primo avvio vengono mostrati:
- Un disclaimer sulla fonte dei dati (IZ8WNH)
- Un invito a unirsi al gruppo Telegram della community

### 2. Lista ripetitori

Lista ricercabile e filtrabile dei ripetitori.

**Ricerca:**
- Barra di ricerca con debounce 500ms
- Cerca per nome, nominativo o frequenza (MHz)
- Ricerca fuzzy lato server (PostgreSQL `pg_trgm` + `similarity()`)

**Filtri per modo operativo (chip orizzontali):**
- Tutti i modi, Analogico, DMR, C4FM, D-STAR, Echolink, AllStar, Winlink

**Ordinamento:**
- Distanza (default), Likes, Frequenza

Ogni card mostra: badge del modo, frequenza, distanza dall'utente e statistiche feedback.

### 3. Mappa interattiva

Mappa Mapbox a schermo intero con le seguenti funzionalità:

- **Posizione utente** con pulsing animation, anello di accuratezza e indicatore di direzione
- **Caricamento dinamico** — i ripetitori vengono caricati in base ai confini visibili della mappa (aggiornamento con debounce 500ms)
- **Clustering nativo Mapbox** — raggruppa ripetitori vicini, tap sul cluster per zoomare
- **Clustering same-location** — ripetitori con coordinate identiche vengono raggruppati; il tap apre un bottom sheet con la lista completa
- **Marker dinamici** — icone generate in runtime per ogni combinazione di modi operativi del ripetitore
- **Filtri per modo** — chip nella parte superiore della mappa
- **Chip conteggio** — mostra "N ripetitori trovati"
- **FAB "Torna alla mia posizione"** — ricentra e zooma sulla posizione GPS dell'utente
- Tap su un marker singolo apre un bottom sheet di anteprima con link alla pagina di dettaglio

### 4. Dettaglio ripetitore

Pagina completa per un singolo ripetitore, strutturata in sezioni:

**Header:**
- Nome/nominativo, frequenza principale (grande), regione/provincia, località, locator Maidenhead, distanza

**Azioni:**
- Salva/rimuovi dai preferiti (bookmark)
- Condividi (share sheet nativo con URL)
- Segnala problema (navigazione alla pagina report)

**Metriche di performance:**
- Conteggio Like totali e segnalazioni Down (ultimo anno)
- **Health Score** — indicatore circolare percentuale (0–100):
  - >= 80%: Eccellente (verde)
  - >= 60%: Buono (blu)
  - >= 40%: Discreto (ambra)
  - < 40%: Da verificare (arancione)
- Timestamp dell'ultimo like e dell'ultima segnalazione (tempo relativo)

**Dati tecnici:**
- Frequenza TX (MHz), Shift (Hz), Subtono/CTCSS, badge dei modi

**Modi di accesso:**
Ogni modo ha la propria card con gradiente nel colore del modo:
- **Analogico:** CTCSS Tx/Rx (Hz), codice DCS
- **DMR:** Color Code, Node ID (DMR ID), talkgroup BrandMeister (se applicabile)
- **C4FM:** DG-ID, Node ID
- **Altri modi:** Node ID, CTCSS/DCS, note
- Badge della rete su ogni card (BrandMeister, TGIF, ecc.)

**Posizione:**
- Mini mappa statica Mapbox embedded
- Località, regione, provincia, distanza
- Link alla mappa feedback e al **Profilo altimetrico**

**Info:**
- Fonte dati, gestore del ripetitore (se noto)

**Feedback della community:**
- Form di feedback (vedi sezione dedicata)
- Il proprio ultimo feedback con opzione di eliminazione
- Lista dei feedback di altri utenti

### 5. Profilo altimetrico

Bottom sheet che mostra il profilo di elevazione del terreno tra la posizione GPS dell'utente e il ripetitore.

- Grafico a linea: elevazione (m) su asse Y, distanza (km) su asse X
- Indica se la **linea di vista** (line-of-sight) è libera o ostruita dal terreno
- Mostra: elevazione ripetitore, elevazione utente, distanza totale
- I dati vengono calcolati lato server tramite funzione RPC Supabase

### 6. Feedback e community

Richiede autenticazione. Il form di feedback permette di:

1. Selezionare il **tipo di stazione** (Portatile, Mobile, Fisso)
2. Selezionare l'**accesso** (quale modo operativo specifico)
3. Inserire la **posizione** (campo di testo con autocomplete tramite geocoding Mapbox)
4. Aggiungere **osservazioni sul segnale** / commento (opzionale)
5. Inviare come **Like** o come **Segnala problema** (down)

**Validazione distanza:**
- Sotto 100 km: invio diretto
- 100–400 km: dialog di conferma
- Oltre 400 km: bloccato

I feedback mostrano: nominativo/nome utente, tipo stazione, timestamp, tipo (like/down), commento.

### 7. Preferiti

Pagina privata (richiede autenticazione) con i ripetitori salvati dall'utente.

- Ricerca con debounce 300ms (per nominativo, nome, località, regione)
- Filtro per modo operativo
- Conteggio "N di M stazioni preferite"
- Swipe per rimuovere dai preferiti

### 8. Segnalazione problemi

Form a schermo intero (richiede auth) per segnalare dati errati o mancanti su un ripetitore:

- Descrizione (minimo 10 caratteri, massimo 2000)
- Checkbox di conferma: "Confermo che queste informazioni sono corrette in base alla mia osservazione"
- Avviso che le segnalazioni vengono verificate dai coordinatori regionali prima dell'aggiornamento nel database pubblico

### 9. Integrazione BrandMeister

Per i ripetitori DMR collegati alla rete BrandMeister, la card DMR mostra una sezione espandibile con:

- **Info dispositivo:** hardware, firmware, potenza, altezza antenna, descrizione, ultimo avvistamento
- **Talkgroup statici** configurati, con timeslot e nome del talkgroup
- Le descrizioni HTML/Markdown vengono renderizzate nativamente

### 10. Mappa feedback (Distance Map)

Mappa dedicata che mostra la distribuzione geografica dei feedback (like e segnalazioni down) per un ripetitore specifico, con indicatori che connettono le posizioni degli utenti al ripetitore. Fornisce dati visivi sulla copertura.

---

## Autenticazione

| Metodo | Piattaforma | Dettaglio |
|--------|-------------|-----------|
| Sign in with Apple | iOS | Login nativo Apple |
| Sign in with Google | iOS, Android | Google Sign-In |
| Email/Password | Tutte | Registrazione, login, reset password |
| Anonimo | Tutte | Accesso completo in sola lettura senza registrazione |

**Utenti anonimi** possono navigare tutti i dati pubblici (lista, mappa, dettaglio ripetitore). Le azioni protette (preferiti, feedback, segnalazioni) richiedono la registrazione tramite un prompt a bottom sheet con:
- Lista benefici (valutare ripetitori, preferiti, logbook)
- Pulsanti Apple/Google sign-in
- Nota: "Registrazione gratuita. Non è necessaria la licenza per visualizzare i dati pubblici."

---

## Onboarding post-registrazione

Flusso in 2 step dopo la prima registrazione:

**Step 1 — Selezione tipo utente:**
- "Sei un radioamatore?" → Sì (Licensed) / No, sono un ascoltatore (SWL)

**Step 2a — Radioamatore:**
- Inserimento nominativo ufficiale (es. `IU2XYZ`)

**Step 2b — Ascoltatore SWL:**
- "Hai un nominativo SWL ufficiale?" → Sì (inserimento) / No (procede senza)

Il tipo utente e il nominativo sono salvati nel profilo Supabase. L'utente può riavviare il processo di identificazione dalle Impostazioni.

---

## Profilo e impostazioni

### Profilo
- Avatar, nominativo (primario) o nome completo, link a Impostazioni
- Sezione Community & Supporto: Telegram, Contattaci (email), Logout
- Versione app

### Impostazioni
- Foto profilo (seleziona da galleria, caricata su Supabase Storage)
- Nome e cognome modificabili
- Nominativo (sola lettura — modificabile solo tramite processo di identificazione)
- **Tema**: System / Light / Dark (segmented button)
- **Zona pericolosa**: Elimina account (con dialog di conferma)

---

## Modello dati

### Ripetitore
| Campo | Tipo | Descrizione |
|-------|------|-------------|
| id | String | Identificativo univoco |
| frequencyHz | int | Frequenza TX in Hz |
| callsign | String? | Nominativo (es. IR2XYZ) |
| name | String? | Nome del ripetitore |
| manager | String? | Gestore/operatore |
| shiftHz | int? | Shift TX-RX in Hz |
| region | String? | Regione |
| provinceCode | String? | Codice provincia |
| locality | String? | Località |
| locator | String? | Maidenhead locator |
| latitude/longitude | double? | Coordinate GPS |
| accesses | List | Lista dei modi di accesso |
| source | String | Fonte dati (es. IZ8WNH) |

### Accesso ripetitore
| Campo | Tipo | Descrizione |
|-------|------|-------------|
| mode | AccessMode | Modo operativo |
| ctcssTxHz/ctcssRxHz | double? | Toni CTCSS |
| dcsCode | int? | Codice DCS |
| colorCode | int? | DMR Color Code (0-15) |
| nodeId | int? | DMR ID / Node ID |
| dgId | int? | C4FM DG-ID |
| network | Network? | Rete associata |
| notes | String? | Note |

### Modi operativi supportati
| Modo | Colore | Hex |
|------|--------|-----|
| Analogico | Cyan | `#13C8EC` |
| DMR | Viola | `#A855F7` |
| D-STAR | Verde | `#10B981` |
| C4FM | Arancione | `#F97316` |
| Echolink | Rosa | `#EC4899` |
| AllStar | Verde | `#22C55E` |
| Winlink | Violetto | `#8B5CF6` |

### Reti
Ogni accesso può essere associato a una rete (es. BrandMeister, TGIF). Le reti hanno un tipo: DMR, C4FM, D-Star, VoIP, Mixed, Other.

### Bande di frequenza
10m (28 MHz), 6m (50 MHz), 4m (70 MHz), 2m (144 MHz), 1.25m (219 MHz), 70cm (420 MHz), 33cm (902 MHz), 23cm (1240 MHz), 13cm+ (2300 MHz)

---

## Branding e design

### Palette colori
| Ruolo | Hex |
|-------|-----|
| Primary (Cyan) | `#13C8EC` |
| Primary Dark | `#0FA5C4` |
| Primary Light | `#4DD5F0` |
| Secondary (Blu) | `#1A5FFF` |
| Background Light | `#F6F8F8` |
| Background Dark | `#101F22` |
| Surface Dark | `#162629` |
| Success | `#10B981` |
| Error | `#EF4444` |
| Warning | `#F59E0B` |
| Info | `#3B82F6` |
| Preferito (cuore) | `#EF4444` |

### Tipografia
Font: **Inter** (Google Fonts)

### Temi supportati
- **System** — segue impostazione OS
- **Light** — background `#F6F8F8`
- **Dark** — background `#101F22`, superfici teal scuro

---

## Navigazione

```
Home (4 tab nella bottom navigation)
├── Dashboard (icona casa)
├── Lista ripetitori (icona lista)
├── Mappa (icona mappa)
└── Profilo (avatar utente / nominativo, oppure "Accedi" se anonimo)

Pagine secondarie:
├── Dettaglio ripetitore (/repeater/:id)
├── Segnalazione problema (/repeater/:id/report)
├── Mappa feedback ripetitore (/repeater/:id/map)
├── Impostazioni utente (/settings)
├── Onboarding post-login
└── Cambio password
```

---

## Stack tecnologico

| Servizio | Utilizzo |
|----------|----------|
| **Supabase** | Database PostgreSQL, autenticazione, RLS policies, RPC functions, Storage (foto profilo) |
| **Mapbox** | Mappe interattive, marker, clustering, stile OUTDOORS, geocoding API |
| **BrandMeister API** | Dati dispositivi DMR live, talkgroup |
| **Sentry** | Error tracking e performance monitoring |
| **OneSignal** | Push notifications |

---

## Funzionalità chiave per il sito web

Di seguito le funzionalità e i contenuti rilevanti per il team che svilupperà il sito web di HamQRG:

1. **Landing page** — presentare HamQRG con tagline, screenshot, link agli store (App Store ID: 6754508610)
2. **Link Telegram** — https://t.me/hamqrg per la community
3. **Deep link ai ripetitori** — l'app supporta deep link a ripetitori specifici (`/repeater/:id`); il sito potrebbe fungere da pagina di fallback per chi non ha l'app installata
4. **Apple App Site Association** — file già presente in `docs/apple-app-site-association` per Universal Links iOS
5. **Android Asset Links** — file già presente in `docs/assetlinks.json` per App Links Android
6. **Contatti** — info@auroradigital.it
7. **Attribuzione dati** — IZ8WNH (https://www.iz8wnh.it) come fonte primaria dei dati
8. **Privacy policy e termini** — necessari per gli store

---

## File di configurazione deep link esistenti

Il progetto include già i file necessari per il funzionamento dei deep link:

- `docs/apple-app-site-association` — per iOS Universal Links
- `docs/assetlinks.json` — per Android App Links

Questi file devono essere serviti dal dominio `hamqrg.com` nelle path corrette:
- `https://hamqrg.com/.well-known/apple-app-site-association`
- `https://hamqrg.com/.well-known/assetlinks.json`