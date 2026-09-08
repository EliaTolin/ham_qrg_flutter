# Feature Specification: Sistema di misura imperiale (miglia e piedi) per gli utenti che lo usano

**Feature Branch**: `006-imperial-units`
**Created**: 2026-09-08
**Status**: Draft
**Input**: User description: "Utenti americani si lamentano che non hanno il sistema metrico"

## Premesse di prodotto

L'app oggi scrive ovunque chilometri e metri. Per un radioamatore statunitense questo non è un dettaglio estetico: la distanza da un ripetitore e la quota di una cima sono i due numeri su cui si decide **se vale la pena provare il collegamento**, e sono esattamente i due numeri che quell'utente non sa leggere a colpo d'occhio. Un "42 km" richiede una conversione mentale ogni volta che si scorre una lista; un "1 240 m" di quota non dice nulla a chi ragiona in piedi. Il risultato è che la parte più utile dell'app — la valutazione rapida di cosa è raggiungibile — smette di essere rapida.

La richiesta arrivata dagli utenti americani è quindi una richiesta di **leggibilità del dato**, non di una nuova capacità. Nessuna funzione cambia: cambia l'unità con cui i risultati vengono scritti.

Due conseguenze guidano tutta la specifica:

- **La conversione è solo di presentazione.** Nulla di ciò che l'app calcola, salva, ordina o confronta cambia unità. Le soglie funzionali (il raggio entro cui si può inviare un feedback, l'ampiezza di ricerca che entra nell'identità di una postazione salvata, la distanza oltre la quale due postazioni sono considerate distinte) restano definite in metrico. Se la conversione entrasse nella logica, cambiare impostazione cambierebbe i risultati — ed è precisamente ciò che non deve succedere.
- **La copertura deve essere totale o non vale.** Un'app che mostra miglia nella lista e metri nel profilo altimetrico è peggiore di una che mostra metri ovunque: costringe l'utente a chiedersi, ogni volta, in quale sistema stia leggendo. Per questo la specifica censisce esplicitamente sia ciò che si converte, sia ciò che non si converte mai.

La feature è **gratuita e per tutti**. Non è una capacità aggiuntiva da vendere: è la stessa risposta, scritta nella lingua di chi la legge.

## Clarifications

### Session 2026-09-08 — `/speckit.clarify`

- Q: Regole di arrotondamento e soglia fra unità lunga e corta? → A: **Specchio esatto della regola metrica già in produzione.** Sotto l'unità lunga si usa l'unità corta a numero intero (`1 580 ft` / `850 m`); da 1 unità lunga in su, sempre **una** cifra decimale (`12.4 mi` / `12.4 km`, `112.0 mi` / `112.0 km`). Il lato metrico resta invariato: nessuna regressione da spiegare a chi usa l'app oggi, e le due formattazioni si verificano con lo stesso test.
- Q: Come si scrive nel testo una soglia funzionale convertita (es. "entro 5 km")? → A: **Arrotondamento per difetto a numero tondo** — "entro 3 mi", "entro 650 ft". La soglia scritta è sempre minore o uguale a quella reale, quindi chi rispetta il testo supera sempre il controllo; il caso opposto (leggere 3.1 mi ed essere bloccati a 3.12) non può presentarsi. La frangia di raggio reale non pubblicizzata è il costo accettato.
- Q: Con quale criterio verificabile si sostituiscono i due criteri di successo non misurabili (segnalazioni azzerate, tempo di lettura ridotto)? → A: **Si rimuovono**, e la copertura diventa il criterio portante: SC-002 più una **tabella di valori campione** con l'output atteso dichiarato nei due sistemi, verificata automaticamente. Se copertura e tabella passano, le segnalazioni si fermano per costruzione; misurarle a valle non aggiungerebbe informazione e dipenderebbe da terzi.

## User Scenarios & Testing *(mandatory)*

### User Story 1 - L'app parla imperiale da sola (Priority: P1)

Un radioamatore statunitense installa l'app su un telefono configurato con regione Stati Uniti. Apre la lista dei ripetitori vicini, il dettaglio di uno di essi e gli spot POTA/SOTA della giornata: ogni distanza è in miglia, ogni quota è in piedi. Non ha aperto nessuna impostazione e non sa che una impostazione esista.

