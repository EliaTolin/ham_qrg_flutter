// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pota_spots_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PotaSpotsState {
  List<PotaSpot> get spots;
  List<PotaSpot> get filteredSpots;
  String get searchQuery;
  bool get hasLoadError;
  bool get isRefreshing;
  DateTime? get lastUpdatedAt;
  DateTime? get nextRefreshAt;
  String? get selectedBand;
  String? get selectedMode;
  PotaSpotsSortOrder get sortOrder;
  Map<String, double> get distanceByReference;
  Map<String, PotaPark> get parkCache;
  List<String> get availableBands;
  List<String> get availableModes;

  /// Create a copy of PotaSpotsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PotaSpotsStateCopyWith<PotaSpotsState> get copyWith =>
      _$PotaSpotsStateCopyWithImpl<PotaSpotsState>(
          this as PotaSpotsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PotaSpotsState &&
            const DeepCollectionEquality().equals(other.spots, spots) &&
            const DeepCollectionEquality()
                .equals(other.filteredSpots, filteredSpots) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.hasLoadError, hasLoadError) ||
                other.hasLoadError == hasLoadError) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt) &&
            (identical(other.nextRefreshAt, nextRefreshAt) ||
                other.nextRefreshAt == nextRefreshAt) &&
            (identical(other.selectedBand, selectedBand) ||
                other.selectedBand == selectedBand) &&
            (identical(other.selectedMode, selectedMode) ||
                other.selectedMode == selectedMode) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality()
                .equals(other.distanceByReference, distanceByReference) &&
            const DeepCollectionEquality().equals(other.parkCache, parkCache) &&
            const DeepCollectionEquality()
                .equals(other.availableBands, availableBands) &&
            const DeepCollectionEquality()
                .equals(other.availableModes, availableModes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(spots),
      const DeepCollectionEquality().hash(filteredSpots),
      searchQuery,
      hasLoadError,
      isRefreshing,
      lastUpdatedAt,
      nextRefreshAt,
      selectedBand,
      selectedMode,
      sortOrder,
      const DeepCollectionEquality().hash(distanceByReference),
      const DeepCollectionEquality().hash(parkCache),
      const DeepCollectionEquality().hash(availableBands),
      const DeepCollectionEquality().hash(availableModes));

  @override
  String toString() {
    return 'PotaSpotsState(spots: $spots, filteredSpots: $filteredSpots, searchQuery: $searchQuery, hasLoadError: $hasLoadError, isRefreshing: $isRefreshing, lastUpdatedAt: $lastUpdatedAt, nextRefreshAt: $nextRefreshAt, selectedBand: $selectedBand, selectedMode: $selectedMode, sortOrder: $sortOrder, distanceByReference: $distanceByReference, parkCache: $parkCache, availableBands: $availableBands, availableModes: $availableModes)';
  }
}

/// @nodoc
abstract mixin class $PotaSpotsStateCopyWith<$Res> {
  factory $PotaSpotsStateCopyWith(
          PotaSpotsState value, $Res Function(PotaSpotsState) _then) =
      _$PotaSpotsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<PotaSpot> spots,
      List<PotaSpot> filteredSpots,
      String searchQuery,
      bool hasLoadError,
      bool isRefreshing,
      DateTime? lastUpdatedAt,
      DateTime? nextRefreshAt,
      String? selectedBand,
      String? selectedMode,
      PotaSpotsSortOrder sortOrder,
      Map<String, double> distanceByReference,
      Map<String, PotaPark> parkCache,
      List<String> availableBands,
      List<String> availableModes});
}

