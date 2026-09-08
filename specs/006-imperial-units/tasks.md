---
description: "Task list for 006-imperial-units"
---

# Tasks: Sistema di misura imperiale (miglia e piedi)

**Input**: Documenti di progetto in `/specs/006-imperial-units/`
**Prerequisiti**: [plan.md](./plan.md), [spec.md](./spec.md), [research.md](./research.md), [data-model.md](./data-model.md), [contracts/unit_format_contract.md](./contracts/unit_format_contract.md)

**Test**: la spec richiede esplicitamente una verifica automatica (SC-006 e FR-004), quindi due task di test sono **obbligatori** e stanno nella fase fondamentale. Nessun altro test è previsto.

## Format: `[ID] [P?] [Story] Descrizione`

- **[P]**: eseguibile in parallelo (file diversi, nessuna dipendenza da task incompleti)
- **[Story]**: user story di appartenenza (US1, US2, US3)

## Come si verifica ogni task di conversione

Regola unica, valida per **tutti** i task delle fasi 3–5 (applicazione per file della decisione D6):

1. Aprire la schermata con preferenza **Metrico**: nulla deve cambiare rispetto a prima — con la sola eccezione dichiarata nel contratto (liste POTA/SOTA oltre i 100 km passano da `112 km` a `112.0 km`).
2. Aprire la stessa schermata con preferenza **Imperiale**: ogni valore in miglia/piedi.
3. Se il file ha un gemello `*_tablet.dart`, ripetere entrambi i passi sul tablet (Costituzione V).

## Esclusione da non violare

`lib/src/features/repeaters/presentation/detail/widgets/frequency_fun_facts_section.dart:198` formatta una **lunghezza d'onda** in metri. È una lunghezza, è in metri, ed è l'unico sito di tutto il censimento che **non va convertito**: è il nome della banda, che un americano pronuncia "two meters" esattamente come un italiano dice "due metri" (FR-006).

---

## Phase 1: Setup

**Scopo**: rendere attribuibile ogni fallimento successivo.

- [X] T001 Registrare la baseline verde del progetto eseguendo `flutter analyze`, `flutter test` e `flutter gen-l10n` dalla radice del repository, annotando in `specs/006-imperial-units/` l'esito iniziale (in particolare il numero di `untranslated message(s)`, che deve essere zero prima di iniziare)

---

## Phase 2: Foundational (prerequisito bloccante di TUTTE le storie)

**Scopo**: la preferenza esiste, si risolve, raggiunge ogni widget e sa formattare. Al termine di questa fase **nulla è cambiato a schermo**: nessuna superficie è ancora stata convertita.

- [X] T002 [P] Definire gli enum `UnitSystem { auto, metric, imperial }` e `MeasuredQuantity { distance, elevation }` in `lib/common/utils/unit_system.dart`
- [X] T003 Implementare `UnitFormat` (metodi `distance`, `elevation`, `threshold`, `presetRadius`) in `lib/common/utils/unit_format_helper.dart` seguendo `contracts/unit_format_contract.md`: fattori esatti `1 mi = 1609.344 m` e `1 ft = 0.3048 m`, confronto di soglia sul valore **già arrotondato** (`round(m) < 1000`, `round(ft) < 5280`), `NumberFormat` memoizzato per coppia (locale, sistema), `assert` che rifiuta `UnitSystem.auto`
- [X] T004 [P] Scrivere `test/unit_format_test.dart` trascrivendo **tutte** le tabelle di `contracts/unit_format_contract.md` (distanze, quote, soglie, preset, separatore decimale `en` vs `it`) — è il criterio di accettazione SC-006
- [X] T005 Creare `UnitSystemNotifier` in `lib/src/features/profile/provider/unit_system_notifier/unit_system_notifier.dart` come copia conforme di `theme_mode_notifier.dart`: `@Riverpod(keepAlive: true)`, chiave `unit_system` su `SharedPrefStorageClient`, chiave assente o valore sconosciuto → `UnitSystem.auto`; poi eseguire `dart run build_runner build --delete-conflicting-outputs`
- [X] T006 Implementare la risoluzione di `auto` dentro `unit_system_notifier.dart` leggendo `WidgetsBinding.instance.platformDispatcher.locale.countryCode` — `US`, `LR`, `MM` → imperiale, tutto il resto (incluso `null`) → metrico; il valore risolto NON viene mai persistito
- [X] T007 [P] Creare l'`InheritedWidget` `UnitSystemScope` in `lib/common/widgets/units/unit_system_scope.dart`, che espone il sistema **già risolto** (mai `auto`) e la `Locale` attiva, con `updateShouldNotify` su entrambi
- [X] T008 Creare l'estensione `context.units` in `lib/common/extension/unit_system_extension.dart`, modellata su `l10n_extension.dart`, con i metodi `distance`, `elevation`, `threshold`, `presetRadius` che inoltrano a `UnitFormat` completando sistema e locale dallo scope
- [X] T009 Collegare il tutto in `lib/src/app.dart`: `ref.watch(unitSystemProvider)`, installazione di `UnitSystemScope` nel `builder` di `MaterialApp.router` (sopra tutte le rotte) e `WidgetsBindingObserver.didChangeLocales` su `_HamQRGState` che invalida il provider quando cambia la regione di sistema
- [X] T010 Scrivere `test/unit_system_scope_test.dart`: cambiando il valore del provider, un widget discendente che legge `context.units` si ricostruisce e mostra la nuova unità senza riavvio (verifica FR-004 / SC-003)