**Why this priority**: è il 100% del problema segnalato. La quasi totalità degli utenti interessati non cercherà mai un'impostazione: se il default non è corretto, la feature per loro non esiste. Da sola questa storia risolve la lamentela.

**Independent Test**: si configura un dispositivo con regione Stati Uniti, si installa l'app pulita e si percorrono le superfici principali (lista ripetitori, dettaglio ripetitore, spot POTA, spot SOTA, dashboard) verificando che non compaia mai né `km` né `m`. Si ripete con regione Italia verificando l'opposto.

**Acceptance Scenarios**:

1. **Given** un dispositivo con regione Stati Uniti e nessuna preferenza salvata, **When** l'utente apre la lista dei ripetitori vicini, **Then** ogni distanza è espressa in miglia con il simbolo `mi`.
2. **Given** lo stesso dispositivo, **When** l'utente apre il dettaglio di un ripetitore che riporta la quota, **Then** la quota è espressa in piedi con il simbolo `ft`.
3. **Given** un dispositivo con regione Italia e nessuna preferenza salvata, **When** l'utente apre le stesse schermate, **Then** distanze e quote restano in chilometri e metri.
4. **Given** un dispositivo con regione Stati Uniti ma lingua dell'app impostata su italiano, **When** l'utente apre la lista, **Then** i testi sono in italiano e le unità sono imperiali: lingua e sistema di misura sono assi indipendenti.

---

### User Story 2 - Scegliere il proprio sistema di misura (Priority: P2)

Un utente vuole decidere lui: un italiano che si è portato il telefono configurato in inglese USA e vuole i chilometri, un americano che ha imparato a ragionare in metrico per la radio, un europeo in viaggio negli Stati Uniti. Dalle impostazioni, accanto alla lingua, sceglie fra **Automatico**, **Metrico** e **Imperiale**; la scelta vale subito e resta dopo il riavvio.

**Why this priority**: senza questo controllo, ogni caso in cui la regione del dispositivo non rappresenta l'utente diventa una lamentela nuova, con la differenza che questa volta non è risolvibile. È la valvola di sicurezza del default automatico, ma serve solo alla minoranza per cui il default sbaglia.

**Independent Test**: dalle impostazioni si passa da Automatico a Imperiale e ritorno, verificando che le schermate già aperte si aggiornino senza riavvio e che la scelta sopravviva alla chiusura completa dell'app.

**Acceptance Scenarios**:

1. **Given** l'app con preferenza Automatico su un dispositivo europeo, **When** l'utente sceglie Imperiale nelle impostazioni, **Then** ogni distanza e quota visibile passa a miglia e piedi senza riavviare l'app.
2. **Given** la preferenza impostata su Imperiale, **When** l'utente chiude e riapre l'app, **Then** la preferenza è ancora Imperiale.
3. **Given** la preferenza impostata su Metrico su un dispositivo con regione Stati Uniti, **When** l'utente apre qualsiasi schermata, **Then** vede chilometri e metri: la scelta esplicita prevale sempre sulla regione.
4. **Given** un utente anonimo (non registrato), **When** cambia il sistema di misura, **Then** la preferenza viene applicata e conservata esattamente come per un utente autenticato.
5. **Given** la preferenza Automatico, **When** l'utente cambia la regione del dispositivo e torna nell'app, **Then** le unità si allineano alla nuova regione.

---

### User Story 3 - Nessuna superficie resta indietro (Priority: P3)

Le superfici tecniche e secondarie — il grafico del profilo altimetrico con i suoi assi ed etichette, il selettore di ampiezza della ricerca copertura, il raggio delle regioni di mappa offline, gli avvisi di distanza prima di inviare un feedback, le postazioni salvate consultate offline — parlano lo stesso sistema di tutto il resto.

**Why this priority**: sono le schermate meno frequentate, ma sono quelle in cui il numero conta di più (un profilo altimetrico esiste solo per essere letto in quota). Una loro dimenticanza non rompe la feature ma la rende inaffidabile: l'utente non sa più quando fidarsi. Vale come tranche successiva perché ciascuna può essere completata e verificata da sola.

