# Feature Specification: Ricerca località / punto libero sulla mappa con ricezione stimata (Pro)

**Feature Branch**: `005-location-coverage-search`
**Created**: 2026-08-26
**Status**: Draft
**Input**: User description: "Integrare una barra di ricerca per località o punto sulla mappa libero che permette di vedere la ricezione in base a un punto arbitrario sulla mappa. Per gli utenti PRO è possibile salvarsi quella 'ricerca' per una consultazione offline (remote_caching). Inoltre ricordiamoci l'UI/UX responsive anche su tablet e mobile. Per le ricerche salvate possiamo farlo in list che se un utente ci va e non è premium gli diciamo di attivarlo, ovviamente quella 'paywall' deve essere al massimo della CRO."

## Premesse di prodotto

Oggi l'app risponde alla domanda *"cosa raggiungo da dove sono adesso?"* — la reachability parte dalla posizione GPS ed è una funzione Pro. La domanda che resta senza risposta è quella che l'operatore si fa **prima** di muoversi: *"cosa raggiungo da lì?"* — dal passo di montagna dove andrà ad attivare, dalla casa al mare, dal parco POTA scelto per il weekend, dall'indirizzo della casa che sta valutando.

Questa feature introduce il **punto di ricerca arbitrario**: una barra di ricerca sulla mappa (località, indirizzo, coordinate) e la possibilità di appoggiare un pin ovunque, ottenendo la lista dei ripetitori raggiungibili da quel punto. Sopra ci si costruisce la **postazione salvata**: il risultato conservato sul dispositivo e consultabile **senza rete**, cioè esattamente nella condizione di campo in cui serve davvero (valico, bosco, cima).

Entrambe le capacità sono **Pro**. Non è un cambio di modello: è l'estensione naturale dell'asse già in vigore — *la previsione di copertura si paga* — dalla sola posizione GPS a qualunque punto del pianeta, più la persistenza offline. L'utente non Pro non vede mai un dBm né un verdetto di raggiungibilità, in nessuna superficie dell'app, coerentemente con il badge sfocato già presente sul dettaglio ripetitore.

Quello che l'utente non Pro riceve è invece il **momento di conversione meglio costruito dell'app**: ha appena scelto *il suo* posto, e proprio lì scopre — con il nome di quel posto scritto in testa al riquadro — che la risposta esiste ed è a un tocco di distanza.

## Clarifications

### Session 2026-08-26 — Decisioni prese durante `/speckit.specify`

- **Q: la ricezione da punto arbitrario è gratuita per tutti o Pro?** → **A: Pro.** Aprirla a tutti avrebbe creato un'**inversione di valore**: il gratuito avrebbe ottenuto una capacità strettamente più grande (qualunque punto) dell'esclusiva del pagante (un punto, la propria posizione), e lo stesso dBm sarebbe risultato sfocato sul dettaglio ripetitore e leggibile nella lista del pin. L'asse resta quello attuale: la previsione di copertura si paga, ovunque si presenti.
- **Q: nessun calcolo viene eseguito per gli utenti non Pro?** → **A: nessuno.** Il teaser mostrato al non Pro è finto (valori mock sfocati), non il risultato reale offuscato. Niente dato che trapela e nessun costo di servizio generato dal traffico gratuito.
- **Q: la barra di ricerca è visibile ai non Pro?** → **A: sì, ed è funzionante come navigazione.** Cercare una località e portare la mappa lì è pura navigazione — non è la capacità venduta, non rivela nulla, e un utente non Pro può già raggiungere qualunque punto trascinando la mappa a mano. Ciò che è Pro è il **responso di ricezione**. Tenere la barra viva massimizza la conversione: il paywall arriva quando l'utente ha già scelto il proprio posto ed è emotivamente investito, non prima.
- **Q: quota d'uso gratuita?** → **A: nessuna quota.** Non serve: non essendoci uso gratuito della capacità, non c'è nulla da contingentare. Niente contatore da persistere, niente reset giornaliero, nessun vettore di abuso.
- **Q: le postazioni salvate sopravvivono alla scadenza dell'abbonamento?** → **A: restano leggibili**, mentre creazione e aggiornamento tornano soggetti al paywall.

### Session 2026-08-26 — `/speckit.clarify`

- Q: Durata garantita delle postazioni salvate (chi può farle sparire, e quando)? → A: **Illimitata**. Nessuna eviction automatica di alcun tipo — né scadenza temporale, né TTL del meccanismo di memorizzazione, né pulizia per pressione di spazio. L'unica rimozione ammessa è la cancellazione esplicita dell'utente. In compenso l'utente dispone di un'azione di **aggiornamento massivo** che rigenera in un colpo solo tutte le postazioni salvate.
- Q: Come si misura la CRO del paywall, dato che la spec la pone come obiettivo? → A: **Funnel minimo strumentato** (punto selezionato → teaser mostrato → CTA toccata → paywall presentato → acquisto / abbandono), esteso anche alla superficie di reachability già esistente per rendere i due punti d'ingresso confrontabili. Verifica fattuale: oggi l'app non possiede alcuna strumentazione — il pulsante "cosa raggiungo da qui" apre upsell e paywall senza registrare eventi. Gli eventi vengono scritti nel backend già in uso, senza SDK di terze parti, ed escludono le coordinate scelte dall'utente.
- Q: Quale raggio di ricerca dei ripetitori candidati si usa dal punto arbitrario? → A: **Tre livelli scelti dall'utente** — rapida (80 km), media (100 km), estesa (150 km) — con "rapida" come impostazione iniziale, in parità con la reachability esistente. I livelli comunicano il compromesso portata/attesa, non le sole cifre. Il livello usato viene conservato nella postazione salvata.
- Q: I filtri di modo attivi sulla mappa si applicano al risultato di ricezione e alla postazione salvata? → A: **Solo alla presentazione.** Calcolo e salvataggio comprendono sempre tutti i modi; il filtro è una lente, applicabile anche offline su una postazione già salvata. Una postazione conservata è l'unica copia disponibile in campo e non deve mai nascere monca.
- Q: Con quale criterio due punti sono considerati "lo stesso punto" ai fini del duplicato? → A: **Prossimità entro ~200 m.** Il sistema propone l'aggiornamento della postazione esistente, ma l'utente può sempre rifiutare e crearne una distinta: in terreno accidentato 200 m possono cambiare il responso, quindi la decisione resta sua. Il confronto esatto sarebbe inefficace per i punti scelti con pressione sulla mappa, che non producono mai due volte le stesse coordinate.

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Ricezione da un punto arbitrario (Pro) (Priority: P1)

