# Fase 0 — Ricerca e decisioni tecniche

**Feature**: 006-imperial-units | **Data**: 2026-09-08

Nessun `NEEDS CLARIFICATION` era rimasto aperto dalla spec dopo `/speckit.clarify`. Le domande che restavano erano di realizzazione, non di prodotto, e sono state risolte leggendo il codice esistente.

---

## D1 — Come raggiunge la preferenza i punti che formattano

**Decisione**: un `UnitSystemScope` (`InheritedWidget`) installato nel `builder` di `MaterialApp.router` in `lib/src/app.dart`, letto tramite un'estensione `context.units` speculare a `context.localization`.

**Motivazione**: il censimento mostra che i siti da convertire non sono pagine, sono **metodi helper privati e widget senza `ref`** — `_formatDistance(double km)` in `pota_spot_list_item`, `summit_card`, `repeaters_list_tablet`, `dashboard_tablet` e altri sei. Farci arrivare la preferenza come parametro significherebbe modificare la firma di ogni widget intermedio; farla arrivare con `ref.watch` significherebbe convertire quei widget in `ConsumerWidget` uno per uno. L'`InheritedWidget` risolve entrambe le cose con una riga per sito, e in più fornisce **gratis** la ricostruzione automatica di ogni schermata montata al cambio di preferenza: è la dipendenza dell'elemento dallo scope a farla scattare, non un `setState` che qualcuno deve ricordarsi di scrivere. È ciò che rende FR-004 e SC-003 verificabili invece che sperati.

**Alternative considerate**:
- *`ref.watch(unitSystemProvider)` in ogni sito* — scartata: obbliga a toccare le firme e a promuovere a `ConsumerWidget` widget puramente presentazionali, aumentando la superficie di modifica proprio dove il rischio di dimenticanza è più alto. In più CLAUDE.md documenta che in Riverpod 3 un provider senza listener attivo resta sospeso: si aggiungerebbe una terza voce all'elenco dei provider che il root deve tenere vivi.
- *Passare `UnitSystem` come parametro a ogni formattatore* — scartata per la stessa ragione, con l'aggravante che un parametro dimenticato compila e restituisce silenziosamente metri.
- *Variabile globale / singleton letto staticamente* — scartata: formatta correttamente ma non ricostruisce nulla, quindi le schermate già montate resterebbero indietro (viola FR-004).

---

## D2 — Come si risolve "Automatico"

**Decisione**: dalla **regione del dispositivo**, letta da `WidgetsBinding.instance.platformDispatcher.locale.countryCode`; imperiale per `US`, `LR`, `MM`, metrico per tutto il resto, incluso `countryCode == null`. Il root widget (`_HamQRGState`, già `ConsumerStatefulWidget`) implementa `WidgetsBindingObserver.didChangeLocales` e invalida il provider, così un cambio di regione a sistema acceso si riflette senza riavvio (US2, scenario 5).

**Motivazione**: è l'unico segnale disponibile in modo identico su iOS e Android senza codice nativo. Va letto dal `platformDispatcher` e **non** da `Localizations.localeOf(context)`: quest'ultimo restituisce la lingua *dell'app*, che l'utente può aver forzato da `LocaleNotifier`, e produrrebbe l'errore esatto che la spec vieta (un italiano che usa l'app in inglese non vuole le miglia).

**Alternative considerate**:
- *Leggere l'impostazione esplicita "Sistema di misura" di iOS* (`Locale.current.measurementSystem`) — scartata per ora. Esiste solo su iOS, non è esposta da `ui.Locale` (Flutter conserva lingua/script/paese e lascia cadere le estensioni Unicode `-u-ms-`), richiederebbe un `MethodChannel`, e su Android non ha controparte: due telefoni configurati allo stesso modo mostrerebbero unità diverse. Il guadagno riguarda solo gli utenti la cui regione contraddice la loro preferenza, cioè esattamente le persone per cui esiste il selettore manuale. Rivalutabile se arrivano segnalazioni specifiche.

---

## D3 — Dove vive la regola di formattazione

**Decisione**: un unico `UnitFormat` in `lib/common/utils/unit_format_helper.dart`, **puro**: funzioni statiche che prendono il valore canonico (metri) più `UnitSystem` e `Locale`, e restituiscono `String`. Nessuna dipendenza da `BuildContext`, da Riverpod o da Flutter oltre a `intl`.

