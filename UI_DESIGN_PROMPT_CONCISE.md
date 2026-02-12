# Prompt Design UI - HamQRG App Ponti Radioamatoriali

## App Overview
App mobile per radioamatori per visualizzare, esplorare e interagire con ponti radio (repeater) sul territorio italiano.

**Target:** Radioamatori principianti ed esperti

---

## Funzionalità Core

### 1. Mappa Interattiva
- Mappa con marker colorati per tipo ponte (Analog, D-STAR, DMR, C4FM, etc.)
- Filtri per modalità con chip colorati
- Indicatore posizione utente + pulsante "Torna alla mia posizione"
- Tap marker → Bottom sheet con preview → CTA per dettaglio completo
- Caricamento dinamico in base all'area visibile

### 2. Lista Ponti
- Card scrollabili con: callsign, frequenza, distanza, modalità
- Barra ricerca con debounce
- Filtri modalità sotto search bar
- Ordinamento per distanza

### 3. Dettaglio Ponte
- SliverAppBar con gradiente basato su modalità
- Sezioni:
  - Info tecniche (frequenza, shift, CTCSS) in card moderne
  - Posizione e distanza
  - Recensioni con stelle e commenti
  - Azioni: preferiti, condividi

### 4. Recensioni (solo utenti registrati)
- Valutazione 1-5 stelle
- Commento testuale
- Media visualizzata nel dettaglio

### 5. Account
- Login/Registrazione
- Preferiti (ponti salvati)
- Profilo con statistiche

---

## Design Requirements

### Stile
- **Moderno e pulito**: Minimalista, focus leggibilità
- **Dark/Light mode**: Supporto completo

### Colori
- **Primario**: Blu/Verde distintivo
- **Modalità**: Colore unico per ogni tipo (Analog=blu, D-STAR=verde, etc.)
- **Semantici**: Verde (successo), Rosso (errore), Arancione (warning)

### Componenti Chiave

**Card Ponte Radio:**
- Header con callsign bold
- Badge modalità colorato
- Info essenziali con icone
- Shadow/border per profondità

**Bottom Sheet Preview:**
- Handle drag in alto
- Header con gradiente modalità
- Card compatte per info
- CTA button full-width "Vedi dettagli"

**Filtri:**
- Chip selezionabili orizzontali
- Colori distintivi per modalità
- Stato attivo chiaro

**Mappa:**
- Marker personalizzati colorati
- Cluster quando molti marker
- Controlli zoom intuitivi

---

## Layout Struttura

**Bottom Navigation:** Mappa | Lista | Preferiti | Profilo

**Mappa Screen:**
- Mappa full-screen
- Overlay filtri in alto
- FAB "Torna a me"
- Bottom sheet preview

**Lista Screen:**
- AppBar con search
- Filtri sotto appbar
- Lista card scrollabile
- Pull-to-refresh

**Dettaglio Screen:**
- SliverAppBar con gradiente
- ScrollView con sezioni card
- Sezione recensioni
- Azioni in fondo

---

## Flussi Utente

1. **Trovare ponte:** Mappa → Tap marker → Preview → Dettaglio
2. **Cercare ponte:** Lista → Search → Tap risultato → Dettaglio
3. **Recensione:** Dettaglio → Scroll recensioni → "Aggiungi" → Form stelle + commento
4. **Preferiti:** Dettaglio → Tap cuore → Animazione → Appare in Preferiti

---

## Priorità Design

**Alta:**
- Leggibilità info tecniche
- Chiarezza distinzione modalità
- Navigazione intuitiva

**Media:**
- Estetica moderna
- Animazioni fluide

**Bassa:**
- Effetti visivi avanzati

---

## Deliverable

1. Wireframes schermate principali
2. Mockup alta fedeltà
3. Design System (colori, tipografia, componenti)
4. Prototipo interattivo (opzionale)



