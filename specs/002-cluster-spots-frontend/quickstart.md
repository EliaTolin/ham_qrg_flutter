# Quickstart — Cluster Spots Frontend

**Feature**: 002-cluster-spots-frontend
**Date**: 2026-04-12

Guida rapida per implementare la feature Cluster Spots nell'app Flutter. Ogni sezione corrisponde a una User Story della spec.

---

## 1. Prerequisiti

```bash
# Assicurarsi che il backend sia aggiornato (migrations applicate)
# Nel repo ham_qrg_supabase:
supabase db reset

# Nel repo ham_qrg_flutter:
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

**Dipendenze necessarie**: `supabase_flutter` (già presente), nessuna nuova dipendenza da aggiungere al `pubspec.yaml`.

---

## 2. Recipe — US1: Spottarsi (self-spot)

### Flow

1. Utente tocca "Spottati" nella scheda ponte.
2. Bottom sheet con chip durate (5, 15, 30, 60 min) + dropdown access opzionale.
3. Conferma → Edge Function `create-spot`.
4. Successo → refresh indicatore personale + sezione "Spot attivi".

### Datasource call

```dart
Future<SpotModel> createSelfSpot({
  required String repeaterId,
  required int durationMinutes,
  String? accessId,
}) async {
  final response = await _client.functions.invoke('create-spot', body: {
    'repeater_id': repeaterId,
    'duration_minutes': durationMinutes,
    if (accessId != null) 'access_id': accessId,
  });

  if (response.status != 201) {
    final error = (response.data as Map<String, dynamic>)['error'] as String? ?? 'UNKNOWN';
    throw SpotError.fromCode(error);
  }

  return SpotModel.fromJson(
    (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
  );
}
```

### Error mapping (i18n)

| Code | Chiave i18n | Messaggio IT |
|------|-------------|-------------|
| `AUTH_REQUIRED` | `spotErrorAuthRequired` | "Devi effettuare l'accesso." |
| `CALLSIGN_REQUIRED` | `spotErrorCallsignRequired` | "Imposta il tuo callsign nel profilo per usare il cluster." |
| `INVALID_DURATION` | `spotErrorInvalidDuration` | "La durata deve essere tra 5 e 60 minuti." |
| `REPEATER_NOT_FOUND` | `spotErrorRepeaterNotFound` | "Ponte non trovato." |
| `INVALID_ACCESS` | `spotErrorInvalidAccess` | "Modalità di accesso non valida per questo ponte." |

---

## 3. Recipe — US1b: Spottare un altro OM (other-spot)

### Datasource call

```dart
Future<SpotModel> createOtherSpot({
  required String repeaterId,
  required String spottedCallsign,
  String? accessId,
}) async {
  final response = await _client.functions.invoke('create-spot', body: {
    'repeater_id': repeaterId,
    'spotted_callsign': spottedCallsign,
    if (accessId != null) 'access_id': accessId,
    // NO duration_minutes for other-spot
  });

  if (response.status != 201) {
    final error = (response.data as Map<String, dynamic>)['error'] as String? ?? 'UNKNOWN';
    throw SpotError.fromCode(error);
  }

  return SpotModel.fromJson(
    (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
  );
}
```

---

## 4. Recipe — US2: Spot attivi su scheda ponte

### REST query (initial load)

```dart
Future<List<SpotModel>> getActiveSpotsForRepeater(String repeaterId) async {
  final rows = await _client
    .from('repeater_spots')
    .select('''
      id, user_id, callsign_snapshot, spotted_callsign,
      started_at, expires_at, closed_at, duration_minutes,
      profiles!user_id(id, callsign, first_name),
      repeater_access!access_id(id, mode)
    ''')
    .eq('repeater_id', repeaterId)
    .isFilter('closed_at', null)
    .gt('expires_at', DateTime.now().toUtc().toIso8601String())
    .isFilter('spotted_callsign', null)  // Solo self-spot
    .order('started_at', ascending: false);

  return (rows as List).map((r) => SpotModel.fromJson(r as Map<String, dynamic>)).toList();
}
```

### Realtime subscription

Vedi [contracts/realtime.md](./contracts/realtime.md) §2 per il pattern notifier completo.

---

## 5. Recipe — US3: Ultimi spot 24h

### REST query

```dart
Future<List<SpotModel>> getRecentSpots() async {
  final since = DateTime.now()
    .subtract(const Duration(hours: 24))
    .toUtc()
    .toIso8601String();

  final rows = await _client
    .from('repeater_spots')
    .select('''
      id, user_id, callsign_snapshot, spotted_callsign,
      started_at, expires_at, closed_at, duration_minutes,
      profiles!user_id(id, callsign, first_name),
      repeaters!repeater_id(id, callsign, name),
      repeater_access!access_id(id, mode)
    ''')
    .gte('started_at', since)
    .order('started_at', ascending: false);

  return (rows as List).map((r) => SpotModel.fromJson(r as Map<String, dynamic>)).toList();
}
```

### Realtime: channel `spots:global` senza filtro (vedi contracts/realtime.md).

---

## 6. Recipe — US4: Indicatore personale

### REST query (spot attivo dell'utente)

```dart
Future<SpotModel?> getMyActiveSpot(String userId) async {
  final row = await _client
    .from('repeater_spots')
    .select('''
      id, user_id, repeater_id, callsign_snapshot,
      started_at, expires_at, closed_at, duration_minutes,
      repeaters!repeater_id(id, callsign, name),
      repeater_access!access_id(id, mode)
    ''')
    .eq('user_id', userId)
    .isFilter('closed_at', null)
    .isFilter('spotted_callsign', null)  // Solo self-spot
    .gt('expires_at', DateTime.now().toUtc().toIso8601String())
    .maybeSingle();

  if (row == null) return null;
  return SpotModel.fromJson(row);
}
```

### Chiusura spot

```dart
Future<SpotModel> closeSpot(String spotId) async {
  final response = await _client.functions.invoke('close-spot', body: {
    'spot_id': spotId,
  });

  if (response.status != 200) {
    final error = (response.data as Map<String, dynamic>)['error'] as String? ?? 'UNKNOWN';
    if (error == 'ALREADY_CLOSED') {
      // Trattare come successo (idempotenza FR-009)
      return SpotModel.fromJson(
        (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
      );
    }
    throw SpotError.fromCode(error);
  }

  return SpotModel.fromJson(
    (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
  );
}
```

---

## 7. Recipe — US5: Notifica push deep link

### OneSignal handler

```dart
// In main.dart o in un service di inizializzazione post-login:

// Notifica toccata (app in background o chiusa)
OneSignal.Notifications.addClickListener((event) {
  final data = event.notification.additionalData;
  if (data?['type'] == 'new_cluster_spot') {
    final repeaterId = data!['repeater_id'] as String;
    appRouter.push(RepeaterDetailRoute(repeaterId: repeaterId));
  }
});

// Notifica ricevuta in foreground
OneSignal.Notifications.addForegroundWillDisplayListener((event) {
  final data = event.notification.additionalData;
  if (data?['type'] == 'new_cluster_spot') {
    // Mostrare banner in-app (non il sistema di notifica OS)
    event.preventDefault();
    showInAppSpotNotification(
      title: event.notification.title ?? '',
      body: event.notification.body ?? '',
      repeaterId: data!['repeater_id'] as String,
    );
  }
});
```

---

## 8. Recipe — US6: Preferenze notifica

### Toggle globale (profilo)

```dart
// Lettura: aggiungere il campo alla query del profilo esistente
// profiles.cluster_notifications_enabled

// Scrittura
Future<void> setClusterNotificationsEnabled(bool enabled) async {
  await _client
    .from('profiles')
    .update({'cluster_notifications_enabled': enabled})
    .eq('id', _client.auth.currentUser!.id);
}
```

### Toggle per-preferito

```dart
// Lettura: aggiungere il campo alla query dei preferiti esistente
// user_favorite_repeaters.cluster_notifications_enabled

// Scrittura
Future<void> setFavoriteClusterNotifications({
  required String favoriteId,
  required bool enabled,
}) async {
  await _client
    .from('user_favorite_repeaters')
    .update({'cluster_notifications_enabled': enabled})
    .eq('id', favoriteId);
}
```

---

## 9. Recipe — Indicatori mappa e card

### Provider per repeater IDs con spot attivi

```dart
@Riverpod(keepAlive: true)
class RepeatersWithActiveSpots extends _$RepeatersWithActiveSpots {
  @override
  FutureOr<Set<String>> build() async {
    final rows = await ref.read(supabaseClientProvider)
      .from('repeater_spots')
      .select('repeater_id')
      .isFilter('closed_at', null)
      .isFilter('spotted_callsign', null)  // Solo self-spot
      .gt('expires_at', DateTime.now().toUtc().toIso8601String());

    return (rows as List)
      .map((r) => (r as Map<String, dynamic>)['repeater_id'] as String)
      .toSet();
  }
}
```

### Uso nella mappa

```dart
final activeSet = ref.watch(repeatersWithActiveSpotsProvider).valueOrNull ?? {};
final hasActiveSpots = activeSet.contains(repeater.id);
// Se hasActiveSpots → bordo rosso pulsante sul marker
```

### Uso nelle card

```dart
final activeSet = ref.watch(repeatersWithActiveSpotsProvider).valueOrNull ?? {};
final hasActiveSpots = activeSet.contains(repeater.id);
// Se hasActiveSpots → punto rosso sulla card
```

---

## 10. Localization keys (pattern)

Prefisso: `spot` per tutte le chiavi della feature.

| Key pattern | Example | Value IT |
|-------------|---------|----------|
| `spotCreateTitle` | — | "Spottati" |
| `spotCreateOtherTitle` | — | "Spotta un OM" |
| `spotCreateDuration` | — | "Durata" |
| `spotCreateAccess` | — | "Modalità (opzionale)" |
| `spotCreateConfirm` | — | "Conferma" |
| `spotActiveYou` | — | "Sei spottato" |
| `spotActiveClose` | — | "Chiudi spot" |
| `spotActiveNone` | — | "Nessuno spottato al momento" |
| `spotActiveCta` | — | "Spottati tu!" |
| `spotListTitle` | — | "Ultimi spot" |
| `spotListViewAll` | — | "Vedi tutti" |
| `spotListBadgeActive` | — | "In ascolto" |
| `spotListBadgeClosed` | — | "Concluso" |
| `spotListBadgeReport` | — | "Segnalazione" |
| `spotNotificationToggle` | — | "Notifiche cluster" |
| `spotNotificationDisabled` | — | "Notifiche cluster disattivate globalmente" |
| `spotPreviousClosed` | — | "Il tuo spot precedente non è più attivo" |
| `spotError*` | (vedi §2) | (vedi §2) |