**Independent Test**: con preferenza Imperiale si aprono, una per una, le superfici dell'elenco e si verifica che ogni grandezza convertibile sia in unità imperiali, comprese le etichette degli assi del grafico e le voci dei selettori a preset.

**Acceptance Scenarios**:

1. **Given** la preferenza Imperiale, **When** l'utente apre il profilo altimetrico verso un ripetitore, **Then** l'asse delle distanze è in miglia, l'asse delle quote in piedi e le etichette di partenza/arrivo riportano i piedi.
2. **Given** la preferenza Imperiale, **When** l'utente apre il selettore di ampiezza della ricerca copertura, **Then** le tre opzioni sono descritte con il loro equivalente in miglia arrotondato.
3. **Given** la preferenza Imperiale, **When** l'utente crea una regione di mappa offline, **Then** i raggi disponibili e il riepilogo della regione creata sono espressi in miglia.
4. **Given** una postazione salvata creata mentre la preferenza era Metrico, **When** l'utente passa a Imperiale e la riapre offline, **Then** i valori vengono mostrati in unità imperiali senza dover rigenerare né riscaricare nulla.
5. **Given** la preferenza Imperiale, **When** l'utente si trova troppo lontano per inviare un feedback, **Then** l'avviso indica la soglia e la distanza in miglia.

---

### Edge Cases