**Checkpoint**: `flutter analyze` pulito, i due test passano, l'app si avvia identica a prima.

---

## Phase 3: User Story 1 — L'app parla imperiale da sola (P1) 🎯 MVP

**Obiettivo**: un utente con dispositivo su regione Stati Uniti legge miglia e piedi su tutte le superfici principali senza aprire alcuna impostazione.

**Test indipendente**: dispositivo con regione USA, installazione pulita, percorso lista ripetitori → dettaglio → spot POTA → spot SOTA → dashboard: nessun `km` né `m`. Ripetuto con regione Italia: nessun `mi` né `ft`.

- [X] T011 [US1] Sostituire `_formatDistance` con `context.units.distance(...)` in `lib/src/features/repeaters/presentation/widgets/repeater_card.dart` (2 siti) e rimuovere l'helper privato
- [X] T012 [P] [US1] Idem in `lib/src/features/repeaters/presentation/list/repeaters_list_tablet.dart` (2 siti)
- [X] T013 [P] [US1] Spostare su `context.units.distance(...)` i quattro chiamanti di `RepeaterFormatHelper.formatDistance`: `repeaters/presentation/widgets/sheet/repeater_details_sheet/repeater_details_sheet.dart`, `repeaters/presentation/detail/widgets/location_section.dart`, `repeaters/presentation/distance_map/repeater_detail_map_page.dart`, `dashboard/presentation/dashboard_page/dashboard_page.dart`
- [X] T014 [P] [US1] Idem in `lib/src/features/dashboard/presentation/dashboard_page/dashboard_tablet.dart` (2 siti) e rimuovere l'helper privato duplicato
- [X] T015 [P] [US1] Idem in `lib/src/features/pota/presentation/pota_spots_page/widgets/pota_spot_list_item.dart` (3 siti)
- [X] T016 [P] [US1] Idem in `lib/src/features/pota/presentation/pota_spot_detail_page/pota_spot_detail_page.dart` (3 siti) e `.../widgets/pota_park_info_section.dart` (3 siti)
- [X] T017 [P] [US1] Idem in `lib/src/features/sota/presentation/sota_spots_page/widgets/sota_spot_list_item.dart` (3 siti) e `.../widgets/sota_altitude_badge.dart`
- [X] T018 [P] [US1] Convertire `lib/src/features/sota/presentation/sota_spot_detail_page/sota_spot_detail_page.dart` (4 siti), usando per la quota il valore nativo `summit.altitudeFt` quando il sistema è imperiale invece di riconvertire i metri (FR-011)
- [X] T019 [P] [US1] Idem in `lib/src/features/sota/presentation/sota_spot_detail_page/sota_spot_detail_tablet.dart` (6 siti) e `.../widgets/summit_card.dart` (3 siti) — stessa regola FR-011 per la quota
- [X] T020 [US1] Rimuovere `RepeaterFormatHelper.formatDistance` da `lib/common/utils/repeater_format_helper.dart` insieme al testo inglese hardcoded `'... away'`, verificando che non resti alcun chiamante
- [X] T021 [US1] Ristrutturare in **tutti e 15** i file `lib/l10n/app_*.arb` le chiavi di questa storia. **Portata effettiva**: `sotaAltitudeMeters` non è stata parametrizzata ma **rimossa** — con la quota che ora esce da `context.units`, la chiave non ha più chiamanti, e una chiave `"{altitude}"` sarebbe stata un guscio vuoto in 15 lingue. `reachDistanceFromHere` e `reachReachableDetail` sono state spostate a T032: i loro chiamanti vivono in US3, e cambiarle qui avrebbe rotto l'indipendenza delle due storie
- [ ] T022 [US1] Verifica di storia: percorso completo in Metrico (nessuna differenza) e in Imperiale, su layout mobile **e** tablet

