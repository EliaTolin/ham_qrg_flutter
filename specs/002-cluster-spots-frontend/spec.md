# Feature Specification: Cluster Spots — Frontend (Flutter App)

**Feature Branch**: `002-cluster-spots-frontend`
**Created**: 2026-04-12
**Status**: Draft
**Input**: Implementazione frontend dei cluster spots nella Flutter app. I cluster permettono ai radioamatori due azioni distinte, come nel DX cluster classico: **spottarsi** (self-spot: "sono in ascolto su questo ponte, venite a chiamarmi") e **spottare un altro OM** (other-spot: "ho sentito IZ0XYZ su questo ponte"). L'app mostra in tempo reale gli spot attivi, gli ultimi spot delle 24h, invia notifiche push ai preferiti e permette di gestire le preferenze di notifica. Il backend (Edge Functions, RPC, Realtime, data model) è già specificato e in fase di implementazione nel repo `ham_qrg_supabase` (spec `001-cluster-spots`).

## Clarifications

### Session 2026-04-12

- Le specifiche backend sono già complete: Edge Functions `create-spot` e `close-spot`, tabella `repeater_spots`, canali Realtime, trigger notifiche push, flag notifica su `profiles` e `user_favorite_repeaters`.
- L'app non utilizza attualmente alcuna subscription Realtime — questa è la prima feature che introduce il pattern.
- Le notifiche push sono gestite via OneSignal; il payload `data.type = "new_cluster_spot"` deve essere routato alla scheda del ponte (`data.repeater_id`).
- L'utente anonimo non può creare spot (richiede callsign valorizzato → richiede autenticazione completa).
- Esistono due tipi di spot: **self-spot** (spottarsi, con durata 5–60 min, stato attivo/scaduto, max 1 per utente) e **other-spot** (spottare un altro OM, senza durata, record storico puro, nessun vincolo di unicità). Gli other-spot compaiono solo in "Ultimi spot", MAI nella sezione "Spot attivi" della scheda ponte.
- Il range di durata nel frontend è 5–60 minuti (il backend accetta 1–600, ma l'app limita la scelta a 5–60).
- Q: Gli "Ultimi spot" vivono solo come tab nella dashboard o hanno anche una pagina full-screen? → A: Tab nella dashboard (DraggableScrollableSheet, accanto a Ripetitori e POTA) + link "Vedi tutti" che apre una pagina full-screen con la stessa lista.
- Q: I ripetitori con spot attivi devono avere un indicatore visivo sulla mappa? → A: Sì, bordo rosso pulsante sul marker del ripetitore (senza contatore numerico). Nessun indicatore per i ripetitori senza spot attivi.
- Q: Le card dei ripetitori (lista e preferiti) devono mostrare la presenza di spot attivi? → A: Sì, un punto rosso (senza numero) sulla card per indicare che c'è almeno un self-spot attivo sul ripetitore.

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Spottarsi su un ponte (Priority: P1)

Un radioamatore autenticato con callsign valorizzato apre la scheda dettaglio di un ponte ripetitore. Nella sezione dedicata al cluster, tocca il pulsante "Spottati" — un gesto che richiama l'auto-spot dei DX cluster: l'utente dichiara "sono qui, in frequenza, venite a chiamarmi". Si apre un bottom sheet dove sceglie la durata (da un set di opzioni predefinite oppure un valore personalizzato tra 5 e 60 minuti) e opzionalmente seleziona uno degli access configurati per quel ponte (es. DMR, FM, C4FM). Conferma e il sistema crea lo spot. Da quel momento l'utente risulta "spottato" su quel ponte e vede un indicatore persistente nell'app con countdown del tempo residuo. Può chiudere lo spot manualmente in qualsiasi momento. Se si spotta su un altro ponte, il precedente viene automaticamente sostituito (un solo spot attivo per utente, come un singolo segnale di presenza).

**Why this priority**: Senza la possibilità di spottarsi, nessuna altra funzionalità cluster ha senso. Questa user story costituisce il cuore dell'interazione e da sola permette all'utente di dichiarare la propria presenza attiva su un ponte.

**Independent Test**: Un utente con callsign apre la scheda di un ponte, si spotta per 10 minuti, osserva il countdown, chiude lo spot manualmente e verifica che non sia più attivo. Si spotta su un altro ponte e verifica che il primo venga sostituito.

**Acceptance Scenarios**:

1. **Given** un utente autenticato con callsign valorizzato che visualizza la scheda di un ponte, **When** tocca "Spottati" e conferma con durata 30 minuti, **Then** vede un indicatore "Sei spottato" con countdown di 30 minuti, e lo spot appare nella sezione "Spot attivi" della scheda ponte.
2. **Given** un utente anonimo o senza callsign che visualizza la scheda di un ponte, **When** tocca "Spottati", **Then** viene mostrato un messaggio che invita a completare il profilo (callsign) o ad autenticarsi, senza creare alcuno spot.
3. **Given** un utente con uno spot attivo sul ponte A, **When** crea un nuovo spot sul ponte B, **Then** lo spot sul ponte A scompare dall'indicatore personale e viene sostituito da quello sul ponte B.
4. **Given** un utente con uno spot attivo, **When** tocca il pulsante di chiusura dello spot, **Then** lo spot viene chiuso e l'indicatore personale scompare.
5. **Given** un utente con uno spot attivo il cui tempo residuo raggiunge zero, **When** il countdown termina, **Then** l'indicatore mostra lo spot come "scaduto" e scompare dalla sezione "Spot attivi" senza alcuna azione dell'utente.
6. **Given** un utente che seleziona un access specifico (es. DMR) in fase di creazione, **When** lo spot viene creato, **Then** l'access dichiarato è visibile sia nell'indicatore personale sia nella sezione "Spot attivi" del ponte.
7. **Given** un utente che crea uno spot senza selezionare un access, **When** lo spot viene creato, **Then** lo spot appare come "generico" senza indicazione di access specifico.
8. **Given** un errore dal backend (es. durata fuori range, ponte non trovato), **When** l'utente conferma la creazione, **Then** viene mostrato un messaggio di errore comprensibile in lingua italiana con indicazione su come risolvere.

---

### User Story 1b - Spottare un altro OM su un ponte (Priority: P1)

Un radioamatore con callsign valorizzato apre la scheda dettaglio di un ponte e tocca "Spotta un OM" — segnala di aver sentito un altro operatore su quel ponte, nello stile del DX cluster classico. Inserisce il callsign dell'OM sentito e opzionalmente seleziona l'access. Non indica alcuna durata: l'other-spot è una segnalazione istantanea ("ho sentito IZ0XYZ adesso su questo ponte"), non una dichiarazione di presenza prolungata.

L'other-spot compare nella sezione "Ultimi spot" (24h) ma **NON** nella lista "Spot attivi" della scheda ponte (perché non è l'OM segnalato a dichiararsi attivo — è una segnalazione di terzi). Il vincolo "1 spot attivo per utente" non si applica: un utente può spottare più OM senza che questo chiuda il suo eventuale self-spot attivo. Le notifiche push ai preferiti scattano normalmente.