/// @nodoc
class _$PotaSpotsStateCopyWithImpl<$Res>
    implements $PotaSpotsStateCopyWith<$Res> {
  _$PotaSpotsStateCopyWithImpl(this._self, this._then);

  final PotaSpotsState _self;
  final $Res Function(PotaSpotsState) _then;

  /// Create a copy of PotaSpotsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spots = null,
    Object? filteredSpots = null,
    Object? searchQuery = null,
    Object? hasLoadError = null,
    Object? isRefreshing = null,
    Object? lastUpdatedAt = freezed,
    Object? nextRefreshAt = freezed,
    Object? selectedBand = freezed,
    Object? selectedMode = freezed,
    Object? sortOrder = null,
    Object? distanceByReference = null,
    Object? parkCache = null,
    Object? availableBands = null,
    Object? availableModes = null,
  }) {
    return _then(_self.copyWith(
      spots: null == spots
          ? _self.spots
          : spots // ignore: cast_nullable_to_non_nullable
              as List<PotaSpot>,
      filteredSpots: null == filteredSpots
          ? _self.filteredSpots
          : filteredSpots // ignore: cast_nullable_to_non_nullable
              as List<PotaSpot>,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      hasLoadError: null == hasLoadError
          ? _self.hasLoadError
          : hasLoadError // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshing: null == isRefreshing
          ? _self.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _self.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextRefreshAt: freezed == nextRefreshAt
          ? _self.nextRefreshAt
          : nextRefreshAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedBand: freezed == selectedBand
          ? _self.selectedBand
          : selectedBand // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedMode: freezed == selectedMode
          ? _self.selectedMode
          : selectedMode // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as PotaSpotsSortOrder,
      distanceByReference: null == distanceByReference
          ? _self.distanceByReference
          : distanceByReference // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      parkCache: null == parkCache
          ? _self.parkCache
          : parkCache // ignore: cast_nullable_to_non_nullable
              as Map<String, PotaPark>,
      availableBands: null == availableBands
          ? _self.availableBands
          : availableBands // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availableModes: null == availableModes
          ? _self.availableModes
          : availableModes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [PotaSpotsState].
extension PotaSpotsStatePatterns on PotaSpotsState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PotaSpotsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PotaSpotsState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PotaSpotsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpotsState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PotaSpotsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpotsState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<PotaSpot> spots,
            List<PotaSpot> filteredSpots,
            String searchQuery,
            bool hasLoadError,
            bool isRefreshing,
            DateTime? lastUpdatedAt,
            DateTime? nextRefreshAt,
            String? selectedBand,
            String? selectedMode,
            PotaSpotsSortOrder sortOrder,
            Map<String, double> distanceByReference,
            Map<String, PotaPark> parkCache,
            List<String> availableBands,
            List<String> availableModes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PotaSpotsState() when $default != null:
        return $default(
            _that.spots,
            _that.filteredSpots,
            _that.searchQuery,
            _that.hasLoadError,
            _that.isRefreshing,
            _that.lastUpdatedAt,
            _that.nextRefreshAt,
            _that.selectedBand,
            _that.selectedMode,
            _that.sortOrder,
            _that.distanceByReference,
            _that.parkCache,
            _that.availableBands,
            _that.availableModes);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<PotaSpot> spots,
            List<PotaSpot> filteredSpots,
            String searchQuery,
            bool hasLoadError,
            bool isRefreshing,
            DateTime? lastUpdatedAt,
            DateTime? nextRefreshAt,
            String? selectedBand,
            String? selectedMode,
            PotaSpotsSortOrder sortOrder,
            Map<String, double> distanceByReference,
            Map<String, PotaPark> parkCache,
            List<String> availableBands,
            List<String> availableModes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpotsState():
        return $default(
            _that.spots,
            _that.filteredSpots,
            _that.searchQuery,
            _that.hasLoadError,
            _that.isRefreshing,
            _that.lastUpdatedAt,
            _that.nextRefreshAt,
            _that.selectedBand,
            _that.selectedMode,
            _that.sortOrder,
            _that.distanceByReference,
            _that.parkCache,
            _that.availableBands,
            _that.availableModes);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<PotaSpot> spots,
            List<PotaSpot> filteredSpots,
            String searchQuery,
            bool hasLoadError,
            bool isRefreshing,
            DateTime? lastUpdatedAt,
            DateTime? nextRefreshAt,
            String? selectedBand,
            String? selectedMode,
            PotaSpotsSortOrder sortOrder,
            Map<String, double> distanceByReference,
            Map<String, PotaPark> parkCache,
            List<String> availableBands,
            List<String> availableModes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpotsState() when $default != null:
        return $default(
            _that.spots,
            _that.filteredSpots,
            _that.searchQuery,
            _that.hasLoadError,
            _that.isRefreshing,
            _that.lastUpdatedAt,
            _that.nextRefreshAt,
            _that.selectedBand,
            _that.selectedMode,
            _that.sortOrder,
            _that.distanceByReference,
            _that.parkCache,
            _that.availableBands,
            _that.availableModes);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PotaSpotsState implements PotaSpotsState {
  const _PotaSpotsState(
      {final List<PotaSpot> spots = const <PotaSpot>[],
      final List<PotaSpot> filteredSpots = const <PotaSpot>[],
      this.searchQuery = '',
      this.hasLoadError = false,
      this.isRefreshing = false,
      this.lastUpdatedAt,
      this.nextRefreshAt,
      this.selectedBand,
      this.selectedMode,
      this.sortOrder = PotaSpotsSortOrder.time,
      final Map<String, double> distanceByReference = const <String, double>{},
      final Map<String, PotaPark> parkCache = const <String, PotaPark>{},
      final List<String> availableBands = const <String>[],
      final List<String> availableModes = const <String>[]})
      : _spots = spots,
        _filteredSpots = filteredSpots,
        _distanceByReference = distanceByReference,
        _parkCache = parkCache,
        _availableBands = availableBands,
        _availableModes = availableModes;

  final List<PotaSpot> _spots;
  @override
  @JsonKey()
  List<PotaSpot> get spots {
    if (_spots is EqualUnmodifiableListView) return _spots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spots);
  }

  final List<PotaSpot> _filteredSpots;
  @override
  @JsonKey()
  List<PotaSpot> get filteredSpots {
    if (_filteredSpots is EqualUnmodifiableListView) return _filteredSpots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredSpots);
  }

  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final bool hasLoadError;
  @override
  @JsonKey()
  final bool isRefreshing;
  @override
  final DateTime? lastUpdatedAt;
  @override
  final DateTime? nextRefreshAt;
  @override
  final String? selectedBand;
  @override
  final String? selectedMode;
  @override
  @JsonKey()
  final PotaSpotsSortOrder sortOrder;
  final Map<String, double> _distanceByReference;
  @override
  @JsonKey()
  Map<String, double> get distanceByReference {
    if (_distanceByReference is EqualUnmodifiableMapView)
      return _distanceByReference;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_distanceByReference);
  }

  final Map<String, PotaPark> _parkCache;
  @override
  @JsonKey()
  Map<String, PotaPark> get parkCache {
    if (_parkCache is EqualUnmodifiableMapView) return _parkCache;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_parkCache);
  }

  final List<String> _availableBands;
  @override
  @JsonKey()
  List<String> get availableBands {
    if (_availableBands is EqualUnmodifiableListView) return _availableBands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableBands);
  }

  final List<String> _availableModes;
  @override
  @JsonKey()
  List<String> get availableModes {
    if (_availableModes is EqualUnmodifiableListView) return _availableModes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableModes);
  }

  /// Create a copy of PotaSpotsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PotaSpotsStateCopyWith<_PotaSpotsState> get copyWith =>
      __$PotaSpotsStateCopyWithImpl<_PotaSpotsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PotaSpotsState &&
            const DeepCollectionEquality().equals(other._spots, _spots) &&
            const DeepCollectionEquality()
                .equals(other._filteredSpots, _filteredSpots) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.hasLoadError, hasLoadError) ||
                other.hasLoadError == hasLoadError) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt) &&
            (identical(other.nextRefreshAt, nextRefreshAt) ||
                other.nextRefreshAt == nextRefreshAt) &&
            (identical(other.selectedBand, selectedBand) ||
                other.selectedBand == selectedBand) &&
            (identical(other.selectedMode, selectedMode) ||
                other.selectedMode == selectedMode) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality()
                .equals(other._distanceByReference, _distanceByReference) &&
            const DeepCollectionEquality()
                .equals(other._parkCache, _parkCache) &&
            const DeepCollectionEquality()
                .equals(other._availableBands, _availableBands) &&
            const DeepCollectionEquality()
                .equals(other._availableModes, _availableModes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_spots),
      const DeepCollectionEquality().hash(_filteredSpots),
      searchQuery,
      hasLoadError,
      isRefreshing,
      lastUpdatedAt,
      nextRefreshAt,
      selectedBand,
      selectedMode,
      sortOrder,
      const DeepCollectionEquality().hash(_distanceByReference),
      const DeepCollectionEquality().hash(_parkCache),
      const DeepCollectionEquality().hash(_availableBands),
      const DeepCollectionEquality().hash(_availableModes));

  @override
  String toString() {
    return 'PotaSpotsState(spots: $spots, filteredSpots: $filteredSpots, searchQuery: $searchQuery, hasLoadError: $hasLoadError, isRefreshing: $isRefreshing, lastUpdatedAt: $lastUpdatedAt, nextRefreshAt: $nextRefreshAt, selectedBand: $selectedBand, selectedMode: $selectedMode, sortOrder: $sortOrder, distanceByReference: $distanceByReference, parkCache: $parkCache, availableBands: $availableBands, availableModes: $availableModes)';
  }
}

