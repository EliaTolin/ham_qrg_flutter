# Quickstart — Ricerca località / punto libero con ricezione stimata (Pro)

Da leggere prima di scrivere la prima riga. Le tre cose che si sbagliano più facilmente sono in fondo.

## 1. Dipendenze

```bash
flutter pub add remote_caching   # ^1.0.19 — pacchetto interno, sorgente in ~/Desktop/Aurora/Progetti/remote_caching
```

Nient'altro: `dio`, `shared_preferences`, `geolocator`, `mapbox_maps_flutter` sono già presenti. La geocodifica usa `dio` con il token Mapbox già configurato; l'analytics usa il client Supabase già configurato.

## 2. Inizializzazione

In `main.dart`, prima di `runApp`:

```dart
await RemoteCaching.instance.init(
  defaultCacheDuration: const Duration(days: 365), // difesa in profondità, non la scadenza reale
  verboseMode: kDebugMode,
);
```

## 3. Backend

Migrazione `analytics_events` nel repo `ham_qrg_supabase` — schema e policy RLS in [contracts/analytics-events.md](contracts/analytics-events.md). Va applicata **prima** di strumentare il client, altrimenti ogni `track()` fallisce in silenzio e la misurazione risulta vuota senza che nessuno se ne accorga.

## 4. Ordine di lavoro consigliato

L'ordine segue le priorità della spec e mantiene ogni passo verificabile a sé.

1. **Livello di cache** (`RepeaterCacheDatasource`) + aggancio di `getRepeaterByIdProvider`. Si verifica da subito: apri una scheda ripetitore, metti il dispositivo in modalità aereo, riaprila — deve mostrarsi comunque.
2. **Punto di ricerca**: parser coordinate, geocodifica, barra e pin sulla mappa, `LongTapInteraction`. Funziona per tutti gli utenti (FR-011).
3. **Valutazione Pro**: riuso di `getReachableRepeatersProvider` con il punto e il livello di ampiezza.
4. **Teaser non Pro** + strumentazione del funnel, inclusa quella delle due superfici esistenti.
5. **Postazioni salvate**: archivio, write-through, refresh singolo e massivo.
6. **Lista postazioni** + vetrina.
7. **Layout tablet** per tutte le schermate introdotte.
8. **Localizzazione**: chiavi in `app_it.arb` e traduzione in tutte e 15 le lingue.

## 5. Comandi

```bash
dart run build_runner build --delete-conflicting-outputs   # dopo ogni @freezed / @riverpod
flutter gen-l10n                                           # deve dire 0 untranslated message(s)
flutter analyze                                            # zero warning
dart format lib test
flutter test                                               # unit + integration
flutter test --tags integration                            # solo integration
```

## 6. Verifiche manuali che i test non coprono

| Cosa | Come |
|---|---|
| Offline reale (SC-004) | Salva una postazione, modalità aereo, riapri: lista completa con frequenze, toni e parametri DMR |
| Aggiornamento indiretto (R5) | Salva una postazione → apri la scheda di un suo ripetitore dalla lista → riapri la postazione: quel ripetitore mostra la data nuova |
| Filtro come lente (SC-019) | Salva con un filtro di modo attivo → offline, rimuovi il filtro: compaiono i ripetitori degli altri modi |
| Zero chiamate da non Pro (SC-008) | Sessione completa con account non Pro, ispezionando il traffico: nessuna richiesta al servizio di copertura |
| Ritorno post-acquisto (SC-010) | Compra dal teaser: si torna sul pin, il calcolo reale parte da solo |
| Tablet (SC-011) | 4 combinazioni dimensione/orientamento, nessun contenuto troncato |

## 7. I tre errori facili

**Non passare `accessModes` al calcolo.** `getRepeatersNearby` lo accetta e sembra la cosa giusta da fare quando l'utente ha un filtro attivo. Ma FR-027 impone che calcolo e salvataggio comprendano sempre tutti i modi: il filtro si applica **solo** in presentazione. Sbagliarlo produce postazioni salvate mutilate in modo irreversibile, e il bug si manifesta mesi dopo, in campo, quando l'utente toglie il filtro e non trova niente.

**Non chiamare mai `RemoteCaching.instance.clearCache()`.** Svuota l'intera tabella e con essa l'offline di ogni postazione salvata (INV-1). Se serve invalidare qualcosa, `clearCacheByPrefix` sul prefisso di quel dominio.

**Non scrivere una voce `repeater:` senza la sentinella.** Una sola scrittura con la durata di default la rende cancellabile al riavvio successivo, bucando l'offline di ogni postazione che contiene quel ripetitore. Per questo esiste un solo metodo di scrittura e la scadenza non è un suo parametro.