**Why this priority**: Estende il modello DX cluster classico — senza la possibilità di spottare altri OM, la feature copre solo l'auto-dichiarazione. Va in P1 perché usa lo stesso flusso di creazione con un parametro in più (`spotted_callsign`), nessuna nuova infrastruttura.

**Independent Test**: Un utente con callsign crea un other-spot inserendo il callsign "IZ0XYZ" su un ponte. Lo spot compare in "Ultimi spot" ma NON in "Spot attivi" del ponte. L'utente crea poi un self-spot: l'other-spot resta invariato. L'utente crea 3 other-spot diversi su 3 ponti: tutti e 3 esistono.

**Acceptance Scenarios**:

1. **Given** un utente autenticato con callsign nella scheda di un ponte, **When** tocca "Spotta un OM" e inserisce il callsign "IZ0XYZ", **Then** viene creato uno spot senza durata e senza scadenza, con il callsign dell'OM spottato visibile.
2. **Given** un utente con un self-spot attivo sul ponte A, **When** crea un other-spot sul ponte B, **Then** il self-spot sul ponte A resta attivo (non viene sostituito).
3. **Given** un utente, **When** crea 3 other-spot diversi su ponti diversi, **Then** tutti e 3 esistono contemporaneamente (nessun vincolo di unicità).
4. **Given** un other-spot esiste su un ponte, **When** un utente visualizza la sezione "Spot attivi" di quel ponte, **Then** l'other-spot NON compare (compare solo in "Ultimi spot").
5. **Given** un other-spot, **When** viene visualizzato nella sezione "Ultimi spot", **Then** mostra il callsign dell'OM spottato, il callsign di chi ha spottato, il ponte, e un badge che lo identifica come segnalazione (distinto visivamente dal self-spot).
6. **Given** un utente che ha il ponte tra i preferiti con notifiche attive, **When** un altro utente crea un other-spot su quel ponte, **Then** riceve la notifica push come per un self-spot.
7. **Given** un utente anonimo o senza callsign, **When** tenta di creare un other-spot, **Then** viene mostrato il prompt di registrazione o il messaggio di callsign richiesto.

---

### User Story 2 - Vedere chi si è spottato su un ponte (Priority: P1)

Un radioamatore apre la scheda dettaglio di un ponte e nella sezione "Spot attivi" vede l'elenco degli utenti che si sono spottati su quel ponte. Per ogni spot attivo sono visibili: callsign dell'operatore, eventuale access dichiarato (con colore corrispondente alla modalità), tempo residuo con countdown in tempo reale. La lista si aggiorna automaticamente senza refresh manuale: nuovi spot compaiono, spot chiusi o scaduti scompaiono.

