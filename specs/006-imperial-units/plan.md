# Implementation Plan: Sistema di misura imperiale (miglia e piedi)

**Branch**: `006-imperial-units` | **Date**: 2026-09-08 | **Spec**: [spec.md](./spec.md)
**Input**: Feature specification from `/specs/006-imperial-units/spec.md`

## Summary

Introdurre una preferenza a tre stati (Automatico / Metrico / Imperiale) e far sì che **ogni** distanza e quota mostrata dall'app la rispetti, senza toccare nulla di ciò che l'app calcola, salva, ordina o confronta.

L'ostacolo reale non è la conversione — sono tre moltiplicazioni — ma la **dispersione**: oggi la formattazione delle distanze è duplicata in **9 metodi `_formatDistance` privati** e ~48 punti di interpolazione sparsi in 20 file, ciascuno con la propria regola (alcuni passano ai metri sotto 1 km, altri no; alcuni perdono il decimale sopra i 10 km, altri sopra i 100, altri mai). Con quella dispersione intatta, SC-002 (copertura 100%) non è raggiungibile in modo affidabile: ogni punto dimenticato resta metrico per sempre e nessun test lo nota.

L'approccio è quindi in due movimenti:

1. **Convergere prima di convertire.** Un unico formattatore puro (`UnitFormat`) che prende valore canonico + sistema e restituisce la stringa; tutti i 48 siti ci passano attraverso. Questo passo, da solo, è già un miglioramento a parità di comportamento visibile ed è verificabile con una tabella di valori campione (SC-006).
2. **Distribuire la preferenza per contesto, non per parametro.** Un `UnitSystemScope` (InheritedWidget) installato nel `builder` di `MaterialApp.router` e un'estensione `context.units` speculare a `context.localization`. Nessun `ref` da far scendere in `StatelessWidget` e metodi helper privati, e la dipendenza dall'`InheritedWidget` fa ricostruire da sola ogni schermata già montata quando la preferenza cambia — che è esattamente ciò che chiedono FR-004 e SC-003.

Lo stato è un `UnitSystemNotifier` in `profile/provider/`, copia conforme di `ThemeModeNotifier`: stesso `SharedPreferences`, stessa forma, stessa schermata.

## Technical Context

**Language/Version**: Dart 3.x / Flutter 3.x (vincolati da `pubspec.yaml`)
**Primary Dependencies**: `hooks_riverpod ^3.1` con `riverpod_annotation ^4.0`, `shared_preferences ^2.3`, `intl` (già presente, per il separatore decimale), `flutter_localizations` + `gen-l10n` su 15 locale
**Storage**: `SharedPreferences` tramite `SharedPrefStorageClient`, chiave `unit_system`. Nessuna scrittura su Supabase, nessuna migrazione, nessun campo remoto
**Testing**: `flutter test` — test unitari puri per il formattatore (tabella di valori), widget test per la propagazione dello scope. Nessun test di integrazione Supabase: la feature non tocca dati remoti
**Target Platform**: iOS + Android (app mobile già in produzione)
**Project Type**: Mobile app Flutter, progetto singolo
**Performance Goals**: la formattazione avviene in `build`; nessuna allocazione di `NumberFormat` per frame (istanza memoizzata per coppia locale+sistema). Cambio preferenza visibile entro un frame (SC-003)
**Constraints**: zero warning `flutter analyze`; nessuna stringa utente non localizzata; funzionamento identico offline (la preferenza è locale); nessun codice nativo per piattaforma
**Scale/Scope**: ~48 siti di formattazione in 20 file, 9 helper privati duplicati da rimuovere, 14 chiavi ARB da ristrutturare × 15 lingue, 2 schermate di impostazioni, 3 preset di raggio

## Constitution Check

*GATE: verificato prima della Fase 0 e ri-verificato dopo la Fase 1.*

| Principio | Esito | Note |
|---|---|---|
| **I. Clean Architecture** | ✅ Pass | La feature non ha dati remoti, quindi non ha `data/`→`repository/`. Si colloca dove il progetto colloca già le preferenze trasversali: notifier in `profile/provider/unit_system_notifier/` (identico a `locale_notifier` e `theme_mode_notifier`), helper puro in `common/utils/`, estensione in `common/extension/`. Nessuna entità di dominio nuova, nessun `ref` passato dentro le pagine oltre a quanto già avviene. |
| **II. Testing Standards** | ✅ Pass | Test unitari puri sul formattatore (nessun mock necessario: è una funzione). Widget test sulla propagazione dello scope. Nessun test di integrazione richiesto — il principio lo impone "quando la feature tocca dati Supabase", e questa non li tocca. `flutter analyze` e `dart format` restano gate obbligatori. |
| **III. UX Consistency** | ✅ Pass, con debito da saldare | Tutte le nuove stringhe in 15 ARB. **Nel perimetro esiste già una violazione**: `repeater_detail_controller.dart:281` costruisce un messaggio utente in inglese hardcoded (`'You must be within ... km ...'`). Va localizzata contestualmente, perché è uno dei testi con soglia che questa feature deve riscrivere comunque. |
| **IV. Performance & Reliability** | ✅ Pass | Nessuna query, nessun provider di auth toccato, nessun `AsyncValue` di pagina modificato. L'unico rischio è di rendering: `NumberFormat` va memoizzato, non costruito a ogni `build`. |
| **V. Responsive Layout** | ⚠️ Attenzione attiva | Non si aggiungono pagine, ma **la metà dei siti da convertire vive nei layout tablet** (`sota_spot_detail_tablet` 6 siti, `dashboard_tablet` 2, `repeaters_list_tablet` 2, `summit_card` 3), ciascuno con il proprio `_formatDistance` duplicato. È il punto esatto in cui il principio prevede la deriva. Ogni schermata toccata va verificata su entrambi i layout prima della chiusura. |

