# Prompt per il Design UI - App Ponti Radioamatoriali

## 📱 Contesto dell'Applicazione

**Nome App:** HamQRG - Visualizzatore Ponti Radioamatoriali

**Obiettivo:** Applicazione mobile per radioamatori che permette di visualizzare, esplorare e interagire con i ponti radio (repeater) presenti sul territorio italiano.

**Target Utenti:** Radioamatori di tutti i livelli (principianti ed esperti) che necessitano di trovare e utilizzare ponti radio nelle loro zone.

---

## 🎯 Funzionalità Principali

### 1. **Visualizzazione Mappa**
- Mappa interattiva con zoom e pan
- Marker colorati per tipo di ponte radio (analogico, digitale, etc.)
- Filtri per modalità (Analog, D-STAR, DMR, C4FM, etc.)
- Indicatore posizione utente con possibilità di centrare la mappa
- Click su marker per vedere preview rapida
- Caricamento dinamico dei ponti in base all'area visibile

### 2. **Visualizzazione Lista**
- Lista scrollabile di ponti radio ordinati per distanza
- Card per ogni ponte con informazioni essenziali
- Barra di ricerca con debounce
- Filtri per modalità
- Indicatore distanza da posizione utente

### 3. **Dettaglio Ponte Radio**
- Pagina completa con tutte le informazioni:
  - Callsign, nome, modalità
  - Frequenza operativa, shift, CTCSS
  - Posizione geografica (locality, region, locator)
  - Manager callsign, network
  - Distanza dall'utente
  - Recensioni e valutazioni
  - Azioni: aggiungi ai preferiti, condividi

### 4. **Sistema Recensioni**
- Possibilità di lasciare recensioni (solo utenti registrati)
- Valutazione con stelle (1-5)
- Commenti testuali
- Visualizzazione media valutazioni
- Filtro recensioni per data/utilità

### 5. **Account Utente**
- Registrazione/Login
- Profilo utente
- Lista preferiti (ponti salvati)
- Cronologia recensioni lasciate
- Statistiche personali

---

## 🎨 Requisiti di Design

### Stile Visivo
- **Moderno e pulito**: Design minimalista con focus sulla leggibilità
- **Accessibilità**: Contrasti adeguati, dimensioni font leggibili, supporto screen reader

### Palette Colori
- **Primario**: Colore distintivo per l'app (es. blu/verde radioamatoriale)
- **Secondario**: Colori per modalità diverse (ogni tipo di ponte ha colore unico)
- **Neutri**: Grigi per testi e sfondi
- **Semantici**: Verde (successo), Rosso (errore), Arancione (warning)

### Tipografia
- **Gerarchia**: Headline, Title, Body, Caption ben definiti
- **Peso**: Bold per enfasi, Regular per testo normale

### Componenti UI Chiave

#### 1. **Card Ponte Radio**
- Header con callsign prominente
- Badge modalità colorato
- Informazioni essenziali (frequenza, distanza)
- Icone intuitive per ogni dato
- Shadow/border per profondità

#### 2. **Bottom Sheet Preview**
- Design moderno con handle drag
- Header con gradiente basato su modalità
- Card informative compatte
- CTA per aprire dettaglio completo
- Animazioni fluide

#### 3. **Filtri**
- Chip selezionabili per modalità
- Colori distintivi per ogni modalità
- Stato attivo/inattivo chiaro
- Layout orizzontale scrollabile

#### 4. **Mappa**
- Marker personalizzati con icone colorate
- Cluster quando molti marker vicini
- Controlli zoom intuitivi
- Pulsante "Torna alla mia posizione" quando lontano

#### 5. **Form Recensione**
- Input stelle per valutazione
- Textarea per commento
- Validazione chiara
- Feedback visivo su azioni

---

## 📐 Layout e Struttura

### Schermate Principali

1. **Home/Navigazione**
   - Bottom navigation bar con: Mappa, Lista, Preferiti, Profilo
   - Tab bar per switch tra mappa e lista nella sezione principale

2. **Mappa**
   - Mappa full-screen
   - Overlay con filtri in alto
   - FAB per tornare alla posizione
   - Bottom sheet per preview ponte