Se nessuno è spottato, la sezione mostra uno stato vuoto esplicito con un invito all'azione ("Nessuno spottato al momento — spottati tu!").

**Why this priority**: Complemento essenziale della US1. Senza visibilità sugli spot altrui, dichiararsi in ascolto non ha effetto pratico. Insieme alla US1 forma l'MVP della feature cluster.

**Independent Test**: Due utenti A e B guardano la scheda dello stesso ponte. A crea uno spot: B lo vede comparire entro pochi secondi. A chiude lo spot: B lo vede scomparire senza ricaricare la pagina.

**Acceptance Scenarios**:

1. **Given** un utente visualizza la scheda di un ponte con spot attivi, **When** la pagina si carica, **Then** vede la lista degli spot attivi con callsign, access dichiarato (se presente) e countdown del tempo residuo.
2. **Given** un utente sta visualizzando la scheda di un ponte, **When** un altro utente crea uno spot su quel ponte, **Then** il nuovo spot compare nella sezione "Spot attivi" entro pochi secondi senza refresh manuale.
3. **Given** uno spot attivo è visibile nella sezione "Spot attivi", **When** lo spot viene chiuso (manualmente, per sostituzione o per scadenza), **Then** scompare dalla sezione entro pochi secondi.
4. **Given** uno spot ha un access dichiarato (es. DMR), **When** viene visualizzato, **Then** mostra l'access con il colore corrispondente alla modalità (Purple per DMR, Blue per FM, ecc.).
5. **Given** un ponte con 0 spot attivi, **When** un utente apre la scheda, **Then** la sezione "Spot attivi" mostra esplicitamente "Nessuno spottato al momento" con un invito a spottarsi.
6. **Given** uno spot il cui `expires_at` viene superato mentre l'utente sta guardando la pagina, **When** il countdown raggiunge zero, **Then** lo spot scompare dalla lista "Spot attivi" senza attendere eventi dal server.

---

### User Story 3 - Sezione globale "Ultimi spot" (Priority: P2)

Un radioamatore accede a una sezione globale dell'app chiamata "Ultimi spot" (accessibile come tab nella dashboard, nella sezione con il DraggableScrollableSheet accanto a "Ripetitori" e "POTA", con un link "Vedi tutti" che apre una pagina full-screen dedicata con la stessa lista). Vede tutti gli spot delle ultime 24 ore — sia self-spot sia other-spot — ordinati dal più recente, indipendentemente dal ponte. I self-spot mostrano: callsign, ponte, access, countdown o badge "concluso". Gli other-spot mostrano: callsign dell'OM spottato, chi ha spottato, ponte, access, e un badge "segnalazione" (senza countdown, perché non hanno durata). Toccando uno spot si naviga alla scheda del ponte. La lista si aggiorna in tempo reale.

**Why this priority**: Estende il valore dalla singola scheda ponte a una visione globale dell'attività cluster. Permette di scoprire attività su ponti che l'utente non sta esplicitamente monitorando.

**Independent Test**: Creare spot su ponti diversi e verificare che compaiano tutti nella sezione "Ultimi spot" ordinati per recenza. Creare un nuovo spot e verificarne la comparsa in cima senza refresh. Chiudere uno spot e verificare l'aggiornamento del badge.

**Acceptance Scenarios**:

1. **Given** esistono spot creati nelle ultime 24 ore, **When** un utente apre la sezione "Ultimi spot", **Then** vede tutti gli spot delle ultime 24 ore ordinati dal più recente.
2. **Given** un utente sta visualizzando "Ultimi spot", **When** un altro utente crea uno spot, **Then** il nuovo spot compare in cima alla lista in tempo reale.
3. **Given** la lista mostra sia spot attivi sia conclusi, **When** l'utente la visualizza, **Then** ogni spot ha un badge che distingue chiaramente "spottato" (con countdown) da "concluso".
4. **Given** un utente tocca uno spot nella lista, **When** viene eseguito il tap, **Then** l'utente viene portato alla scheda dettaglio del ponte associato.
5. **Given** uno spot è stato creato più di 24 ore fa, **When** l'utente visualizza "Ultimi spot", **Then** quello spot non è presente nella lista.
6. **Given** un access dichiarato è stato rimosso dal ponte dopo la creazione dello spot, **When** lo spot viene visualizzato, **Then** l'access mostra un'indicazione come "modalità non più disponibile" al posto del nome dell'access.

---

### User Story 4 - Indicatore personale dello spot attivo (Priority: P2)

Un radioamatore che si è spottato vede un indicatore persistente nell'app (un banner o un widget flottante) che mostra lo stato del proprio spot: ponte su cui è spottato, tempo residuo con countdown, e un pulsante per chiudere lo spot. L'indicatore è visibile in tutte le schermate principali dell'app (non solo nella scheda del ponte). Se lo spot viene sostituito automaticamente (perché l'utente ne ha creato uno nuovo altrove), l'indicatore si aggiorna mostrando il nuovo spot. Se lo spot scade o viene chiuso, l'indicatore scompare.