Un operatore Pro apre la mappa, digita "Passo Pordoi" (oppure incolla `46.4879, 11.8123`, oppure tiene premuto sulla mappa) e ottiene un pin nel punto scelto e la lista dei ripetitori raggiungibili da quel punto, ordinati dal segnale più forte, ciascuno con distanza e intensità stimata. Può cambiare punto e ripetere la valutazione quante volte vuole, senza limiti.

**Why this priority**: È il cuore della feature e l'unico pezzo indispensabile. Da solo costituisce un MVP rilasciabile: sposta il prodotto da "cosa sento adesso" a "cosa sentirò da lì", che è il vero momento decisionale dell'operatore. Tutto il resto (teaser, salvataggio, offline, lista) è valore costruito sopra questa risposta.

**Independent Test**: Si testa integralmente con un account Pro cercando una località nota, verificando che il pin compaia nel punto corretto e che la lista dei raggiungibili sia coerente con quella ottenuta posizionandosi fisicamente in quel punto. Consegna valore anche senza le altre storie.

**Acceptance Scenarios**:

1. **Given** un utente Pro sulla mappa con connessione attiva, **When** digita almeno 3 caratteri del nome di una località, **Then** vede un elenco di risultati (nome + contesto geografico, es. comune/regione/stato) entro 1 secondo dalla fine della digitazione.
2. **Given** l'elenco dei risultati mostrato, **When** l'utente ne seleziona uno, **Then** la mappa si sposta su quel punto, compare un pin distinguibile dai marker dei ripetitori e dalla posizione GPS, e parte il calcolo della ricezione.
3. **Given** un punto selezionato, **When** il calcolo termina, **Then** l'utente vede il numero di ripetitori raggiungibili e la lista ordinata per segnale decrescente, con distanza e intensità stimata per ciascuno.
4. **Given** la mappa aperta, **When** l'utente esegue una pressione prolungata su un punto qualsiasi, **Then** il pin viene posizionato lì e parte lo stesso calcolo, senza passare dalla barra di ricerca.
5. **Given** una stringa di coordinate valide (formato decimale, separatore virgola o spazio), **When** l'utente conferma, **Then** viene interpretata come coordinate e non come nome di località.
6. **Given** un risultato mostrato, **When** l'utente tocca un ripetitore in lista, **Then** accede al dettaglio con gli stessi contenuti disponibili nel resto dell'app.
7. **Given** un punto già valutato, **When** l'utente sceglie un nuovo punto, **Then** il risultato precedente viene sostituito e il pin si sposta, senza lasciare pin residui.
8. **Given** un utente Pro, **When** effettua molte valutazioni consecutive, **Then** nessun limite d'uso gli viene applicato.
9. **Given** un risultato ottenuto all'ampiezza rapida, **When** l'utente passa all'ampiezza estesa, **Then** la valutazione viene rifatta sullo stesso punto includendo i ripetitori più lontani, e il livello scelto resta attivo per le valutazioni successive.

---

### User Story 2 - Il non Pro incontra il valore e converte (Priority: P2)

Un utente non Pro cerca "Passo Pordoi" sulla mappa: la mappa **si sposta davvero lì** e il pin viene appoggiato. Al posto della lista compare un riquadro che porta in testa il nome del posto che ha appena scelto — *"Cosa raggiungi da Passo Pordoi?"* — con sotto alcune righe di risultato **finto e sfocato** che ne mostrano la forma (scheda ripetitore, barre di segnale, distanza), i benefici in tre righe e una sola call to action. Nessun calcolo viene eseguito e nessun dato reale gli viene mostrato.

**Why this priority**: È l'intera superficie di monetizzazione della feature e l'unica parte che ogni utente non Pro tocca. Il momento in cui si presenta — subito dopo che l'utente ha scelto *il suo* posto — è il punto di massima intenzione dell'intero flusso: qualunque ottimizzazione di CRO vale qui più che altrove.

**Independent Test**: Si esegue il flusso con un account non Pro e si verifica che la mappa navighi, che il teaser sia personalizzato con il nome della località, che nessun valore reale compaia e che la CTA porti al paywall in un tocco.

**Acceptance Scenarios**:

