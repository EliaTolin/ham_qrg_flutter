# Data Model — Cluster Spots Frontend

**Feature**: 002-cluster-spots-frontend
**Date**: 2026-04-12

> Questo file descrive le entità Flutter (domain entities, DTOs, state classes) per la feature Cluster Spots. Il data model backend (tabelle, RPC, trigger) è documentato in `ham_qrg_supabase/specs/001-cluster-spots/data-model.md`.

---

## 1. Domain Entity: `RepeaterSpot`

**Location**: `lib/src/features/spots/domain/spot/repeater_spot.dart`

```dart
@freezed
class RepeaterSpot with _$RepeaterSpot {
  const factory RepeaterSpot({
    required String id,
    required String userId,
    required String repeaterId,
    required String callsignSnapshot,
    String? spottedCallsign,       // null = self-spot, valorizzato = other-spot
    String? accessId,
    AccessMode? accessMode,        // derivato dal join con repeater_access
    required DateTime startedAt,
    int? durationMinutes,          // null per other-spot
    DateTime? expiresAt,           // null per other-spot
    DateTime? closedAt,
    // Enriched data (from joins)
    String? repeaterCallsign,
    String? repeaterName,
    String? spotterFirstName,
  }) = _RepeaterSpot;
}
```

**Notes**:
- Nessun `fromJson` — è un domain entity puro (Constitution §I).
- `accessMode` è derivato dal join con `repeater_access` e usa l'enum `AccessMode` esistente.
- `spottedCallsign` distingue self-spot (null) da other-spot (valorizzato).
- `durationMinutes` e `expiresAt` sono null per gli other-spot.

---

## 2. Enum: `SpotState`

**Location**: `lib/src/features/spots/domain/spot_state.dart`

```dart
enum SpotState { active, expired, closed }
```

**Derivazione** (extension su `RepeaterSpot`):

```dart
extension RepeaterSpotState on RepeaterSpot {
  bool get isSelfSpot => spottedCallsign == null;
  bool get isOtherSpot => spottedCallsign != null;

  SpotState get state {
    // Other-spot: non hanno stato attivo/scaduto, solo storico
    if (isOtherSpot) return SpotState.closed;
    if (closedAt != null) return SpotState.closed;
    if (expiresAt != null && !expiresAt!.isAfter(DateTime.now())) {
      return SpotState.expired;
    }
    return SpotState.active;
  }

  bool get isActive => state == SpotState.active;

  Duration get remainingTime {
    if (expiresAt == null) return Duration.zero;
    final remaining = expiresAt!.difference(DateTime.now());
    return remaining.isNegative ? Duration.zero : remaining;
  }
}
```

---

## 3. DTO: `SpotModel`

**Location**: `lib/src/features/spots/data/model/spot_model.dart`

```dart
@freezed
class SpotModel with _$SpotModel {
  const factory SpotModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'repeater_id') required String repeaterId,
    @JsonKey(name: 'callsign_snapshot') required String callsignSnapshot,
    @JsonKey(name: 'spotted_callsign') String? spottedCallsign,
    @JsonKey(name: 'access_id') String? accessId,
    @JsonKey(name: 'started_at') required DateTime startedAt,
    @JsonKey(name: 'duration_minutes') int? durationMinutes,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    @JsonKey(name: 'closed_at') DateTime? closedAt,
    // Nested join objects
    @JsonKey(name: 'profiles') SpotProfileModel? profile,
    @JsonKey(name: 'repeaters') SpotRepeaterModel? repeater,
    @JsonKey(name: 'repeater_access') SpotAccessModel? access,
  }) = _SpotModel;

  factory SpotModel.fromJson(Map<String, dynamic> json) =>
      _$SpotModelFromJson(json);
}

@freezed
class SpotProfileModel with _$SpotProfileModel {
  const factory SpotProfileModel({
    required String id,
    String? callsign,
    @JsonKey(name: 'first_name') String? firstName,
  }) = _SpotProfileModel;

  factory SpotProfileModel.fromJson(Map<String, dynamic> json) =>
      _$SpotProfileModelFromJson(json);
}

@freezed
class SpotRepeaterModel with _$SpotRepeaterModel {
  const factory SpotRepeaterModel({
    required String id,
    String? callsign,
    String? name,
  }) = _SpotRepeaterModel;

  factory SpotRepeaterModel.fromJson(Map<String, dynamic> json) =>
      _$SpotRepeaterModelFromJson(json);
}

@freezed
class SpotAccessModel with _$SpotAccessModel {
  const factory SpotAccessModel({
    required String id,
    required String mode,
  }) = _SpotAccessModel;

  factory SpotAccessModel.fromJson(Map<String, dynamic> json) =>
      _$SpotAccessModelFromJson(json);
}
```