**Motivazione**: rende SC-006 un test unitario da millisecondi invece che un widget test, e permette di eliminare i 9 `_formatDistance` duplicati sostituendoli con una chiamata sola. La purezza è anche ciò che garantisce FR-008: un formattatore che non sa nulla di ordinamenti non può influenzarli.

**Alternative considerate**:
- *Estendere `RepeaterFormatHelper`* — scartata: quella classe formatta frequenze, shift e toni, cioè esattamente le grandezze che FR-006 dichiara non convertibili. Tenerle separate impedisce che qualcuno, un anno da adesso, "converta" anche i megahertz. Il suo `formatDistance` esistente (con il testo inglese hardcoded `'... away'`, altro debito) viene rimosso e i chiamanti spostati sul nuovo helper.

---

## D4 — Separatore decimale e lingua

**Decisione**: `NumberFormat` di `intl` costruito sulla **lingua attiva dell'app**, con l'istanza memoizzata per coppia (locale, sistema) invece che ricostruita a ogni `build`.

**Motivazione**: FR-015 tiene i due assi separati — `3,1 mi` in italiano, `3.1 mi` in inglese. `NumberFormat` non è gratuito da costruire e questi formattatori girano dentro `ListView.builder` su liste di ripetitori: costruirne uno per cella è il tipo di spreco che non si vede in sviluppo e si sente in campo su un telefono modesto.

---

## D5 — Chiavi di localizzazione con l'unità dentro

**Decisione**: le 14 chiavi che oggi contengono l'unità nel testo (`"{distance} km da qui"`, `"{signal} · {distance} km · tocca per il profilo"`, `"Ostacolo a {distance} km, +{height} m"`, `"entro {km} km · {count} valutati"`, `"Raggio {radius} km · {size}"`, `"{m} m"`, …) vengono ristrutturate in modo che il **placeholder porti già l'unità**: `"{distance} da qui"` riceve `"12,4 km"` oppure `"7.7 mi"` dal formattatore.

**Motivazione**: è l'unica forma che non raddoppia le chiavi. L'alternativa — una variante `…Imperial` per ciascuna — significherebbe 14 chiavi in più × 15 lingue = 210 stringhe da tenere allineate a mano, con la certezza che prima o poi una divergerà. Effetto collaterale positivo: le 15 traduzioni diventano indipendenti dall'unità, quindi una futura terza variante non le tocca.

**Conseguenza operativa**: i tre suggerimenti di ampiezza (`"80 km · risposta più veloce"`) hanno il numero *dentro* il testo tradotto e vanno anch'essi parametrizzati; il valore mostrato arriva dal preset (FR-009), il testo resta uno per lingua.

---

## D6 — Ordine di lavoro

**Decisione**: prima la convergenza a comportamento invariato (tutti i siti sul nuovo helper, sistema forzato a metrico), poi l'introduzione della preferenza.

**Motivazione**: separa un refactoring ampio e verificabile ("nulla è cambiato a schermo") da un cambiamento di comportamento ristretto ("ora cambia"). Se qualcosa si rompe, si sa in quale dei due passi. Fondendo i due, ogni differenza a schermo diventa ambigua: voluta o regressione?

**Precisazione dopo la Fase 2 (task)**: la separazione si applica **per file**, non come due fasi globali. Suddividere il lavoro per user story richiede che ogni fetta sia rilasciabile da sola, il che è incompatibile con un primo passaggio che tocca venti file senza cambiare nulla. La disciplina resta identica e altrettanto verificabile: ogni task di conversione si controlla **prima in metrico** (nessuna differenza visibile, salvo quella dichiarata nel contratto per le liste POTA/SOTA oltre i 100 km) **poi in imperiale**.

---

## Rischi noti

| Rischio | Come lo si contiene |
|---|---|
| Un sito di formattazione sfugge al censimento e resta metrico per sempre | Al termine della convergenza, `grep` di controllo su `km'`/`} m'` in `lib/` deve restituire **zero** occorrenze fuori da `unit_format_helper.dart`. È un criterio meccanico, non un'ispezione a occhio. |
| I layout tablet divergono da quelli mobile | Metà dei siti sta nei `*_tablet.dart`; ogni schermata toccata va aperta in entrambi i layout (Costituzione V). |
| Le soglie arrotondate per difetto (FR-016) vengono scritte a mano in un punto e calcolate in un altro | Una sola funzione `UnitFormat.threshold(...)` le produce; nessun letterale di soglia nei testi. |
| Le 15 lingue restano indietro | `flutter gen-l10n` deve chiudere con **zero** "untranslated message(s)" — già una regola di CLAUDE.md. |