3. **Lista**
   - AppBar con ricerca
   - Filtri sotto appbar
   - Lista scrollabile di card
   - Pull-to-refresh

4. **Dettaglio Ponte**
   - SliverAppBar con gradiente e info principali
   - ScrollView con sezioni:
     - Informazioni tecniche (card)
     - Posizione e distanza
     - Recensioni (lista)
     - Azioni (preferiti, condividi)

5. **Profilo**
   - Header con avatar e nome
   - Sezioni: Preferiti, Recensioni, Impostazioni
   - Logout

---

## 🔄 Flussi Utente Principali

### Flusso 1: Trovare un Ponte Radio
1. Apri app → Mappa si carica con posizione utente
2. Vedi marker sulla mappa
3. Tap su marker → Bottom sheet con preview
4. Tap "Vedi dettagli" → Pagina completa
5. Leggi informazioni e recensioni

### Flusso 2: Cercare un Ponte Specifico
1. Vai a Lista
2. Digita nella barra di ricerca
3. Risultati filtrati in tempo reale
4. Tap su risultato → Dettaglio

### Flusso 3: Lasciare una Recensione
1. Apri dettaglio ponte
2. Scroll a sezione recensioni
3. Tap "Aggiungi recensione" (se loggato)
4. Compila form con stelle e commento
5. Submit → Recensione pubblicata

### Flusso 4: Salvare nei Preferiti
1. Apri dettaglio ponte
2. Tap icona cuore/preferiti
3. Conferma visiva (animazione)
4. Ponte appare in sezione Preferiti

---

## ✨ Elementi di Design Specifici

### Icone
- **Mappa**: Icona mappa con marker
- **Lista**: Icona lista/griglia
- **Preferiti**: Icona cuore
- **Profilo**: Icona utente
- **Modalità**: Icone distintive per ogni tipo (radio, satellite, etc.)
- **Informazioni**: Icone standard Material (location, frequency, etc.)

### Animazioni
- Transizioni fluide tra schermate
- Micro-interazioni su tap (ripple effect)
- Loading states con skeleton screens
- Animazioni di successo per azioni completate
- Smooth scroll e parallax dove appropriato

### Stati UI
- **Loading**: Skeleton screens o spinner elegante
- **Empty**: Illustrazione + messaggio motivante
- **Error**: Messaggio chiaro + CTA per riprovare
- **Success**: Feedback visivo positivo

### Spacing e Dimensioni
- Padding consistente: 16px standard, 8px per elementi compatti
- Border radius: 12px per card, 8px per chip
- Elevation: Shadow leggere per profondità
- Touch targets: Minimo 48x48dp

---

## 🎯 Priorità Design

### Priorità Alta
1. Leggibilità delle informazioni tecniche (frequenza, shift, CTCSS)
2. Chiarezza nella distinzione tra modalità diverse
3. Facilità di navigazione tra mappa e lista
4. Accesso rapido alle informazioni essenziali

### Priorità Media
1. Estetica moderna e accattivante
2. Animazioni fluide
3. Personalizzazione tema

### Priorità Bassa
1. Effetti visivi avanzati
2. Illustrazioni decorative
3. Elementi puramente estetici

---

## 📱 Piattaforme Target

- **iOS**: Design conforme alle linee guida Human Interface Guidelines
- **Android**: Design conforme alle linee guida Material Design 3
- **Responsive**: Supporto per tablet (layout adattivo)

---


---

## 📝 Note Aggiuntive

- L'app deve essere utilizzabile anche offline (cache dati mappa e lista)
- Performance: caricamento veloce, animazioni a 60fps
- Localizzazione: Supporto italiano (con possibilità di estendere)
- Accessibilità: Supporto completo per screen reader e contrasti adeguati

---

## 🎨 Deliverable Richiesti

1. **Wireframes** per tutte le schermate principali
2. **Mockup ad alta fedeltà** con design system completo
3. **Design System** con:
   - Palette colori
   - Tipografia
   - Componenti UI riutilizzabili
   - Icone e illustrazioni
4. **Prototipo interattivo** (opzionale ma consigliato)
5. **Specifiche tecniche** per implementazione