**Checkpoint**: la lamentela degli utenti americani è risolta sulle superfici che usano ogni giorno. La feature è rilasciabile qui.

---

## Phase 4: User Story 2 — Scegliere il proprio sistema (P2)

**Obiettivo**: il controllo esplicito, per chi la regione del dispositivo non rappresenta.

**Test indipendente**: da Automatico a Imperiale e ritorno; le schermate già aperte si aggiornano senza riavvio e la scelta sopravvive alla chiusura completa dell'app.

- [X] T023 [US2] Aggiungere in **tutti e 15** i file `lib/l10n/app_*.arb` le nuove chiavi `profileUnitSystem`, `profileUnitSystemAuto`, `profileUnitSystemMetric`, `profileUnitSystemImperial` (chiavi in inglese camelCase, valori tradotti in ciascuna lingua) e rieseguire `flutter gen-l10n`
- [X] T024 [US2] Inserire il selettore in `lib/src/features/profile/presentation/user_settings/user_settings_screen.dart` subito sotto il blocco Lingua, usando lo stesso `SegmentedButton` a scelta unica del selettore di tema (non il picker modale della lingua: le opzioni sono tre — FR-014)
- [X] T025 [P] [US2] Inserire lo stesso selettore in `lib/src/features/profile/presentation/profile/unregistered_profile_screen.dart`, accanto alla voce Lingua già presente: è la schermata dell'utente anonimo, cioè di chi ha appena installato l'app ed è il più probabile a dover correggere il default (FR-003 + FR-014)
- [ ] T026 [US2] Verifica di storia: persistenza dopo chiusura completa, prevalenza della scelta esplicita sulla regione, aggiornamento immediato di una schermata già aperta al ritorno indietro, comportamento identico da utente anonimo, su mobile **e** tablet

**Checkpoint**: il default automatico ha la sua valvola di sicurezza.

---

## Phase 5: User Story 3 — Nessuna superficie resta indietro (P3)

**Obiettivo**: le superfici tecniche e secondarie parlano lo stesso sistema di tutto il resto.

**Test indipendente**: con preferenza Imperiale si aprono una per una le superfici dell'elenco; ogni grandezza convertibile è in unità imperiali, comprese le etichette degli assi e le voci dei selettori a preset.