1. **Given** un utente non Pro sulla mappa, **When** cerca una località e la seleziona, **Then** la mappa si sposta e il pin viene posizionato, esattamente come per un utente Pro.
2. **Given** il pin posizionato da un utente non Pro, **When** la vista del risultato si apre, **Then** compare il teaser sfocato con il **nome della località scelta** nel titolo, e **nessuna** richiesta di calcolo viene inviata al servizio.
3. **Given** il teaser mostrato, **Then** i valori visibili (intensità, distanza, conteggio) sono segnaposto non linguistici e non corrispondono ad alcun dato reale.
4. **Given** il teaser mostrato, **Then** i benefici sono elencati in forma breve e scansionabile, con enfasi sulla consultazione offline in assenza di copertura, e una sola call to action primaria è visibile senza scorrere.
5. **Given** il teaser mostrato, **When** l'utente tocca la call to action, **Then** il paywall viene presentato entro 1 secondo, senza schermate intermedie di conferma.
6. **Given** il paywall presentato, **When** l'utente completa l'acquisto, **Then** rientra **nello stesso punto in cui si trovava**, con il pin ancora posizionato, e il calcolo reale parte automaticamente senza che debba ripetere la ricerca.
7. **Given** il paywall presentato, **When** l'utente lo chiude senza acquistare, **Then** torna alla mappa con il pin ancora presente e nessuna funzione gratuita risulta compromessa.
8. **Given** un utente anonimo, **When** avvia l'acquisto, **Then** gli viene chiesto di collegare un account **prima** dell'addebito, senza farlo uscire dal contesto corrente.
9. **Given** un utente non Pro, **When** naviga fra le superfici che espongono reachability (badge sul dettaglio ripetitore, pulsante "cosa raggiungo da qui", risultato del punto arbitrario), **Then** in nessuna di esse vede un valore reale di intensità o un verdetto di raggiungibilità.

---

### User Story 3 - Salvataggio di una postazione e consultazione offline (Pro) (Priority: P2)

Un utente Pro, dopo aver valutato un punto, lo salva assegnandogli un nome (proposto automaticamente dal nome della località). Il risultato completo viene conservato sul dispositivo: quando lo riapre in campo, **senza connessione**, ritrova la lista dei ripetitori raggiungibili con tutti i dati necessari a sintonizzarsi (frequenza, modo, toni CTCSS, parametri DMR), insieme alla data dell'ultimo aggiornamento.

**Why this priority**: È il valore che rende l'abbonamento difendibile nel tempo e l'unico che risolve lo scenario di campo reale (nessuna copertura dati). Dipende dalla storia 1 ma è indipendente dalla 4: si può rilasciare con il solo pulsante "salva" e il richiamo dell'ultima postazione.

**Independent Test**: Si salva una postazione con connessione attiva, si mette il dispositivo in modalità aereo, si riapre la postazione e si verifica che lista e dati operativi siano leggibili e che sia indicata la data del dato.

**Acceptance Scenarios**:

1. **Given** un utente Pro con un risultato a schermo, **When** tocca "Salva postazione", **Then** gli viene proposto un nome modificabile (precompilato con la località o le coordinate) e, alla conferma, la postazione compare tra le salvate.
2. **Given** una postazione salvata e il dispositivo **senza connessione**, **When** l'utente la apre, **Then** vede la lista completa con frequenza, modo, toni e parametri di accesso, più un'indicazione esplicita che il dato è offline e la sua data.
3. **Given** una postazione aperta **con** connessione, **When** l'utente richiede l'aggiornamento, **Then** il calcolo viene rieseguito sullo stesso punto e la copia salvata viene sostituita, aggiornando la data.
4. **Given** una postazione il cui dato ha più di 30 giorni, **When** l'utente la apre, **Then** il sistema segnala che il dato potrebbe non essere aggiornato e propone l'aggiornamento, senza impedire la consultazione.
5. **Given** un utente Pro, **When** rinomina o elimina una postazione, **Then** la modifica è immediata e persiste alla riapertura dell'app.
6. **Given** un utente che salva un punto entro ~200 m da una postazione esistente, **When** conferma, **Then** il sistema propone di aggiornare quella esistente; **And** se l'utente rifiuta, la nuova postazione viene creata come voce distinta.
7. **Given** un utente Pro con più postazioni salvate e connessione attiva, **When** avvia l'aggiornamento massivo, **Then** tutte le postazioni vengono ricalcolate sui rispettivi punti, con avanzamento visibile e possibilità di annullare in qualsiasi momento.
8. **Given** un aggiornamento massivo in corso, **When** una singola postazione fallisce o l'utente annulla, **Then** le postazioni già aggiornate conservano il dato nuovo, le altre conservano intatta la copia precedente, e l'esito viene riepilogato per postazione.
9. **Given** una postazione salvata mesi prima, **When** l'utente riapre l'app dopo aggiornamenti di versione e lunghi periodi di inattività, **Then** la postazione è ancora presente e consultabile offline.
10. **Given** una postazione salvata mentre sulla mappa era attivo un filtro di modo, **When** l'utente la consulta offline e rimuove il filtro, **Then** compaiono anche i ripetitori degli altri modi, perché la copia conservata li contiene tutti.

---

### User Story 4 - Lista delle postazioni salvate (Priority: P3)

Tutti gli utenti possono aprire "Le mie postazioni". Un utente Pro vi trova le proprie postazioni ordinate dalla più recente. Un utente non Pro trova una **vetrina** che mostra concretamente cosa otterrebbe — non una schermata vuota con un lucchetto — e lo stesso percorso d'acquisto a un tocco della storia 2.

**Why this priority**: È il secondo punto d'ingresso alla conversione e la casa delle postazioni salvate, ma non serve a rendere utilizzabili le storie 1 e 3: un Pro può già salvare e riaprire l'ultima postazione senza questa lista.

**Independent Test**: Si apre la lista con un account non Pro e si verifica vetrina, benefici e percorso al paywall; si ripete con un account Pro verificando che compaiano le postazioni reali.

**Acceptance Scenarios**:

1. **Given** un utente Pro con almeno una postazione, **When** apre la lista, **Then** vede le postazioni ordinate dalla più recente, ciascuna con nome, riferimento geografico, numero di raggiungibili e data dell'ultimo aggiornamento.
2. **Given** un utente Pro senza postazioni, **When** apre la lista, **Then** vede uno stato vuoto che spiega come crearne una e rimanda alla mappa.
3. **Given** un utente non Pro, **When** apre la lista, **Then** vede postazioni di esempio realistiche (nome, numero di raggiungibili, indicazione "disponibile offline") con i dettagli sfocati, i benefici in elenco breve e una sola CTA primaria.
4. **Given** la vetrina mostrata, **When** l'utente tocca la CTA, **Then** il paywall viene presentato in un tocco e, in caso di acquisto, la lista si sblocca nello stesso contesto.
5. **Given** la vetrina, **Then** è raggiungibile un percorso di ripristino acquisti per chi ha già sottoscritto Pro su un altro dispositivo.
6. **Given** un utente il cui abbonamento è scaduto e che aveva postazioni salvate, **When** apre la lista, **Then** le postazioni sono ancora **leggibili**, mentre creazione e aggiornamento richiedono di riattivare Pro.

---

### User Story 5 - Esperienza coerente su tablet (Priority: P3)

Su tablet la valutazione di un punto non deve essere un foglio modale che copre la mappa: l'utente vede **contemporaneamente** la mappa con il pin e la lista dei raggiungibili, e può passare da un punto all'altro mantenendo il contesto visivo.

**Why this priority**: Requisito costituzionale del progetto (una pagina non è completa finché non è verificata su entrambi i form factor) e scenario reale d'uso al banco radio. Non blocca il rilascio mobile ma non può essere rimandato oltre.

**Independent Test**: Si esegue l'intero flusso della storia 1 su tablet in orizzontale e verticale, verificando che nulla sia troncato e che mappa e lista siano leggibili insieme.

**Acceptance Scenarios**:

1. **Given** un dispositivo con larghezza da tablet, **When** l'utente valuta un punto, **Then** mappa e lista sono visibili nella stessa schermata, senza sovrapporsi.
2. **Given** un dispositivo con larghezza da telefono, **When** l'utente valuta un punto, **Then** il risultato è in un foglio a scorrimento che lascia visibile il pin.
3. **Given** la lista delle postazioni su tablet, **When** l'utente ne seleziona una, **Then** il dettaglio si apre affiancato alla lista anziché sostituirla.
4. **Given** una qualsiasi schermata della feature, **When** si ruota il dispositivo o si ridimensiona la finestra, **Then** il layout si adatta senza perdere punto selezionato e risultato già calcolato.
5. **Given** il teaser per non Pro su tablet, **Then** occupa il riquadro dei risultati mantenendo la CTA visibile senza scorrere.

---

### Edge Cases

