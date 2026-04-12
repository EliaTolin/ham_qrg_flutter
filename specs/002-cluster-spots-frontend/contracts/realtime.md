# Contract — Realtime Channels (Flutter Client)

**Feature**: 002-cluster-spots-frontend
**Date**: 2026-04-12

> Pattern Realtime per l'app Flutter. Questo è il primo uso di Supabase Realtime nel progetto. I contratti server-side sono documentati in `ham_qrg_supabase/specs/001-cluster-spots/contracts/realtime.md`.

---

## 1. Channel Topology

| Context | Channel name | Filter | Lifecycle | Used by |
|---------|-------------|--------|-----------|---------|
| Scheda dettaglio ponte | `spots:repeater:{repeaterId}` | `repeater_id=eq.{repeaterId}` | Aperto su mount pagina, chiuso su dispose | `ActiveSpotsNotifier` |
| "Ultimi spot" (dashboard tab + full-screen) | `spots:global` | _(no filter)_ | Aperto su mount sezione, chiuso su dispose | `RecentSpotsNotifier` |
| Spot personale dell'utente | `spots:user:{userId}` | `user_id=eq.{userId}` | Aperto post-login, chiuso al logout (keepAlive) | `MyActiveSpotNotifier` |

---

## 2. Riverpod Notifier Pattern

Ogni notifier che gestisce Realtime segue questo pattern:

```dart
@riverpod
class ActiveSpotsNotifier extends _$ActiveSpotsNotifier {
  RealtimeChannel? _channel;

  @override
  FutureOr<List<RepeaterSpot>> build(String repeaterId) async {
    // 1. Initial load via REST
    final spots = await ref.read(spotsRepositoryProvider).getActiveSpotsForRepeater(repeaterId);

    // 2. Setup Realtime subscription
    _channel = ref.read(supabaseClientProvider).channel('spots:repeater:$repeaterId')
      ..onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: 'repeater_spots',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'repeater_id',
          value: repeaterId,
        ),
        callback: _onRealtimeEvent,
      )
      ..subscribe();

    // 3. Cleanup on dispose
    ref.onDispose(() {
      _channel?.unsubscribe();
    });

    return spots;
  }

  Future<void> _onRealtimeEvent(PostgresChangePayload payload) async {
    // Re-fetch enriched spot and update state
    // (payload contains only raw columns, no joins)
  }
}
```

---

## 3. Event Handling

| Event | Interpretation | Client Action |
|-------|---------------|---------------|
| `INSERT` con `spotted_callsign IS NULL` | Nuovo self-spot | Aggiungere a "Spot attivi" (se repeater channel) e "Ultimi spot" (se global channel). Aggiornare set indicatori mappa/card. |
| `INSERT` con `spotted_callsign IS NOT NULL` | Nuovo other-spot | Aggiungere SOLO a "Ultimi spot". NON aggiungere a "Spot attivi". |
| `UPDATE` con `closed_at: null → not null` | Chiusura (manuale o sostituzione) | Rimuovere da "Spot attivi". Aggiornare badge in "Ultimi spot". Sul canale `spots:user:{me}`: mostrare toast. Aggiornare indicatori mappa/card. |
| `DELETE` | Hard delete (cascade raro) | Rimuovere silenziosamente dalla UI. |

**Stato `expired`**: nessun evento server. Il client ricalcola localmente confrontando `expires_at` con `DateTime.now()` via tick periodico (1s nel widget countdown).

---

## 4. Re-fetch After Event

Il payload Realtime contiene solo le colonne di `repeater_spots` (no join data). Dopo ogni evento:

1. Estrarre `id` da `payload.newRecord` (o `payload.oldRecord` per DELETE).
2. Se INSERT o UPDATE: fare una query REST arricchita con join (`profiles`, `repeaters`, `repeater_access`).
3. Se DELETE: rimuovere direttamente dalla lista locale per ID.
4. Applicare al state del notifier.

---

## 5. Reconnection Strategy

Supabase Realtime riconnette automaticamente con backoff esponenziale. Gli eventi persi durante la disconnessione NON vengono replayati.

**Azione client**: al primo evento di riconnessione (o al cambio di status del canale), eseguire un refresh completo via REST per riallineare lo stato. Pattern:

```dart
// Nel notifier, ascoltare lo status del canale
_channel?.onSubscribe((status, error) {
  if (status == RealtimeSubscribeStatus.channelError ||
      status == RealtimeSubscribeStatus.timedOut) {
    // Re-fetch completo
    _refreshFromRest();
  }
});
```

---

## 6. Lifecycle Rules

- **Canali per-pagina** (`spots:repeater:{id}`, `spots:global`): aperti nel `build()` del notifier, chiusi in `ref.onDispose()`. Il notifier viene invalidato/disposto quando la pagina esce dallo stack.
- **Canale personale** (`spots:user:{userId}`): il notifier è `@Riverpod(keepAlive: true)`. Creato dopo il login (nel splash/home controller), invalidato al logout.
- **Nessun canale se non autenticato**: i canali richiedono JWT valido. Il canale personale non viene creato per utenti anonimi (non possono creare spot).