---

## 4. Mapper: `SpotMapper`

**Location**: `lib/src/features/spots/data/mappers/spot_mapper.dart`

```dart
class SpotMapper {
  static RepeaterSpot toEntity(SpotModel model) {
    return RepeaterSpot(
      id: model.id,
      userId: model.userId,
      repeaterId: model.repeaterId,
      callsignSnapshot: model.callsignSnapshot,
      spottedCallsign: model.spottedCallsign,
      accessId: model.accessId,
      accessMode: model.access != null
          ? AccessModeHelper.fromString(model.access!.mode)
          : null,
      startedAt: model.startedAt,
      durationMinutes: model.durationMinutes,
      expiresAt: model.expiresAt,
      closedAt: model.closedAt,
      repeaterCallsign: model.repeater?.callsign,
      repeaterName: model.repeater?.name,
      spotterFirstName: model.profile?.firstName,
    );
  }
}
```

---

## 5. State Classes

### CreateSpotState

**Location**: `lib/src/features/spots/presentation/create_spot_sheet/` (if needed for complex state)

Semplice — il bottom sheet usa stato locale (`useState` hooks) per durata selezionata, access selezionato, e loading state. Non necessita di un controller dedicato.

### SpotListState

**Location**: `lib/src/features/spots/presentation/spot_list_page/controller/state/spot_list_state.dart`

```dart
@freezed
class SpotListState with _$SpotListState {
  const factory SpotListState({
    @Default([]) List<RepeaterSpot> spots,
    @Default(false) bool hasLoadError,
  }) = _SpotListState;
}
```

### ActiveSpotsState (per scheda ponte)

Semplice lista `List<RepeaterSpot>` gestita dal `ActiveSpotsNotifier` — non necessita di state class dedicata perché la lista è l'unico dato.

### MyActiveSpotState (indicatore personale)

Il `MyActiveSpotNotifier` gestisce un `RepeaterSpot?` (null = nessun spot attivo). Non necessita di state class dedicata.

---

## 6. Modifiche a entità esistenti

### Profile entity

**Aggiunta**: campo `clusterNotificationsEnabled` (bool, default true).

```dart
// In lib/src/features/profile/domain/profile/profile.dart
// Aggiungere:
@Default(true) bool clusterNotificationsEnabled,
```

Corrispondente aggiornamento in `ProfileModel` (DTO) e `ProfileMapper`.

### FavoriteRepeater / user_favorite_repeaters

**Aggiunta**: campo `clusterNotificationsEnabled` (bool, default true) al modello del preferito. Da esporre nella UI dei preferiti come toggle.

---

## 7. Entity-Relationship (frontend perspective)

```text
RepeaterSpot
  ├── userId → (auth user, non join diretto)
  ├── repeaterId → Repeater (join per nome/callsign)
  ├── accessId → RepeaterAccess (join per mode/colore)
  ├── callsignSnapshot (immutabile, dello spotter)
  ├── spottedCallsign (null=self, valorizzato=other)
  └── state: derivato da (closedAt, expiresAt, now())

Profile (esteso)
  └── clusterNotificationsEnabled: bool

UserFavoriteRepeater (esteso)
  └── clusterNotificationsEnabled: bool
```

---

## 8. State Transitions (self-spot, lato client)

```text
[nessuno spot] → create_spot() → active (countdown visibile)
active → countdown a 0 → expired (rimosso da UI, nessun evento server)
active → close_spot() → closed (rimosso da UI, evento Realtime UPDATE)
active → create_spot() su altro ponte → closed (evento Realtime UPDATE) + nuovo active
```

Gli other-spot non hanno transizioni di stato — sono record storici immutabili dal momento della creazione.