- **Distanze molto brevi.** Sotto il miglio la cifra in miglia diventa illeggibile (`0.03 mi`): si passa ai piedi interi (FR-007), esattamente come oggi si passa ai metri sotto il chilometro.
- **Arrotondamenti che pareggiano.** Due ripetitori a 12.44 e 12.41 miglia vengono scritti entrambi `12.4 mi`. L'ordinamento della lista resta sul valore reale, non sulla stringa: due righe con lo stesso testo non sono un errore.
- **Soglie funzionali scritte in imperiale.** La regola "devi essere entro 5 km dal ripetitore" viene scritta `entro 3 mi`, non `3.1 mi`: arrotondata per difetto, la soglia dichiarata è sempre più stretta di quella verificata, quindi chi rispetta il testo supera sempre il controllo. La verifica continua a girare sul valore metrico, e il caso fastidioso — leggere una cifra ed essere bloccati lo stesso — non può presentarsi.
- **Valore già disponibile in imperiale alla sorgente.** Le quote SOTA arrivano con entrambe le unità: convertire i metri a mano produrrebbe un piede di differenza rispetto al numero ufficiale della cima, che è quello che l'attivatore conosce a memoria.
- **Regione del dispositivo assente o non riconosciuta.** Il sistema automatico deve avere un esito definito e stabile, non uno schermo con unità mancanti.
- **Lettori di schermo.** Un'etichetta di accessibilità che legge "chilometri" mentre a video c'è `mi` è un difetto a tutti gli effetti.
- **Separatore decimale.** `3.1 mi` in inglese e `3,1 mi` in italiano: la convenzione numerica segue la lingua attiva, il sistema di misura segue la preferenza. Sono due assi distinti e vanno combinati.
- **Cambio di preferenza a schermata aperta.** Chi cambia impostazione e torna indietro deve trovare la schermata precedente già aggiornata, non un valore residuo del sistema precedente.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: L'app DEVE offrire una preferenza "sistema di misura" con tre valori: **Automatico**, **Metrico**, **Imperiale**. Il valore iniziale, per un'installazione pulita, è Automatico.
- **FR-002**: In modalità Automatico il sistema DEVE essere dedotto dalla **regione del dispositivo**, non dalla lingua dell'app: imperiale per Stati Uniti, Liberia e Myanmar; metrico per ogni altra regione, inclusa quella sconosciuta o non determinabile.
- **FR-003**: La preferenza DEVE essere persistita sul dispositivo, sopravvivere alla chiusura dell'app e restare indipendente dalla lingua scelta; DEVE essere disponibile anche agli utenti anonimi e NON DEVE essere sincronizzata sull'account.
- **FR-004**: Un cambio di preferenza DEVE riflettersi su tutte le superfici già costruite senza richiedere un riavvio dell'app né una nuova richiesta di dati.
- **FR-005**: Le grandezze seguenti DEVONO essere convertite ovunque compaiano: distanze fra punti, raggi di ricerca e di download, quote e altitudini, dislivelli, assi e etichette del profilo altimetrico, soglie di distanza citate nei testi di avviso.
- **FR-006**: Le grandezze seguenti NON DEVONO mai essere convertite né alterate: frequenze (Hz/MHz), toni CTCSS, potenza di segnale (dBm), dimensioni dei file e delle regioni scaricate (byte/MB), coordinate geografiche, locatori Maidenhead, azimut in gradi, tempi e — in modo particolarmente esplicito — le **lunghezze d'onda** (`2 m`, `70 cm`). Quest'ultima è l'eccezione che un'implementazione distratta romperebbe per prima: è scritta in metri ed è una lunghezza, ma è anche il **nome della banda**, identico in tutto il mondo. Un radioamatore statunitense dice "two meters", non "six point five feet": convertirla non renderebbe l'app più leggibile, la renderebbe incomprensibile.
- **FR-007**: Il sistema DEVE applicare le stesse regole di arrotondamento nei due sistemi: sotto 1 unità lunga (1 mi / 1 km) il valore si esprime nell'unità corta a numero intero (`1 580 ft`, `850 m`); da 1 unità lunga in su si mostra sempre **una** cifra decimale (`12.4 mi`, `12.4 km`, `112.0 mi`, `112.0 km`). La regola vale per entrambi i sistemi e sostituisce le tre regole metriche oggi coesistenti nel codice (decimale sempre / perso sopra i 10 km / perso sopra i 100 km). L'unica differenza visibile lato metrico è che una distanza pari o superiore a 100 km conserva il decimale (`112.0 km` invece di `112 km`) nelle liste POTA e SOTA: è una conseguenza accettata della convergenza, non un obiettivo.
- **FR-008**: Ogni confronto, ordinamento, filtro o verifica di soglia DEVE continuare a operare sul valore metrico non convertito. Cambiare sistema di misura NON DEVE alterare l'ordine di alcuna lista né l'esito di alcuna regola.
- **FR-009**: I selettori a valori predefiniti (ampiezza della ricerca copertura, raggio delle regioni offline) DEVONO mostrare l'equivalente imperiale arrotondato **conservando l'identità metrica del preset**: l'opzione resta la stessa opzione, cambia solo come è scritta.
- **FR-010**: I dati memorizzati sul dispositivo (postazioni salvate, cache dei ripetitori, metadati delle regioni offline) DEVONO restare in unità neutre. Cambiare sistema NON DEVE invalidare, rigenerare o richiedere il riscaricamento di alcun dato salvato.
- **FR-011**: Quando la sorgente fornisce nativamente il valore imperiale (quota delle cime SOTA), il sistema DEVE usare quel valore invece di convertire, per non discostarsi dal dato ufficiale.
- **FR-012**: Tutte le stringhe introdotte DEVONO esistere in tutte le lingue supportate, con i simboli `mi` e `ft` mantenuti come simboli e non tradotti arbitrariamente.
- **FR-013**: Le etichette di accessibilità DEVONO riportare la stessa unità mostrata a video.
- **FR-014**: Il controllo del sistema di misura DEVE essere raggiungibile da **entrambe** le schermate in cui l'utente sceglie oggi la lingua — le impostazioni dell'utente registrato e il profilo dell'utente anonimo — perché il caso più frequente (chi ha appena installato l'app e non si è registrato) è anche quello che ha più bisogno di correggere il default. La forma è quella del selettore di tema, a scelta unica sempre visibile, non quella del selettore di lingua a finestra modale: le opzioni sono tre e stanno su una riga.
- **FR-015**: La formattazione numerica (separatore decimale, raggruppamento delle migliaia) DEVE seguire la lingua attiva, indipendentemente dal sistema di misura scelto.
- **FR-016**: Le soglie funzionali citate nei testi (raggio entro cui si può inviare un feedback, distanza di duplicazione di una postazione) DEVONO essere scritte **arrotondate per difetto** a un numero tondo nell'unità in uso, in deroga a FR-007: la soglia dichiarata all'utente non DEVE mai essere più larga di quella effettivamente verificata.

