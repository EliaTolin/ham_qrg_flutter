# Research — Cluster Spots Frontend

**Feature**: 002-cluster-spots-frontend
**Date**: 2026-04-12

---

## 1. Supabase Realtime in Flutter — pattern per la prima subscription

### Decision
Usare `supabase.channel()` con `onPostgresChanges()` nei provider Riverpod (notifier), non nei widget. Il canale viene creato nel `build()` del notifier e chiuso nel `dispose()` per i canali legati a una pagina. Il canale personale (`spots:user:{userId}`) viene gestito da un notifier a livello di app (keepAlive) creato post-login e chiuso al logout.

### Rationale
- I notifier Riverpod hanno un lifecycle gestito (`ref.onDispose()`) che si allinea naturalmente alla gestione dei canali Realtime.
- L'approccio evita memory leak perché `ref.onDispose` chiude il canale quando il provider non è più osservato.
- Il canale personale è `keepAlive` perché deve sopravvivere alla navigazione tra pagine.
- Il payload `postgres_changes` contiene solo le colonne della tabella, non i join: il notifier deve fare un re-fetch arricchito (con profilo, access) dopo ogni evento.

### Alternatives considered
- **BLoC/Cubit dedicato** (come suggerito nel quickstart backend): scartato perché il progetto usa esclusivamente Riverpod, non Bloc. Il pattern suggerito nel quickstart è stato adattato a Riverpod notifier.
- **Stream provider** con `supabase.from().stream()`: scartato perché `.stream()` non supporta filtri su colonne arbitrarie e non gestisce il re-fetch arricchito.
- **Canale nel widget** (`useEffect` in `HookConsumerWidget`): scartato perché accoppia la logica di rete al layer di presentazione, violando Clean Architecture (Constitution §I).

---

## 2. Countdown timer — strategia di aggiornamento ogni secondo

### Decision
Usare `Stream.periodic(Duration(seconds: 1))` nel widget `SpotCountdown` per ricalcolare il tempo residuo da `expiresAt`. Il widget ricostruisce solo il testo del countdown, non l'intera lista. Quando `expiresAt <= DateTime.now()`, il notifier rimuove lo spot dalla lista locale senza attendere eventi server.

### Rationale
- Un tick al secondo è sufficiente per l'UX (SC-003: "almeno ogni secondo").
- Il ricalcolo è locale e leggero: un confronto `DateTime`.
- La rimozione lato client allo scadere del timer garantisce SC-004 ("entro 1 secondo") senza dipendere dal server.
- L'uso di `Stream.periodic` nel widget (non nel notifier) evita di rebuilder l'intera lista ogni secondo — solo il singolo widget countdown si aggiorna.

### Alternatives considered
- **Timer globale nel notifier**: scartato perché forzerebbe il rebuild dell'intera lista ogni secondo per aggiornare i countdown di tutti gli spot.
- **Timer.periodic per spot**: scartato perché crea N timer per N spot; `Stream.periodic` in ogni widget è equivalente ma più idiomatico in Flutter/Dart.

---

## 3. Indicatore personale (active_spot_banner) — posizionamento

### Decision
Il banner dello spot attivo è un widget sovrapposto alla bottom navigation nell'`HomeRoute` (sopra il `BottomNavigationBar`). È gestito da `myActiveSpotNotifier` (keepAlive, con canale Realtime `spots:user:{userId}`). Appare solo quando l'utente ha un self-spot attivo; scompare con animazione alla scadenza o chiusura.

### Rationale
- Posizionare il banner sopra la bottom nav garantisce visibilità in tutte le tab (dashboard, lista, mappa, profilo) senza modificare ogni singola pagina.
- Il notifier keepAlive con Realtime garantisce aggiornamenti istantanei (sostituzione, chiusura da altro dispositivo).
- L'altezza del banner non interferisce con il contenuto scrollabile perché è sovrapposto (non inserito nel layout).

### Alternatives considered
- **Snackbar persistente**: scartato perché lo snackbar è per messaggi transitori, non per uno stato persistente che dura minuti.
- **Floating action button custom**: scartato perché occupa lo spazio dedicato ad azioni primarie.
- **App bar personalizzata**: scartato perché modificherebbe il layout di ogni pagina.

---

## 4. Gestione payload notifica push — deep link

### Decision
Aggiungere un handler nel callback OneSignal `setNotificationOpenedHandler` che controlla `data['type'] == 'new_cluster_spot'` ed estrae `data['repeater_id']` per navigare a `RepeaterDetailRoute(repeaterId: ...)` tramite il router globale. Per le notifiche in foreground, usare `setNotificationWillShowInForegroundHandler` per mostrare un banner in-app con azione tap → navigazione.

### Rationale
- OneSignal è già integrato nell'app. I callback esistenti (`initialize`, `login`, `logout`) sono già in place.
- Il payload backend include `data.type`, `data.repeater_id`, `data.spot_id`, `data.spotter_user_id` — tutto il necessario per il deep link.
- La navigazione tramite router globale funziona sia con app in background sia con cold start (il router è disponibile dopo il splash).

### Alternatives considered
- **Universal links / deep links OS-level**: scartato per v1 perché richiederebbe configurazione aggiuntiva (iOS Associated Domains, Android App Links) senza valore aggiunto rispetto all'handler OneSignal.
- **Local notification con flutter_local_notifications**: scartato perché OneSignal gestisce già la visualizzazione della notifica; aggiungerne un layer sarebbe ridondante.

---

## 5. Indicatori mappa (bordo rosso pulsante) e card (punto rosso)

### Decision
Creare un provider `repeatersWithActiveSpotsProvider` che mantiene un `Set<String>` di `repeaterId` con almeno un self-spot attivo. Questo provider è alimentato da una query REST iniziale + subscription Realtime globale. La mappa e le card consultano questo set per decidere se mostrare l'indicatore.

### Rationale
- Un singolo provider con il set di ID è leggero e riutilizzabile sia dalla mappa sia dalle card.
- La query iniziale è un semplice `SELECT DISTINCT repeater_id FROM repeater_spots WHERE closed_at IS NULL AND expires_at > now() AND spotted_callsign IS NULL`.
- Gli eventi Realtime aggiornano il set incrementalmente (aggiungi/rimuovi ID).
- La pulsazione del bordo rosso è un'animazione CSS/Flutter locale, non richiede dati aggiuntivi — basta sapere se il ripetitore ha spot.

### Alternatives considered
- **Query per ogni card/marker**: scartato perché farebbe N query per N ripetitori visibili.
- **Informazione embeddedda nella query ripetitori esistente**: scartato perché modificherebbe le RPC esistenti del backend (fuori scope) e accoppierebbe i due modelli.

---

## 6. Callsign validation per other-spot

### Decision
Il campo callsign nell'other-spot bottom sheet accetta qualsiasi stringa non vuota (trim). Nessuna validazione di formato ITU, nessun lookup esterno. Il backend applica la stessa regola (`CALLSIGN_REQUIRED` se vuoto). L'app mostra un errore se il campo è vuoto al submit.

### Rationale
- Coerente con il backend spec (Q2 clarification: "Solo non-vuoto, nessuna validazione strutturale").
- I callsign non standard (callsign speciali, eventi, nodi) sono comuni nel mondo ham radio e non devono essere bloccati.
- Eventuali abusi sono gestiti out-of-band (fuori scope v1 per spec).

### Alternatives considered
- **Regex ITU base** (es. `[A-Z0-9]{3,}`): scartato per evitare falsi negativi su callsign speciali.
- **Lookup su QRZ/HamQTH**: scartato — fuori scope v1, aggiunge latenza e dipendenza esterna.