- **Nessun risultato di ricerca**: località inesistente o scritta male → messaggio esplicito con suggerimento di provare con coordinate o pressione prolungata sulla mappa.
- **Punto senza copertura**: nessun ripetitore raggiungibile → stato vuoto che distingue "nessun ripetitore raggiungibile" da "nessun ripetitore censito nell'area": per l'operatore sono due informazioni diverse.
- **Punto in mare aperto o zona senza dati censiti**: risponde con lo stato vuoto corretto invece di restare in caricamento.
- **Area metropolitana molto densa**: la lista resta scorrevole e il tempo di risposta entro i limiti dichiarati.
- **Filtri di modo che escludono tutti i raggiungibili**: lo stato vuoto distingue "nessun ripetitore raggiungibile" da "tutti nascosti dai filtri attivi" e offre la rimozione dei filtri.
- **Cambio di ampiezza con un calcolo in corso**: il calcolo precedente viene annullato e ne parte uno nuovo, senza sovrapporre due risultati né lasciare il precedente a schermo come se fosse quello richiesto.
- **Aggiornamento di una postazione salvata con un'ampiezza diversa dall'originale**: il sistema esplicita che il confronto non è alla pari e registra la nuova ampiezza.
- **Connessione assente al momento della ricerca**: barra e calcolo richiedono rete → messaggio non bloccante, con scorciatoia alle postazioni già salvate, che restano consultabili.
- **Connessione persa a metà calcolo**: il pin resta posizionato, errore con azione "riprova", il risultato precedente non viene distrutto.
- **Servizio di calcolo lento o non disponibile**: indicatore di attesa con possibilità di annullare; oltre la soglia, errore recuperabile.
- **Coordinate fuori intervallo** (lat oltre ±90, lon oltre ±180) o formato ambiguo → rifiuto con messaggio chiaro, senza spostare la mappa.
- **Acquisto Pro completato con un pin già posizionato**: al ritorno dal paywall il pin è ancora lì e il calcolo reale parte da solo.
- **Perdita dello stato Pro con una valutazione a schermo**: il risultato già mostrato non viene distrutto; la valutazione successiva ricade sul teaser.
- **Spazio su dispositivo esaurito** durante il salvataggio → errore esplicito, nessuna postazione salvata a metà. Lo spazio esaurito NON DEVE mai essere risolto rimuovendo postazioni esistenti.
- **Aggiornamento massivo con rete instabile**: le postazioni che falliscono restano alla copia precedente e vengono elencate come non aggiornate, senza interrompere le altre.
- **Aggiornamento massivo interrotto** (annullamento, chiusura dell'app, batteria): nessuna postazione resta in stato parziale; ogni postazione è o alla copia nuova o a quella precedente.
- **Perdita dello stato Pro con postazioni salvate**: le postazioni restano leggibili e nessuna viene rimossa; l'aggiornamento (singolo e massivo) torna soggetto al paywall.
- **Salvataggio duplicato**: un punto entro ~200 m da una postazione esistente fa proporre l'aggiornamento di quella; rifiutando, si crea una postazione distinta e le due convivono senza fondersi.
- **Cambio di lingua dell'app**: tutti i testi della feature — stati vuoti, errori, teaser, copy del paywall — seguono la lingua selezionata in tutte le lingue supportate.

## Requirements *(mandatory)*

### Functional Requirements

#### Selezione del punto (disponibile a tutti gli utenti)

- **FR-001**: Il sistema DEVE esporre sulla mappa una barra di ricerca che accetta nomi di località, indirizzi e coordinate decimali.
- **FR-002**: Il sistema DEVE mostrare suggerimenti in modo incrementale a partire da 3 caratteri, con un ritardo che eviti una richiesta per ogni tasto premuto.
- **FR-003**: Ogni suggerimento DEVE riportare informazioni sufficienti a distinguere omonimi (contesto amministrativo e/o nazione).
- **FR-004**: Il sistema DEVE riconoscere una coppia di coordinate decimali digitata nella barra e trattarla come punto diretto, senza interrogare la ricerca per nome.
- **FR-005**: Gli utenti DEVONO poter selezionare un punto con pressione prolungata sulla mappa, come alternativa alla barra.
- **FR-006**: Il sistema DEVE mostrare il punto selezionato con un marker visivamente distinto dai marker dei ripetitori e dalla posizione GPS dell'utente.
- **FR-007**: Il sistema DEVE mantenere al massimo un punto attivo per volta: la selezione di un nuovo punto sostituisce il precedente.
- **FR-008**: Gli utenti DEVONO poter rimuovere il punto selezionato e tornare alla vista mappa normale.
- **FR-009**: Il sistema DEVE rifiutare coordinate fuori intervallo valido con un messaggio comprensibile, senza modificare la vista mappa.
- **FR-010**: Il sistema DEVE conservare localmente le ultime ricerche effettuate e riproporle quando la barra è vuota.
- **FR-011**: La ricerca e il posizionamento del pin DEVONO funzionare identicamente per utenti Pro e non Pro: è navigazione della mappa, non la capacità venduta.

#### Calcolo e presentazione della ricezione (Pro)

- **FR-012**: Il sistema DEVE calcolare, per il punto selezionato, quali ripetitori censiti risultano raggiungibili, usando lo stesso modello di previsione già impiegato per la reachability dalla posizione dell'utente.
- **FR-013**: Il sistema DEVE riservare il responso di ricezione agli utenti Pro, coerentemente con le altre superfici di reachability già esistenti nell'app.
- **FR-014**: Il sistema NON DEVE inviare alcuna richiesta di calcolo per un utente non Pro, in nessuna circostanza.
- **FR-015**: Il sistema NON DEVE mai esporre a un utente non Pro un valore reale di intensità di segnale, una distanza calcolata o un verdetto di raggiungibilità, in nessuna superficie dell'app.
- **FR-016**: Il sistema NON DEVE applicare limiti d'uso agli utenti Pro: le valutazioni sono illimitate.
- **FR-017**: Il sistema DEVE presentare i risultati ordinati per intensità di segnale stimata decrescente.
- **FR-018**: Ogni voce del risultato DEVE riportare il ripetitore, la distanza dal punto e l'intensità stimata, con le stesse convenzioni cromatiche di modo di accesso usate nel resto dell'app.
- **FR-019**: Il sistema DEVE mostrare il conteggio dei ripetitori raggiungibili in modo immediatamente leggibile.
- **FR-020**: Gli utenti DEVONO poter aprire il dettaglio di un ripetitore dalla lista dei risultati.
- **FR-021**: Il sistema DEVE distinguere nello stato vuoto il caso "nessun ripetitore raggiungibile" dal caso "nessun ripetitore censito nell'area".
- **FR-022**: In caso di errore durante il calcolo, il sistema NON DEVE distruggere il contenuto già a schermo: DEVE mantenere il punto selezionato e offrire un'azione di ripetizione.
- **FR-023**: Il sistema DEVE permettere di annullare un calcolo in corso.
- **FR-024**: Il sistema DEVE permettere all'utente Pro di scegliere l'ampiezza della ricerca fra tre livelli predefiniti — **rapida** (80 km), **media** (100 km), **estesa** (150 km) — con "rapida" come impostazione iniziale, in parità con la reachability dalla posizione GPS.
- **FR-025**: I livelli DEVONO essere presentati comunicando il compromesso fra portata e tempo di attesa, non come sole cifre in chilometri.
- **FR-026**: Il sistema DEVE ricordare l'ultimo livello scelto e riapplicarlo alle valutazioni successive. Il livello usato DEVE essere conservato nella postazione salvata e mostrato quando la si consulta, perché una valutazione rapida e una estesa sullo stesso punto non sono lo stesso risultato.
- **FR-027**: Il calcolo e il salvataggio DEVONO comprendere **sempre tutti i modi di accesso**, indipendentemente dai filtri di modo attivi sulla mappa.
- **FR-028**: La presentazione del risultato DEVE rispettare i filtri di modo attivi, così che la lista resti coerente con ciò che la mappa sta mostrando.
- **FR-029**: I filtri di modo DEVONO essere applicabili anche alla consultazione di una postazione salvata **senza connessione**, poiché la copia conservata contiene tutti i modi.
- **FR-030**: Quando i filtri attivi nascondono ripetitori raggiungibili, il sistema DEVE segnalarne il numero e offrire la rimozione dei filtri, così che una lista filtrata non venga scambiata per una lista vuota.

#### Teaser e conversione (utenti non Pro)

- **FR-031**: Quando un utente non Pro seleziona un punto, il sistema DEVE mostrare al posto del risultato un teaser che riproduce la **forma** del risultato reale (scheda ripetitore, indicatore di segnale, distanza) con valori segnaposto sfocati.
- **FR-032**: Il teaser DEVE essere personalizzato con il **nome della località scelta dall'utente**, o con le coordinate formattate quando il punto proviene da pressione sulla mappa.
- **FR-033**: I valori mostrati nel teaser DEVONO essere segnaposto non linguistici e non DEVONO derivare da alcun dato reale.
- **FR-034**: Il teaser DEVE dichiarare i benefici in forma breve e scansionabile, con enfasi sulla consultazione offline in assenza di copertura.
- **FR-035**: Il teaser DEVE presentare una sola call to action primaria, visibile senza scorrere su tutti i form factor supportati.
- **FR-036**: La call to action DEVE aprire il paywall in un solo passo, senza schermate intermedie di conferma.
- **FR-037**: Il paywall DEVE dichiarare esplicitamente prezzo, periodicità, eventuale periodo di prova e condizione di disdetta prima dell'acquisto.
- **FR-038**: Al completamento dell'acquisto il sistema DEVE riportare l'utente **nel contesto da cui è partito**, con il pin ancora posizionato, e DEVE avviare automaticamente il calcolo reale su quel punto.
- **FR-039**: Alla chiusura del paywall senza acquisto, il sistema DEVE riportare l'utente alla mappa con il pin intatto, senza compromettere alcuna funzione gratuita.
- **FR-040**: Il sistema DEVE offrire un percorso di ripristino acquisti raggiungibile dal teaser e dalla vetrina della lista.
- **FR-041**: Se un utente anonimo avvia l'acquisto, il sistema DEVE chiedergli di collegare un account **prima** dell'addebito; la richiesta NON DEVE farlo uscire dal contesto corrente.

#### Postazioni salvate (Pro)

- **FR-042**: Gli utenti Pro DEVONO poter salvare il risultato di una valutazione come "postazione", con un nome modificabile precompilato.
- **FR-043**: Il sistema DEVE conservare sul dispositivo tutto ciò che serve a consultare la postazione senza rete: punto, nome, elenco dei raggiungibili con i rispettivi dati operativi (frequenza, modo, toni, parametri di accesso, rete) e data del calcolo.
- **FR-044**: Il sistema DEVE rendere consultabile una postazione salvata quando il dispositivo è privo di connessione, indicando esplicitamente che si tratta di un dato memorizzato e la sua data.
- **FR-045**: Gli utenti Pro DEVONO poter aggiornare una postazione rieseguendo il calcolo sullo stesso punto quando la connessione è disponibile.
- **FR-046**: Il sistema DEVE segnalare quando il dato salvato supera i 30 giorni di età, senza impedirne la consultazione.
- **FR-047**: Gli utenti Pro DEVONO poter rinominare ed eliminare le proprie postazioni.
- **FR-048**: Il sistema DEVE riconoscere il tentativo di salvare un punto entro **~200 m** da una postazione esistente e proporre l'aggiornamento di quella, consentendo però all'utente di rifiutare e salvare una postazione distinta: a quella distanza il terreno può cambiare il responso, quindi la decisione spetta a lui.
- **FR-049**: Il sistema DEVE gestire il fallimento del salvataggio (spazio esaurito, dato incompleto) con un errore esplicito e senza lasciare postazioni parziali.
- **FR-050**: Il sistema NON DEVE cancellare le postazioni salvate alla scadenza dell'abbonamento: restano consultabili, mentre creazione e aggiornamento tornano soggetti al paywall.
- **FR-051**: Il sistema NON DEVE rimuovere automaticamente una postazione salvata in nessuna circostanza: scadenza temporale, pressione di spazio, pulizia periodica o politiche interne del meccanismo di memorizzazione. L'unica rimozione ammessa è l'azione esplicita dell'utente (FR-047).
- **FR-052**: Gli utenti Pro DEVONO poter aggiornare **tutte** le postazioni salvate con un'unica azione, quando la connessione è disponibile.
- **FR-053**: Durante l'aggiornamento massivo il sistema DEVE mostrare l'avanzamento, permettere l'annullamento e riportare l'esito per singola postazione; le postazioni non aggiornate DEVONO conservare intatta la copia precedente.

#### Lista delle postazioni

- **FR-054**: Il sistema DEVE esporre una lista delle postazioni salvate raggiungibile da tutti gli utenti.
- **FR-055**: Per gli utenti Pro, la lista DEVE mostrare le postazioni ordinate dalla più recente, ciascuna con nome, riferimento geografico, numero di raggiungibili e data dell'ultimo aggiornamento.
- **FR-056**: Per gli utenti non Pro, la lista DEVE mostrare una vetrina che rappresenta concretamente il risultato ottenibile (esempi realistici con dettagli sfocati), NON una schermata vuota o un semplice lucchetto.
- **FR-057**: La vetrina DEVE riusare gli stessi benefici, la stessa CTA e lo stesso comportamento post-acquisto del teaser sulla mappa.
- **FR-058**: La lista DEVE prevedere uno stato vuoto per gli utenti Pro senza postazioni, con rimando alla mappa.

#### Presentazione e coerenza

- **FR-059**: Tutte le schermate della feature DEVONO essere utilizzabili sia su telefono sia su tablet, con un layout dedicato al tablet dove quello mobile sprecherebbe spazio (mappa e risultati affiancati, lista e dettaglio affiancati).
- **FR-060**: Il layout DEVE adattarsi al cambio di orientamento o di dimensione della finestra senza perdere punto selezionato e risultato già calcolato.
- **FR-061**: Tutti i testi rivolti all'utente — stati vuoti, errori, etichette, teaser e copy del paywall — DEVONO essere localizzati in tutte le lingue supportate, senza stringhe scritte a codice.
- **FR-062**: La feature DEVE riusare le convenzioni visive esistenti (colori dei modi di accesso, schede ripetitore, stile del riquadro sfocato Pro, stili tipografici del tema) senza introdurre varianti proprie.
- **FR-063**: Il sistema DEVE rendere accessibile la funzione dalla mappa con un controllo riconoscibile e raggiungibile con una sola mano su telefono.

#### Misurazione della conversione

- **FR-064**: Il sistema DEVE registrare gli eventi del funnel di conversione: punto selezionato, teaser mostrato, call to action toccata, paywall presentato, acquisto completato, paywall chiuso senza acquisto.
- **FR-065**: Ogni evento DEVE riportare la **superficie di origine** (teaser sulla mappa, vetrina della lista postazioni, pulsante "cosa raggiungo da qui"), così da poter confrontare il rendimento dei punti d'ingresso.
- **FR-066**: Il sistema DEVE strumentare con gli stessi eventi anche la superficie di reachability **già esistente**, oggi priva di misurazione, affinché i percorsi siano comparabili fra loro.
- **FR-067**: Gli eventi NON DEVONO contenere le coordinate scelte dall'utente né il nome della località cercata: sono dati sensibili (abitazione, sito di attivazione) e non servono al calcolo del funnel.
- **FR-068**: La registrazione degli eventi NON DEVE bloccare né rallentare l'interazione: un fallimento nell'invio è silenzioso per l'utente e non compromette la funzione.

### Key Entities

- **Punto di ricerca**: il luogo scelto dall'utente. Attributi: coordinate, etichetta leggibile (nome località o coordinate formattate), origine della selezione (ricerca per nome, coordinate digitate, pressione sulla mappa).
- **Risultato di ricezione**: l'esito della valutazione per un punto, sempre completo di tutti i modi di accesso. Attributi: riferimento al punto, momento del calcolo, **ampiezza di ricerca usata**, numero di raggiungibili, elenco ordinato di voci.
- **Voce di raggiungibilità**: singolo ripetitore valutato. Attributi: ripetitore di riferimento, distanza dal punto, intensità stimata, esito raggiungibile/non raggiungibile.
- **Postazione salvata**: la ricerca conservata da un utente Pro, a durata illimitata. Attributi: nome assegnato, punto di ricerca, ampiezza di ricerca usata, copia integrale del risultato con i dati operativi dei ripetitori, data del calcolo, data dell'ultimo aggiornamento.
- **Ricerca recente**: voce di cronologia locale, limitata agli ultimi elementi. Attributi: etichetta, coordinate, momento dell'uso.
- **Stato di abbonamento**: determina se il punto selezionato produce un responso reale o un teaser, e se il salvataggio è disponibile.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Un utente Pro ottiene la lista dei ripetitori raggiungibili da una località cercata per nome in **meno di 20 secondi** e **al massimo 4 interazioni** (tocco sulla barra, digitazione, selezione del suggerimento, lettura del risultato).
- **SC-002**: I suggerimenti di ricerca compaiono entro **1 secondo** dalla fine della digitazione nel 95% dei casi con connessione normale.
- **SC-003**: Alla ampiezza **rapida**, il risultato di ricezione è disponibile entro **10 secondi** nel 90% dei casi. Ai livelli medio ed esteso l'attesa può crescere, ma indicatore di avanzamento e annullamento restano sempre disponibili e l'utente conosce in anticipo il compromesso che sta scegliendo.
- **SC-004**: Una postazione salvata è consultabile **senza alcuna connessione dati** e mostra tutti i parametri necessari a sintonizzare ciascun ripetitore, verificato in modalità aereo su almeno 5 postazioni diverse.
- **SC-005**: L'apertura di una postazione salvata offline avviene in **meno di 2 secondi**.
- **SC-006**: Il **90%** degli utenti Pro in test di usabilità (almeno 8 partecipanti) completa senza aiuto il flusso "cerca località → leggi cosa raggiungi" al primo tentativo.
- **SC-007**: Un utente non Pro raggiunge il paywall in **un solo tocco** dal teaser e dalla vetrina, e conosce prezzo, periodicità ed eventuale prova gratuita **prima** di qualsiasi conferma d'acquisto.
- **SC-008**: **Zero** richieste al servizio di calcolo vengono generate da utenti non Pro, verificato ispezionando il traffico durante una sessione completa di prova con account non Pro.
- **SC-009**: **Zero** superfici dell'app espongono a un utente non Pro un valore reale di intensità, distanza calcolata o verdetto di raggiungibilità, verificato attraversando tutte e tre le superfici di reachability.
- **SC-010**: Il completamento di un acquisto dal teaser riporta l'utente al punto esatto da cui era partito, con Pro attivo e calcolo reale avviato, in **meno di 3 secondi** dalla conferma dello store.
- **SC-011**: Nessuna schermata presenta contenuto troncato, sovrapposto o illeggibile su telefono e tablet, in entrambi gli orientamenti, verificato su almeno 4 combinazioni di dimensione/orientamento.
- **SC-012**: Zero stringhe rivolte all'utente risultano non tradotte: la generazione delle traduzioni riporta **0 messaggi mancanti** in tutte le lingue supportate.
- **SC-013**: In assenza di connessione, nessuna schermata della feature va in errore bloccante: l'utente vede sempre o un contenuto salvato o un messaggio recuperabile con azione di ripetizione.
- **SC-014**: L'interruzione o il fallimento di un calcolo non fa mai perdere il punto selezionato né un risultato già mostrato, verificato simulando perdita di rete in 3 momenti diversi del flusso.
- **SC-015**: **Nessuna** postazione salvata scompare senza un'azione esplicita dell'utente, verificato dopo riavvii dell'app, un aggiornamento di versione e almeno 30 giorni simulati di inattività.
- **SC-016**: L'aggiornamento massivo di 10 postazioni si completa senza lasciare alcuna postazione in stato parziale, e l'esito per singola postazione è leggibile al termine, verificato includendo almeno un fallimento indotto.
- **SC-017**: Entro il primo mese dal rilascio è possibile calcolare, **separatamente per ciascuna delle tre superfici**, il tasso di passaggio teaser → CTA e CTA → acquisto, senza analisi manuale dei dati grezzi.
- **SC-018**: Nessun evento registrato contiene coordinate o nomi di località scelti dall'utente, verificato ispezionando il contenuto degli eventi prodotti in una sessione completa di prova.
- **SC-019**: Su una postazione salvata consultata **senza connessione**, cambiare i filtri di modo fa comparire ripetitori che non erano visibili al momento del salvataggio, verificato salvando con un filtro attivo e rimuovendolo offline.

## Assumptions

- **Modello di previsione**: la valutazione riusa il servizio di copertura già in uso per la reachability dalla posizione dell'utente, con gli stessi parametri predefiniti (altezza di ricezione standard). Il punto arbitrario sostituisce le coordinate GPS; il raggio di ricerca dei candidati diventa selezionabile su tre livelli (FR-024) anziché fisso.
- **Ricerca per località**: la conversione nome → coordinate si appoggia al servizio di geocodifica del fornitore di mappe già integrato, senza nuovi fornitori né nuove credenziali. È l'unica chiamata di rete consentita per un utente non Pro in questa feature, ed è di navigazione, non di calcolo.
- **Gating**: la nuova superficie ricade sotto lo stesso interruttore che governa oggi la reachability, così che l'attivazione/disattivazione della funzione a pagamento resti un'unica decisione centralizzata e non possa divergere fra superfici.
- **Reachability esistente**: il pulsante "cosa raggiungo da qui" e il badge sul dettaglio ripetitore restano invariati, Pro-only. Questa feature li affianca, non li sostituisce.
- **Persistenza offline**: le postazioni salvate sono **locali al dispositivo** e non sincronizzate tra dispositivi; il ripristino su un nuovo dispositivo è fuori scope per questa versione.
- **Durabilità e scelta del meccanismo**: FR-051 impone una durata illimitata, quindi il meccanismo di memorizzazione deve comportarsi da **archivio persistente**, non da cache. Il pacchetto indicato dal richiedente (`remote_caching`) nasce come cache con scadenza: in fase di planning va verificato che possa garantire l'assenza di eviction, altrimenti va sostituito con un archivio persistente. La cache resta invece appropriata per dati rigenerabili (es. risultati di valutazioni non salvate).
- **Numero di postazioni**: nessun limite esplicito per un utente Pro; l'unico vincolo è lo spazio disponibile sul dispositivo.
- **Freschezza del dato**: 30 giorni è la soglia oltre la quale una postazione viene segnalata come potenzialmente non aggiornata; il dato non viene mai cancellato automaticamente.
- **Posizionamento in app**: il controllo di ricerca vive sulla mappa dei ripetitori; la lista delle postazioni è una destinazione autonoma raggiungibile sia dalla mappa sia dall'area personale. La barra cerca **luoghi**, non ripetitori: la ricerca per nominativo resta dove si trova oggi.
- **Cronologia locale**: le ricerche recenti (FR-010) sono conservate localmente, limitate agli ultimi elementi, e non richiedono account.
- **Strumentazione**: l'app non possiede oggi alcun sistema di analytics. Gli eventi del funnel (FR-064) vengono scritti nel **backend già in uso**, senza introdurre SDK di terze parti: nessun nuovo trasferimento di dati verso terzi e nessuna nuova dichiarazione di privacy sugli store. Il sistema di abbonamenti continua a fornire in autonomia le metriche dal paywall in avanti; la strumentazione copre il tratto a monte, che oggi è invisibile.
- **Paywall**: presentazione dell'offerta e gestione dell'acquisto usano il sistema di abbonamenti già integrato, incluso l'eventuale offering dedicato alla reachability. Questa specifica definisce contenuto, posizionamento e comportamento di teaser, vetrina e ritorno post-acquisto, non il motore di pagamento.
- **Dati ripetitore**: i parametri necessari alla consultazione offline (frequenza, modo, toni, parametri di accesso, rete) sono già presenti nel modello dati esistente e vengono conservati insieme al risultato.

## Out of Scope

- Sincronizzazione delle postazioni tra più dispositivi o tramite account.
- Condivisione di una postazione con altri utenti o esportazione in file.
- Mappa di copertura grafica (poligoni/heatmap) dal punto arbitrario: qui si mostra la **lista** dei raggiungibili, non la superficie di copertura.
- Prova gratuita limitata della funzione (numero di valutazioni omaggio, sblocco temporaneo): esplicitamente escluso — la funzione è Pro senza eccezioni.
- Notifiche o aggiornamenti automatici in background delle postazioni salvate.
- Personalizzazione dei parametri di calcolo (altezza antenna, potenza, guadagno) da parte dell'utente.
- Scaricamento offline delle tessere di mappa per le postazioni salvate.