### Key Entities

- **Preferenza sistema di misura**: la scelta dell'utente fra Automatico, Metrico e Imperiale. Vive sul dispositivo, appartiene allo stesso piano della lingua, non ha alcuna rappresentazione lato server.
- **Grandezza misurata**: un valore fisico con la sua natura (distanza oppure quota) espresso nell'unità canonica metrica. È ciò che l'app calcola e salva; l'unità con cui viene scritto è una decisione presa solo al momento di mostrarlo.
- **Preset di raggio**: un'opzione a valore fisso (ampiezza ricerca, raggio regione offline) la cui identità è metrica e stabile; il testo mostrato è una sua rappresentazione, non il suo valore.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Un utente con dispositivo configurato su Stati Uniti che installa l'app e la usa per la prima volta legge miglia e piedi in ogni superficie, **senza aver aperto alcuna impostazione**.
- **SC-002**: Il 100% delle superfici che mostrano una distanza o una quota è coerente con la preferenza attiva: zero superfici residue nel sistema opposto, verificato su un elenco censito di schermate.
- **SC-003**: Cambiare sistema di misura richiede al massimo 3 tocchi a partire dal profilo, e l'effetto è visibile su qualsiasi schermata già aperta entro un secondo dal ritorno.
- **SC-004**: Nessun valore mostrato si discosta dal valore reale più dell'errore di arrotondamento dichiarato (0,1 mi per le distanze lunghe, 1 ft per le quote).
- **SC-005**: Ripetendo lo stesso percorso d'uso una volta in Metrico e una in Imperiale, l'ordine di ogni lista, l'esito di ogni filtro e il verdetto di ogni regola basata su soglia risultano identici.
- **SC-006**: Una tabella di valori campione — 0, 300 m, 999 m, 1 km, 12,4 km, 112 km per le distanze; 0, 350 m, 1 240 m per le quote — produce, in entrambi i sistemi, esattamente l'output dichiarato nella tabella stessa, verificato in modo automatico e ripetibile.

## Assumptions

- **Due soli sistemi.** Metrico e imperiale statunitense. Nessuna variante ibrida britannica (miglia per le distanze, metri per le quote) e nessuna unità nautica: non risultano richieste in tal senso, e la forma a scelta chiusa le accoglierebbe in seguito senza rimettere in discussione nulla.
- **Unità imperiali adottate**: miglio terrestre per le distanze, piede per le quote e per le distanze brevi. Nessun uso della iarda.
- **La preferenza è del dispositivo**, come già accade per la lingua: chi usa l'app su due dispositivi la imposta due volte. Legarla all'account introdurrebbe una dipendenza dalla rete e dall'autenticazione per una scelta che deve funzionare anche offline e da anonimi.
- **Automatico segue la regione, non la lingua.** Un utente italiano che usa l'app in inglese vuole quasi certamente i chilometri; un americano che la usa in italiano vuole quasi certamente le miglia.
- **Nessun impatto sul backend.** Nessuna migrazione, nessun campo nuovo, nessuna modifica alle funzioni remote: la conversione avviene interamente nel momento in cui il dato viene scritto a schermo.
- **Feature gratuita.** Non è una capacità aggiuntiva e non entra in alcun modo nel perimetro Pro; le superfici Pro esistenti si limitano a mostrare i propri numeri nell'unità corretta.
- **Scala della mappa di terze parti.** Non è un problema: la scala grafica del fornitore è oggi disattivata su tutte le mappe dell'app, quindi non esiste alcuna superficie di terze parti che possa contraddire la preferenza. Se in futuro venisse riattivata, andrebbe allineata.
- **La potenza di segnale resta in dBm** in entrambi i sistemi: è un'unità della radio, non del sistema metrico, ed è la stessa negli Stati Uniti.