- [X] T027 [US3] Convertire `lib/common/widgets/altimetric_profile_chart.dart` (5 siti): etichette di quota partenza/arrivo, distanza totale, etichette dell'asse X e tooltip a due righe
- [X] T028 [P] [US3] Convertire `lib/src/features/repeaters/presentation/reachable/widgets/link_profile_chart.dart` (distanza + azimut: l'azimut in gradi resta invariato) e `.../repeater_reach_badge.dart`, incluso il mock sfocato `'-•• dBm · •• km'`, il cui simbolo di unità deve seguire la preferenza mentre i valori restano mascherati
- [X] T029 [P] [US3] Convertire le superfici di ricerca copertura: `coverage_search/presentation/widgets/range_selector.dart`, `.../breadth_selector.dart`, `.../coverage_result_sheet.dart`, `.../coverage_teaser.dart`, `.../save_station_sheet.dart`, usando `context.units.presetRadius(...)` per i preset — `SearchBreadth.radiusKm` NON cambia valore (FR-009)
- [X] T030 [P] [US3] Convertire `offline_maps/presentation/add_offline_region_sheet/add_offline_region_sheet.dart` (chip dei raggi 10/25/50 km) e `offline_maps/presentation/offline_maps_page/offline_maps_page.dart` (sottotitolo regione), lasciando invariata la dimensione in byte formattata da `BytesFormatHelper` (FR-006)
- [X] T031 [US3] Riscrivere i testi con soglia usando `context.units.threshold(...)`: `repeaters/presentation/detail/controller/repeater_detail_controller.dart:281` — dove va **anche localizzata** la stringa inglese hardcoded `'You must be within ... km ...'`, oggi in violazione di CLAUDE.md — e `repeaters/presentation/detail/widgets/community/feedback_form_card.dart`
- [X] T032 [US3] Ristrutturare in **tutti e 15** i file `lib/l10n/app_*.arb` le chiavi rimanenti perché il placeholder porti l'unità: `repeaterDetailDistanceWarning`, `feedbackDistanceConfirmMessage`, `sotaLosObstructionAt`, `linkProfileCaption`, `coverageBreadthQuickHint`/`MediumHint`/`ExtendedHint` (il numero esce dal testo tradotto e diventa parametro), `coverageResultScope`, `offlineMapsRegionSubtitle`, `stationDuplicateBody`; poi `flutter gen-l10n` con zero `untranslated message(s)`
- [X] T033 [US3] Verificare che una postazione salvata creata in Metrico si legga correttamente in Imperiale **offline**, senza rigenerazione né riscaricamento (FR-010), e che `saved_station_model` continui a serializzare `'km'` invariato
- [ ] T034 [US3] Verifica di storia: profilo altimetrico, selettori a preset, avvisi di soglia, mappe offline e postazioni salvate, in entrambi i sistemi e su entrambi i layout

**Checkpoint**: nessuna superficie dell'app contraddice più la preferenza.

---

## Phase 6: Polish & controlli trasversali

- [X] T035 Controllo meccanico di copertura (criterio di SC-002): il comando seguente deve restituire **zero** righe, eccetto `frequency_fun_facts_section.dart:198` che è la lunghezza d'onda esclusa da FR-006 —
  ```bash
  grep -rnE "\} ?(km|m|ft|mi)'| (km|m|ft|mi)'" lib --include="*.dart" \
    | grep -vE "\.g\.dart|\.freezed\.dart|unit_format_helper\.dart"
  ```
- [X] T036 [P] Verificare che nessuna chiave in `lib/l10n/app_*.arb` contenga più un'unità di misura nel testo tradotto (`grep -nE '\{[a-zA-Z]+\} ?(km|m|mi|ft)\b' lib/l10n/*.arb` a zero risultati)
- [X] T037 [P] Verificare che FR-006 sia rimasto intatto: `RepeaterFormatHelper` (frequenze, shift, CTCSS) e `BytesFormatHelper` non conoscono `UnitSystem`, dBm e azimut invariati, lunghezza d'onda invariata
- [X] T038 Verificare FR-008 in modo diretto: la stessa lista ordinata per distanza ha lo stesso ordine nei due sistemi, e nessuna soglia cambia verdetto
- [X] T039 `flutter analyze` a zero warning, `dart format lib test` senza modifiche, `flutter test` verde, `flutter gen-l10n` a zero `untranslated message(s)`
- [X] T040 Aggiornare `CLAUDE.md` con la regola operativa permanente: le distanze e le quote si scrivono **solo** tramite `context.units`, e nessun file fuori da `unit_format_helper.dart` contiene un simbolo di unità in una stringa

---

## Dipendenze

```
Phase 1 (T001)
   └─> Phase 2 Foundational (T002 → T003 → T004, T005 → T006, T007 → T008 → T009 → T010)
          ├─> Phase 3  US1  (T011…T022)   ← MVP, rilasciabile da solo
          ├─> Phase 4  US2  (T023…T026)   ← indipendente da US1
          └─> Phase 5  US3  (T027…T034)   ← indipendente da US1 e US2
                 └─> Phase 6 Polish (T035…T040)
```

- **La fase 2 blocca tutto**: senza scope e formattatore, nessuna conversione è possibile.
- **Le tre storie sono indipendenti fra loro.** US2 non ha bisogno che le superfici siano convertite (il selettore funziona anche se converte poco), e US3 non ha bisogno del selettore (basta cambiare la regione del dispositivo per provarla). L'ordine è di priorità, non di dipendenza.
- Dentro la fase 2, T003 dipende da T002; T004 da T003; T006 da T005; T008 da T007; T009 da T005+T008; T010 da T009.
- Dentro US1, T020 richiede che T013 abbia spostato tutti i chiamanti. T021 è indipendente dai task di codice e può procedere in parallelo.

## Esecuzione in parallelo

**Fase 2** — due catene indipendenti: `T002 → T003 → T004` (formattatore) e `T005 → T006` (stato), che convergono su `T007 → T008 → T009 → T010`.

**US1** — dopo T011, sette task su file disgiunti procedono insieme:

```
T012 (repeaters tablet) | T013 (chiamanti helper) | T014 (dashboard)
T015 (pota lista)       | T016 (pota dettaglio)   | T017 (sota lista)
T018 (sota dettaglio)   | T019 (sota tablet)      | T021 (ARB, 15 file)
```

**US3** — T028, T029, T030 toccano feature diverse e non si incrociano; T032 (ARB) procede in parallelo a tutti.

## Strategia di rilascio

- **MVP = Fase 1 + Fase 2 + US1.** Risolve la lamentela sulle schermate che gli utenti americani usano ogni giorno. È rilasciabile senza US2 e US3: chi ha il dispositivo in regione USA vede miglia, chiunque altro non nota nulla.
- **Incremento 2 = US2.** Il controllo manuale, per i casi in cui la regione mente.
- **Incremento 3 = US3 + Fase 6.** Le superfici tecniche e i controlli meccanici che rendono SC-002 dimostrabile invece che dichiarato.

## Stato di esecuzione (2026-09-08)

**37 task su 40 completati.** `flutter analyze` pulito (resta solo il warning
preesistente sui plugin legacy dell'analizzatore), 428 test verdi contro i 407
della baseline, `flutter gen-l10n` a zero `untranslated message(s)`.
Pubblicato su TestFlight come **1.3.0+53** con la lane `beta_internal`.

I tre task aperti — **T022, T026, T034** — sono verifiche visive su
dispositivo: richiedono di aprire le schermate su un telefono e un tablet, in
metrico e in imperiale. Non sono state eseguite qui e restano da fare sulla
build TestFlight appena caricata. Tutto ciò che era verificabile in modo
meccanico al posto loro è stato verificato: il controllo di copertura T035 non
trova più alcun sito, T036 conferma che nessuna chiave ARB contiene un'unità,
T038 verifica come proprietà che nessuna soglia dichiarata sia più larga di
quella reale.

Scostamenti rispetto al piano, tutti annotati nei task interessati:

- **T021** ha rimosso `sotaAltitudeMeters` invece di parametrizzarla, e ha
  ceduto due chiavi a T032 per non rompere l'indipendenza fra le storie.
- Le superfici SOTA mostravano **già** entrambe le unità (`1.240 m · 4.068 ft`).
  Invece di scartarne una, la preferenza decide quale delle due è in evidenza:
  nessuna informazione persa, e il numero ufficiale della cima resta quello
  nativo della sorgente (FR-011).
- **T031** ha trasformato la stringa inglese di `repeater_detail_controller`
  in uno `StateError` di programmazione anziché localizzarla: la UI impedisce
  già quel percorso, quindi non era copy e non doveva sembrarlo.
- Un sito era sfuggito al censimento (`summit_card.dart:328`) ed è stato
  trovato proprio dal controllo meccanico T035 — che è il motivo per cui
  quel controllo esiste.

## Correzioni dopo la prima build (2026-09-08)

Le verifiche visive T022/T026/T034 hanno cominciato a produrre risultati
appena la build è finita in mano a una persona, ed è esattamente il motivo per
cui erano rimaste aperte. Tre correzioni, nel commit `a241a30`:

1. **Il selettore andava a capo.** Con icona più parola, "Automatico"
   occupava cinque righe su 320 dp. Le etichette sono diventate i simboli
   (`Auto` · `km` · `mi`), con le parole complete come tooltip e per i lettori
   di schermo. `test/unit_system_selector_layout_test.dart` blocca il layout
   su 3 lingue × 3 larghezze × 2 scale di testo.
2. **L'asse Y del profilo altimetrico era rimasto in metri.** Il controllo
   T035 non l'aveva visto: cercava il simbolo attaccato a un valore, e lì era
   una stringa da sola (`'m',`). Il controllo è ora `tool/check_units.py`,
   cerca entrambe le forme e tiene un elenco di eccezioni motivate.
3. **Il nome del ripetitore si sovrapponeva all'ultima etichetta di
   distanza** sull'asse X del profilo. Preesistente, non introdotto qui, ma
   nel perimetro: ora il nome ha un tetto con ellissi e il tick regolare oltre
   l'85% della tratta viene soppresso.

La seconda ha una morale che vale oltre questa feature: un controllo
meccanico vale quanto il pattern che cerca, e il modo per accorgersene è
guardare l'app. Il primo `grep` di T035 dava zero risultati **mentre** l'asse
Y era ancora sbagliato.

**Mapbox** non richiede alcuna conversione: la scala grafica è disattivata su
tutte e quattro le mappe (`ScaleBarSettings(enabled: false)`), quindi non
esiste una superficie di terze parti che possa contraddire la preferenza.

## Riepilogo

| Fase | Task | Contenuto |
|---|---|---|
| 1 Setup | 1 | T001 |
| 2 Foundational | 9 | T002–T010 |
| 3 US1 (P1) | 12 | T011–T022 |
| 4 US2 (P2) | 4 | T023–T026 |
| 5 US3 (P3) | 8 | T027–T034 |
| 6 Polish | 6 | T035–T040 |
| **Totale** | **40** | |