**Why this priority**: Dà all'utente un feedback costante sul proprio stato "spottato" senza dover tornare alla scheda del ponte. Migliora la consapevolezza e permette la chiusura rapida.

**Independent Test**: Creare uno spot, navigare alla dashboard, verificare che l'indicatore sia visibile. Chiudere lo spot dall'indicatore e verificare che scompaia. Creare un nuovo spot su un altro ponte e verificare l'aggiornamento.

**Acceptance Scenarios**:

1. **Given** un utente ha creato uno spot attivo, **When** naviga in qualsiasi schermata principale dell'app, **Then** vede un indicatore con il callsign del ponte, il countdown e un pulsante "Chiudi".
2. **Given** un utente sta visualizzando l'indicatore del proprio spot, **When** il countdown raggiunge zero, **Then** l'indicatore scompare automaticamente.
3. **Given** un utente tocca "Chiudi" sull'indicatore, **When** la chiusura va a buon fine, **Then** l'indicatore scompare e lo spot risulta chiuso.
4. **Given** un utente ha uno spot attivo sul ponte A e crea uno spot sul ponte B, **When** la sostituzione avviene, **Then** l'indicatore si aggiorna mostrando il ponte B e il nuovo countdown, e un toast notifica "Il tuo spot precedente non è più attivo".

---

### User Story 5 - Notifiche push cluster con deep link (Priority: P2)

Un radioamatore che ha un ponte tra i preferiti riceve una notifica push quando un altro utente crea uno spot (self-spot o other-spot) su quel ponte. Per i self-spot la notifica mostra il callsign dell'operatore, il nome del ponte e la durata dichiarata. Per gli other-spot mostra il callsign dell'OM spottato, chi ha spottato e il ponte. Toccando la notifica, l'app si apre direttamente sulla scheda del ponte. L'utente può silenziare le notifiche cluster globalmente dalle impostazioni profilo, oppure per singolo preferito dalla gestione dei preferiti.

**Why this priority**: Trasforma il cluster da esperienza "pull" (devo aprire l'app per vedere se c'è qualcuno) a "push" (vengo avvisato quando qualcuno è sul mio ponte). Dipende dalla US1.

**Independent Test**: L'utente A mette il ponte X tra i preferiti. L'utente B crea uno spot su X. A riceve la notifica. A tocca la notifica e viene portato alla scheda del ponte X. A disattiva il flag globale: non riceve più notifiche. A lo riattiva ma disattiva il flag per il singolo preferito X: non riceve notifiche per X.

**Acceptance Scenarios**:

1. **Given** un utente A ha il ponte X tra i preferiti con notifiche cluster attive, **When** l'utente B crea un self-spot su X, **Then** A riceve una notifica push con callsign di B, nome del ponte X e durata dello spot. **When** l'utente B crea un other-spot su X segnalando IZ0XYZ, **Then** A riceve una notifica push con "IZ0XYZ segnalato da [callsign B] su [ponte X]". Il payload `data` contiene sempre `type`, `spot_id`, `repeater_id`, `spotter_user_id` — il frontend distingue self/other dalla presenza del campo `spotted_callsign` nei `headings`/`contents` del payload.
2. **Given** un utente riceve una notifica cluster, **When** tocca la notifica, **Then** l'app si apre sulla scheda dettaglio del ponte indicato nella notifica.
3. **Given** un utente ha il flag globale "Notifiche cluster" disattivato, **When** viene creato uno spot su un ponte tra i suoi preferiti, **Then** non riceve alcuna notifica.
4. **Given** un utente ha il flag globale attivo ma il flag specifico per un preferito disattivato, **When** viene creato uno spot su quel ponte, **Then** non riceve notifica per quel ponte.
5. **Given** un utente con l'app aperta in primo piano riceve una notifica cluster, **When** la notifica arriva, **Then** viene mostrata come notifica in-app (snackbar o banner) senza interrompere l'esperienza corrente.

---

### User Story 6 - Gestione preferenze notifiche cluster (Priority: P3)

Un radioamatore può gestire le sue preferenze di notifica cluster a due livelli: un toggle globale nelle impostazioni profilo ("Notifiche cluster") e un toggle per singolo preferito nella gestione dei preferiti. Entrambi i toggle sono attivi per default. Il toggle per-preferito è visibile solo se il toggle globale è attivo. Se il toggle globale viene disattivato, un messaggio spiega che tutte le notifiche cluster sono silenziate.

**Why this priority**: Funzionalità di controllo utente, non critica per l'MVP ma importante per la soddisfazione a lungo termine. Dipende dall'esistenza delle notifiche push (US5).