**Esito**: nessuna violazione da giustificare. La sezione Complexity Tracking resta vuota.

**Ri-verifica dopo la Fase 1**: il design non introduce nulla di nuovo da valutare. Il pezzo con più potere di sorprendere è l'`UnitSystemScope`, che aggiunge un `InheritedWidget` sopra tutte le rotte: non tocca la gerarchia dei layer (I), non ha stato asincrono da gestire (IV) e non aggiunge pagine (V). L'unico debito emerso in Fase 1 è già registrato: la stringa inglese hardcoded in `repeater_detail_controller.dart:281`, che il perimetro impone comunque di riscrivere.

## Project Structure

### Documentation (this feature)

```text
specs/006-imperial-units/
├── plan.md              # Questo file
├── research.md          # Fase 0 — decisioni tecniche e alternative scartate
├── data-model.md        # Fase 1 — entità, stati, regole di conversione
├── quickstart.md        # Fase 1 — come si aggiunge un valore misurato senza sbagliare
├── contracts/
│   └── unit_format_contract.md   # Tabella di output attesa (contratto di SC-006)
├── checklists/
│   └── requirements.md
└── tasks.md             # Fase 2 — creato da /speckit.tasks, NON da questo comando
```

### Source Code (repository root)

```text
lib/
├── common/
│   ├── utils/
│   │   └── unit_format_helper.dart          # NUOVO — formattatore puro, senza Flutter
│   └── extension/
│       ├── l10n_extension.dart              # esistente — modello da imitare
│       └── unit_system_extension.dart       # NUOVO — context.units
├── common/widgets/
│   ├── units/
│   │   └── unit_system_scope.dart           # NUOVO — InheritedWidget
│   └── altimetric_profile_chart.dart        # MOD — assi, etichette, tooltip (5 siti)
├── src/
│   ├── app.dart                             # MOD — installa lo scope + osserva didChangeLocales
│   └── features/
│       ├── profile/
│       │   ├── provider/unit_system_notifier/
│       │   │   └── unit_system_notifier.dart        # NUOVO — copia di theme_mode_notifier
│       │   └── presentation/
│       │       ├── user_settings/user_settings_screen.dart      # MOD — selettore (FR-014)
│       │       └── profile/unregistered_profile_screen.dart     # MOD — selettore (FR-014)
│       ├── repeaters/presentation/           # MOD — card, lista, lista tablet, badge,
│       │                                     #        dettaglio, mappa distanza, link profile
│       ├── sota/presentation/                # MOD — lista, dettaglio, dettaglio tablet, summit card
│       ├── pota/presentation/                # MOD — lista, dettaglio, park info
│       ├── dashboard/presentation/           # MOD — dashboard + dashboard tablet
│       ├── coverage_search/presentation/     # MOD — range selector, result sheet, teaser
│       └── offline_maps/presentation/        # MOD — add region sheet, lista regioni
└── l10n/
    └── app_*.arb                             # MOD — 15 file, 14 chiavi ristrutturate + ~6 nuove

test/
├── unit_format_test.dart                     # NUOVO — tabella SC-006, entrambi i sistemi
└── unit_system_scope_test.dart               # NUOVO — propagazione e rebuild (FR-004)
```

**Structure Decision**: progetto Flutter singolo, struttura esistente. La feature è **trasversale**, non una feature verticale: per questo non nasce una cartella `lib/src/features/units/`. Introdurne una significherebbe creare un `data/`+`domain/`+`presentation/` vuoti attorno a una preferenza booleana, contro il precedente già stabilito da lingua e tema, che vivono entrambi in `profile/provider/`. La sola parte con un'identità propria è il formattatore, che sta in `common/utils/` accanto agli altri helper di formato (`repeater_format_helper`, `bytes_format_helper`) perché è esattamente la stessa categoria di cosa.

## Complexity Tracking

Nessuna violazione costituzionale da giustificare.
