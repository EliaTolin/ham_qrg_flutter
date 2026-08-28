# Contract — Livello di caching e persistenza

Contratto interno fra la feature e i due archivi. È il punto in cui le invarianti di R1 diventano codice.

## Inizializzazione (una sola volta, all'avvio)

```dart
await RemoteCaching.instance.init(
  // Difesa in profondità: se una scrittura dimenticasse la sentinella,
  // sopravviverebbe comunque un anno invece di un'ora.
  defaultCacheDuration: const Duration(days: 365),
  verboseMode: kDebugMode,
);
```

> `init()` esegue `DELETE FROM cache WHERE expires_at < now`. Con la sentinella nessuna voce `repeater:` è mai idonea alla cancellazione.

## Sentinella

```dart
/// Scadenza "infinita": il pacchetto richiede sempre un `expires_at`,
/// quindi si usa una data irraggiungibile. NON sostituire con una Duration.
final kNeverExpires = DateTime.utc(9999, 12, 31);
```

## Chiavi

| Prefisso | Contenuto | Scadenza |
|---|---|---|
| `repeater:v1:<id>` | `CachedRepeaterModel` | `kNeverExpires` |

Nessun altro prefisso appartiene a questa feature. Se altre feature adotteranno `remote_caching`, useranno prefissi propri e invalideranno **solo i propri** con `clearCacheByPrefix`.

## Invarianti (violarle rompe FR-051)

- **INV-1 — mai `clearCache()`.** Svuota l'intera tabella e distruggerebbe l'offline di ogni postazione. Per invalidare un dominio si usa `clearCacheByPrefix('<prefisso>:')`.
- **INV-2 — ogni scrittura `repeater:` porta `kNeverExpires`.** Garantita strutturalmente: esiste **un solo** metodo che scrive quel prefisso, e la scadenza non è un suo parametro.

## Interfaccia

```dart
abstract class RepeaterCacheDatasource {
  /// Lettura locale pura: non tocca mai la rete (la voce non scade mai,
  /// quindi cacheFirst restituisce sempre la copia locale).
  /// Usata per rendere una postazione salvata, online o offline.
  Future<CachedRepeater?> readCached(String repeaterId);

  /// Lettura fresca con fallback offline automatico.
  /// Online: rete → riscrive la voce (aggiornamento indiretto, R5).
  /// Offline: restituisce la copia conservata.
  Future<Repeater> readFresh(String repeaterId, {required Future<Repeater> Function() remote});

  /// Write-through al salvataggio di una postazione: rende la postazione
  /// autosufficiente dal primo istante, senza dipendere da visite precedenti.
  Future<void> writeAll(List<Repeater> repeaters);
}
```

| Metodo | Strategia | Rete |
|---|---|---|
| `readCached` | `cacheFirst` + sentinella | mai |
| `readFresh` | `networkFirst` + sentinella | sì, con fallback su cache |
| `writeAll` | scrittura diretta | no |

`readCached` restituisce `null` invece di lanciare: una voce mancante degrada quel singolo ripetitore (`missingIds`), non l'intera postazione.

## Punto di aggancio dell'aggiornamento indiretto

`getRepeaterByIdProvider` (già esistente, usato da ogni scheda ripetitore dell'app) passa da chiamata diretta al repository a `readFresh`. È l'unica modifica necessaria perché lo scenario "apro X a febbraio, la postazione di ottobre si aggiorna da sola" funzioni.

## Archivio delle postazioni (`StorageClient`)

```dart
abstract class SavedStationsDatasource {
  Future<List<String>> readIndex();
  Future<SavedStationModel?> read(String id);
  Future<void> write(SavedStationModel station);   // aggiorna anche l'indice
  Future<void> delete(String id);                  // solo su azione esplicita (FR-051)
}
```

`write` è la sola operazione che può fallire per spazio esaurito (FR-049): scrive prima il record, poi l'indice — così un fallimento non lascia un ID orfano nell'indice. Non tenta **mai** di liberare spazio rimuovendo postazioni esistenti.