**Independent Test**: Aprire le impostazioni profilo, verificare il toggle globale. Disattivarlo, verificare che il toggle per-preferito non sia più interattivo. Riattivarlo, andare nei preferiti, disattivare il toggle per un singolo ponte. Verificare che la preferenza venga salvata.

**Acceptance Scenarios**:

1. **Given** un utente apre le impostazioni profilo, **When** visualizza la sezione notifiche, **Then** vede un toggle "Notifiche cluster" attivo per default.
2. **Given** un utente disattiva il toggle globale, **When** salva le impostazioni, **Then** i toggle per-preferito nella lista favoriti appaiono disabilitati con un messaggio esplicativo.
3. **Given** un utente con il toggle globale attivo apre la lista dei preferiti, **When** visualizza un preferito, **Then** vede un toggle "Notifiche spot" per quel ponte, attivo per default.
4. **Given** un utente cambia il toggle per un preferito, **When** la modifica viene salvata, **Then** la preferenza è persistita e rispettata per le notifiche future.

---

### Edge Cases

- **Connessione persa durante la creazione**: se la richiesta fallisce per timeout o errore di rete, l'utente vede un messaggio di errore generico con possibilità di riprovare; nessuno spot viene creato.
- **Riconnessione Realtime**: dopo una disconnessione e riconnessione del canale Realtime, l'app esegue un refresh silenzioso della lista spot per riallinearsi (gli eventi persi durante la disconnessione non vengono replayati dal server).
- **Spot su ponte disattivato**: se un ponte viene disattivato mentre uno spot è attivo, lo spot continua il suo ciclo di vita. La UI mostra un indicatore visivo "ponte non più disponibile" e disabilita l'azione "apri scheda ponte" nella sezione "Ultimi spot".
- **Access rimosso dopo creazione spot**: se l'access dichiarato viene eliminato dal catalogo, lo spot diventa "generico" e la UI mostra "(modalità non più disponibile)" al posto del nome dell'access.
- **Doppio tap su "Spottati"**: il pulsante viene disabilitato immediatamente dopo il primo tap per evitare creazioni duplicate. Se una race condition produce un errore `unique_violation`, il client ritenta una volta.
- **Callsign rimosso dopo creazione spot**: lo spot già attivo continua normalmente (usa lo snapshot del callsign). Un eventuale nuovo spot sarebbe rifiutato dal backend.
- **Countdown e orologio locale**: il countdown è calcolato rispetto a `expires_at` (timestamp server). Se l'orologio del dispositivo è disallineato, il countdown potrebbe mostrare un tempo residuo leggermente impreciso, ma lo stato "scaduto" è derivato correttamente dal confronto con il server al prossimo refresh.
- **Notifica push con app chiusa**: al tap della notifica, l'app si avvia, completa l'autenticazione e naviga alla scheda del ponte indicato nel payload.
- **Utente anonimo che tocca "Spottati"**: viene mostrato il prompt di registrazione esistente (auth gate `requireAuthentication`). Dopo il completamento, l'utente può procedere alla creazione dello spot.
- **JWT scaduto durante sessione Realtime**: se il token JWT scade mentre un canale Realtime è aperto, il canale emette un errore. L'app DEVE effettuare il refresh del token (già gestito da `supabase_flutter`) e ricreare il canale. Nel frattempo i dati dell'ultimo fetch restano visibili.
- **Other-spot con il proprio callsign**: un utente PUÒ creare un other-spot riferito al proprio callsign (self-reporting). Il backend non lo impedisce e il frontend non aggiunge validazioni aggiuntive — è un caso d'uso legittimo (es. "ero su questo ponte 10 minuti fa").
- **Other-spot multipli rapidi sullo stesso ponte**: un utente PUÒ creare più other-spot in rapida successione sullo stesso ponte (es. spottare più OM sentiti). Il backend non applica rate limiting in v1. Il frontend disabilita il pulsante durante l'invio (FR-005) ma non impedisce invii successivi.
- **Indicatori mappa/card prima del caricamento dati**: se il provider `repeatersWithActiveSpots` non ha ancora caricato o ha fallito, nessun indicatore viene mostrato (né rosso né altro). Graceful degradation — la mappa e le card funzionano normalmente senza gli indicatori spot.

## Requirements *(mandatory)*

### Functional Requirements

#### Creazione e gestione spot (self-spot e other-spot)