/// @nodoc
abstract mixin class _$PotaSpotsStateCopyWith<$Res>
    implements $PotaSpotsStateCopyWith<$Res> {
  factory _$PotaSpotsStateCopyWith(
          _PotaSpotsState value, $Res Function(_PotaSpotsState) _then) =
      __$PotaSpotsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<PotaSpot> spots,
      List<PotaSpot> filteredSpots,
      String searchQuery,
      bool hasLoadError,
      bool isRefreshing,
      DateTime? lastUpdatedAt,
      DateTime? nextRefreshAt,
      String? selectedBand,
      String? selectedMode,
      PotaSpotsSortOrder sortOrder,
      Map<String, double> distanceByReference,
      Map<String, PotaPark> parkCache,
      List<String> availableBands,
      List<String> availableModes});
}

/// @nodoc
class __$PotaSpotsStateCopyWithImpl<$Res>
    implements _$PotaSpotsStateCopyWith<$Res> {
  __$PotaSpotsStateCopyWithImpl(this._self, this._then);

  final _PotaSpotsState _self;
  final $Res Function(_PotaSpotsState) _then;

  /// Create a copy of PotaSpotsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? spots = null,
    Object? filteredSpots = null,
    Object? searchQuery = null,
    Object? hasLoadError = null,
    Object? isRefreshing = null,
    Object? lastUpdatedAt = freezed,
    Object? nextRefreshAt = freezed,
    Object? selectedBand = freezed,
    Object? selectedMode = freezed,
    Object? sortOrder = null,
    Object? distanceByReference = null,
    Object? parkCache = null,
    Object? availableBands = null,
    Object? availableModes = null,
  }) {
    return _then(_PotaSpotsState(
      spots: null == spots
          ? _self._spots
          : spots // ignore: cast_nullable_to_non_nullable
              as List<PotaSpot>,
      filteredSpots: null == filteredSpots
          ? _self._filteredSpots
          : filteredSpots // ignore: cast_nullable_to_non_nullable
              as List<PotaSpot>,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      hasLoadError: null == hasLoadError
          ? _self.hasLoadError
          : hasLoadError // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshing: null == isRefreshing
          ? _self.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _self.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextRefreshAt: freezed == nextRefreshAt
          ? _self.nextRefreshAt
          : nextRefreshAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedBand: freezed == selectedBand
          ? _self.selectedBand
          : selectedBand // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedMode: freezed == selectedMode
          ? _self.selectedMode
          : selectedMode // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as PotaSpotsSortOrder,
      distanceByReference: null == distanceByReference
          ? _self._distanceByReference
          : distanceByReference // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      parkCache: null == parkCache
          ? _self._parkCache
          : parkCache // ignore: cast_nullable_to_non_nullable
              as Map<String, PotaPark>,
      availableBands: null == availableBands
          ? _self._availableBands
          : availableBands // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availableModes: null == availableModes
          ? _self._availableModes
          : availableModes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