- **FR-001**: L'app DEVE mostrare nella scheda dettaglio di ogni ponte, nella sezione cluster (posizionata subito dopo la sezione "Dati tecnici" e prima della sezione "Posizione"), due pulsanti affiancati: **"Spottati"** (self-spot, primario) e **"Spotta un OM"** (other-spot, secondario).
- **FR-002**: Per il **self-spot**, l'app DEVE mostrare un bottom sheet con selezione della durata e selezione opzionale dell'access del ponte.
- **FR-002a**: Per l'**other-spot**, l'app DEVE mostrare un bottom sheet con campo di inserimento del callsign dell'OM sentito (obbligatorio) e selezione opzionale dell'access. NON DEVE mostrare la selezione durata (gli other-spot non hanno durata).
- **FR-003**: Per i self-spot, l'app DEVE proporre le seguenti durate predefinite come chip selezionabili: **5, 15, 30, 60 minuti** (lista definitiva, non estensibile dall'utente). Il range consentito è 5–60 minuti.
- **FR-004**: L'app DEVE popolare la lista degli access disponibili con quelli configurati per il ponte selezionato, mostrando il tipo di modalità con il colore corrispondente (sia per self-spot sia per other-spot).
- **FR-005**: L'app DEVE disabilitare il pulsante di conferma durante l'invio della richiesta per prevenire doppi invii. Alla creazione riuscita, il bottom sheet si chiude automaticamente e un toast di conferma appare brevemente ("Spot creato!" per self-spot, "OM spottato!" per other-spot).
- **FR-006**: L'app DEVE gestire tutti i codici di errore del backend (`AUTH_REQUIRED`, `CALLSIGN_REQUIRED`, `INVALID_DURATION`, `REPEATER_NOT_FOUND`, `INVALID_ACCESS`) mostrando messaggi localizzati in italiano.
- **FR-007**: Per gli utenti anonimi o senza callsign, l'app DEVE mostrare il prompt di registrazione o un messaggio che invita a completare il profilo prima di consentire la creazione di spot (sia self sia other).
- **FR-008**: L'app DEVE permettere all'utente di chiudere manualmente il proprio self-spot attivo tramite un pulsante dedicato, sia dall'indicatore persistente sia dalla scheda ponte. Gli other-spot NON possono essere chiusi (non hanno stato attivo).
- **FR-009**: L'app DEVE gestire l'errore `ALREADY_CLOSED` come successo (idempotenza) e non mostrare errori all'utente.

#### Visualizzazione spot su scheda ponte

- **FR-010**: La scheda dettaglio ponte DEVE includere una sezione "Spot attivi" che mostra solo i **self-spot** attivi su quel ponte. Gli other-spot NON compaiono in questa sezione.
- **FR-011**: Per ogni self-spot attivo DEVONO essere visibili: callsign dell'operatore, access dichiarato (se presente, con colore della modalità), countdown del tempo residuo.
- **FR-012**: La sezione "Spot attivi" DEVE aggiornarsi in tempo reale tramite subscription Realtime senza necessità di refresh manuale.
- **FR-013**: Lo stato "scaduto" di uno spot DEVE essere calcolato lato client confrontando `expires_at` con l'ora corrente, senza attendere eventi dal server.
- **FR-014**: Il countdown del tempo residuo DEVE aggiornarsi ogni secondo per gli spot attivi. Il formato di visualizzazione è `mm:ss` (es. "29:45"); per durate ≥60 minuti il formato è `h:mm:ss` (es. "1:00:00"). Sotto i 60 secondi il countdown DEVE mostrare colore rosso per enfatizzare l'imminente scadenza.
- **FR-015**: Se un ponte ha 0 spot attivi, la sezione DEVE mostrare uno stato vuoto esplicito con invito a spottarsi.

#### Sezione globale "Ultimi spot"

- **FR-016**: L'app DEVE esporre una sezione "Ultimi spot" come tab nella dashboard (DraggableScrollableSheet) e come pagina full-screen raggiungibile da un link "Vedi tutti". Entrambe mostrano tutti gli spot delle ultime 24 ore (sia self-spot sia other-spot) ordinati dal più recente.
- **FR-017**: Per i **self-spot**, ogni riga DEVE mostrare: callsign, ponte, access (se presente), badge di stato (attivo con countdown vs concluso). Per gli **other-spot**, ogni riga DEVE mostrare: callsign dell'OM spottato, callsign di chi ha spottato, ponte, access (se presente), e un badge "segnalazione" che lo distingua visivamente dal self-spot.
- **FR-018**: La sezione "Ultimi spot" DEVE aggiornarsi in tempo reale tramite subscription Realtime globale.
- **FR-019**: Toccando uno spot nella sezione "Ultimi spot" l'utente DEVE essere portato alla scheda dettaglio del ponte.

#### Indicatore personale

- **FR-020**: Se l'utente ha un **self-spot** attivo, l'app DEVE mostrare un banner indicatore persistente sopra la bottom navigation bar, visibile in tutte le 4 tab principali (Dashboard, Lista, Mappa, Profilo) e nella pagina full-screen "Ultimi spot". Il banner mostra: nome/callsign del ponte, countdown, pulsante "Chiudi". Gli other-spot NON generano indicatore personale.
- **FR-021**: L'indicatore DEVE aggiornarsi in tempo reale tramite subscription Realtime sul canale personale dell'utente.
- **FR-022**: L'indicatore DEVE scomparire automaticamente quando lo spot scade (countdown a zero) o viene chiuso.
- **FR-023**: Se lo spot viene sostituito automaticamente, l'app DEVE mostrare un toast informativo e aggiornare l'indicatore con il nuovo spot.

#### Notifiche push

- **FR-024**: L'app DEVE gestire il payload delle notifiche push con `data.type = "new_cluster_spot"` navigando alla scheda del ponte indicato in `data.repeater_id`.
- **FR-025**: Alla ricezione di una notifica cluster con l'app in primo piano, l'app DEVE mostrare una notifica in-app (snackbar) senza interrompere l'esperienza corrente. Se l'utente sta già visualizzando la scheda dettaglio del ponte a cui si riferisce la notifica, la snackbar NON viene mostrata (la sezione "Spot attivi" si aggiorna già via Realtime).
- **FR-026**: Al tap sulla notifica in-app, l'app DEVE navigare alla scheda del ponte.

#### Preferenze notifica

- **FR-027**: Le impostazioni profilo DEVONO includere un toggle "Notifiche cluster" che controlla il flag globale `profiles.cluster_notifications_enabled`.
- **FR-028**: La gestione dei preferiti DEVE mostrare un toggle "Notifiche spot" per ciascun preferito, che controlla `user_favorite_repeaters.cluster_notifications_enabled`.
- **FR-029**: Se il toggle globale è disattivato, i toggle per-preferito DEVONO apparire disabilitati (grayed out) con il testo esplicativo "Notifiche cluster disattivate nelle impostazioni profilo".

#### Indicatore mappa

- **FR-030**: Nella vista mappa, i marker dei ripetitori con almeno un self-spot attivo DEVONO mostrare un bordo rosso (colore: `#EF4444`) con animazione pulsante (ciclo fade in/out di 1.5 secondi, opacità 40%–100%) per distinguerli visivamente dai ripetitori senza spot attivi.
- **FR-030a**: L'indicatore rosso pulsante DEVE apparire e scomparire in tempo reale al variare degli spot attivi (creazione, chiusura, scadenza). Se i dati degli spot attivi non sono ancora caricati o il caricamento fallisce, nessun indicatore viene mostrato (graceful degradation).
- **FR-030b**: Gli other-spot NON influenzano l'indicatore sulla mappa (solo i self-spot attivi lo attivano).

#### Indicatore spot nelle card ripetitore

- **FR-030c**: Nelle liste ripetitori (lista globale e preferiti), le card dei ripetitori con almeno un self-spot attivo DEVONO mostrare un punto rosso (8dp, colore `#EF4444`) posizionato nell'angolo in alto a destra della card come indicatore di attività. Se i dati non sono ancora caricati, nessun indicatore viene mostrato.
- **FR-030d**: Il punto rosso DEVE apparire e scomparire al variare degli spot attivi. Gli other-spot NON influenzano l'indicatore.

#### Stati di caricamento e errore

- **FR-030e**: Tutte le sezioni che caricano spot (Spot attivi, Ultimi spot, indicatore personale) DEVONO mostrare uno stato di caricamento (skeleton/shimmer) durante il fetch iniziale.
- **FR-030f**: In caso di errore nel caricamento degli spot, le sezioni DEVONO mostrare un indicatore di errore discreto con possibilità di riprovare, senza sostituire l'intera pagina (coerente con il pattern error-handling del progetto).
- **FR-030g**: La tab "Ultimi spot" nella dashboard e la pagina full-screen "Vedi tutti" condividono lo stesso stato (stesso provider). Navigare dall'una all'altra non ricarica i dati.

#### Realtime e resilienza

- **FR-031**: L'app DEVE aprire un canale Realtime per la scheda ponte (`spots:repeater:{id}`) e chiuderlo alla navigazione fuori dalla pagina.
- **FR-032**: L'app DEVE aprire un canale Realtime globale (`spots:global`) per la sezione "Ultimi spot" e chiuderlo alla navigazione fuori dalla sezione.
- **FR-033**: L'app DEVE aprire un canale Realtime personale (`spots:user:{userId}`) all'avvio dell'app (post-login) e chiuderlo solo al logout.
- **FR-034**: Alla riconnessione dopo una disconnessione Realtime, l'app DEVE eseguire un refresh silenzioso delle liste spot per riallineare lo stato.
- **FR-035**: Se la subscription Realtime fallisce (JWT scaduto, errore di rete), l'app DEVE continuare a mostrare i dati dell'ultimo caricamento REST senza interruzione. Al ripristino della connessione, DEVE riallinearsi come da FR-034.

### Key Entities *(include if feature involves data)*

- **Spot (RepeaterSpot)**: segnalazione radio su un ponte, in due varianti. **Self-spot**: l'utente dichiara "sono in ascolto" — ha durata (5–60 min), stato attivo/scaduto/chiuso derivato lato client, vincolo 1 per utente. **Other-spot**: l'utente segnala "ho sentito IZ0XYZ" — senza durata, senza stato attivo, record storico puro, nessun vincolo di unicità. Attributi: id, callsign del creatore (snapshot), callsign dell'OM spottato (null per self-spot), ponte, access (opzionale), orario di inizio, durata (null per other-spot), scadenza (null per other-spot), chiusura (se applicabile).
- **Profilo utente (estensione)**: aggiunta del flag globale "notifiche cluster" (default attivo).
- **Preferito (estensione)**: aggiunta del flag per-preferito "notifiche cluster" (default attivo).
- **Access del ponte**: entità pre-esistente, usata nella creazione spot e nella visualizzazione con colori per modalità (FM=Blue, DMR=Purple, C4FM=Teal, D-STAR=Orange).

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Un radioamatore può completare lo spot (spottarsi) in non più di 10 secondi dall'apertura della scheda ponte (massimo 3 interazioni: pulsante, durata, conferma).
- **SC-002**: Un nuovo spot creato da un utente compare nella scheda ponte e nella sezione "Ultimi spot" di tutti gli altri utenti connessi in meno di 5 secondi, in almeno il 95% dei casi.
- **SC-003**: Il countdown del tempo residuo di uno spot attivo si aggiorna visivamente ogni secondo con jitter massimo di 100ms (un tick mancato o in ritardo >100ms è considerato difetto).
- **SC-004**: Allo scadere del tempo, lo spot scompare dalla sezione "Spot attivi" entro 1 secondo senza azione dell'utente e senza attendere eventi dal server.
- **SC-005**: Il 100% degli utenti senza callsign che tentano di creare uno spot ricevono un messaggio chiaro che indica come risolvere.
- **SC-006**: Il 100% dei tentativi di creazione di un secondo self-spot risulta nella sostituzione atomica: il vecchio self-spot non è più visibile e il nuovo è l'unico attivo. Gli other-spot non sono soggetti a sostituzione.
- **SC-007**: Il tap su una notifica push cluster apre la scheda del ponte corretto nel 100% dei casi, sia con app in background sia con app chiusa.
- **SC-008**: La modifica dei toggle di notifica (globale e per-preferito) ha effetto immediato e persistente: le notifiche successive rispettano la nuova preferenza.
- **SC-009**: Dopo una disconnessione e riconnessione Realtime, la lista spot si riallinea silenziosamente entro 5 secondi senza richiedere azione dell'utente.
- **SC-010**: La sezione "Ultimi spot" mostra tutti gli spot delle ultime 24 ore e nessuno spot più vecchio di 24 ore.
- **SC-011**: Un radioamatore può completare un other-spot ("Spotta un OM") in non più di 15 secondi dall'apertura della scheda ponte (4 interazioni: pulsante, callsign, opzionale access, conferma).
- **SC-012**: L'indicatore rosso pulsante sulla mappa e il punto rosso sulle card appaiono/scompaiono entro 5 secondi dalla creazione/chiusura di un self-spot, in almeno il 95% dei casi.

## Out of Scope (v1)

- Estensione della durata di uno spot già attivo.
- Spot multipli contemporanei (multi-ponte) per lo stesso utente.
- Filtri nella sezione "Ultimi spot" (per modalità, per preferiti, per distanza).
- Paginazione nella sezione "Ultimi spot".
- Pull-to-refresh manuale (sostituito da Realtime).
- Vista personale "I miei spot" / storico personale.
- Chat o messaggistica tra utenti.
- Sistema di report o blocco utenti lato client.
- Moderazione admin degli spot.
- Rate limiting o cooldown su creazione spot.
- Quiet hours configurabili.
- Filtro geografico di prossimità nelle notifiche.

## Assumptions

- Il backend (Edge Functions `create-spot` e `close-spot`, tabella `repeater_spots`, trigger di notifica, canali Realtime) è già implementato e funzionante come descritto nella spec backend `001-cluster-spots` del repo `ham_qrg_supabase`.
- L'infrastruttura OneSignal per le notifiche push è già configurata e funzionante nell'app.
- Il sistema di autenticazione, il modello profilo utente con callsign, e il sistema di preferiti esistono già e sono riusati.
- Le entità "ponti radio" e "access del ponte" esistono già con i relativi colori per modalità definiti in `app_colors.dart` e `access_mode_helper.dart`.
- Il canale Realtime Supabase è disponibile e la tabella `repeater_spots` è già aggiunta alla publication `supabase_realtime`.
- Le colonne `cluster_notifications_enabled` su `profiles` e `user_favorite_repeaters` sono già presenti grazie alle migration backend.
- Il pattern auth gate (`requireAuthentication`) per utenti anonimi è già implementato e riutilizzabile.
- La navigazione verso la scheda dettaglio ponte tramite `repeaterId` è già supportata dal router esistente (`/repeater/:repeaterId`).
- Il volume di spot atteso (alcune decine al giorno) è gestibile senza paginazione o ottimizzazioni particolari nella sezione "Ultimi spot".
