// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeaters_map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepeatersMapState {
  List<Repeater> get repeaters;
  double? get latitude;
  double? get longitude;
  LocationErrorType? get locationError;
  bool get hasLoadError;
  Set<AccessMode> get selectedModes;
  Repeater? get selectedRepeater;
  List<PotaSpot> get potaSpots;
  Map<String, PotaPark> get potaParkCache;

  /// Punto arbitrario attualmente selezionato: al massimo uno per volta
  /// (FR-007). `null` significa nessun pin sulla mappa.
  SearchPoint? get searchPoint;

  /// Ampiezza di ricerca scelta per la valutazione (FR-024).
  SearchBreadth get searchBreadth;

  /// Errore dell'ultima selezione, mostrato come banner senza far collassare
  /// la mappa. Si azzera alla selezione successiva riuscita.
  SearchPointError? get pointError;

  /// Create a copy of RepeatersMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeatersMapStateCopyWith<RepeatersMapState> get copyWith =>
      _$RepeatersMapStateCopyWithImpl<RepeatersMapState>(
          this as RepeatersMapState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepeatersMapState &&
            const DeepCollectionEquality().equals(other.repeaters, repeaters) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationError, locationError) ||
                other.locationError == locationError) &&
            (identical(other.hasLoadError, hasLoadError) ||
                other.hasLoadError == hasLoadError) &&
            const DeepCollectionEquality()
                .equals(other.selectedModes, selectedModes) &&
            (identical(other.selectedRepeater, selectedRepeater) ||
                other.selectedRepeater == selectedRepeater) &&
            const DeepCollectionEquality().equals(other.potaSpots, potaSpots) &&
            const DeepCollectionEquality()
                .equals(other.potaParkCache, potaParkCache) &&
            (identical(other.searchPoint, searchPoint) ||
                other.searchPoint == searchPoint) &&
            (identical(other.searchBreadth, searchBreadth) ||
                other.searchBreadth == searchBreadth) &&
            (identical(other.pointError, pointError) ||
                other.pointError == pointError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(repeaters),
      latitude,
      longitude,
      locationError,
      hasLoadError,
      const DeepCollectionEquality().hash(selectedModes),
      selectedRepeater,
      const DeepCollectionEquality().hash(potaSpots),
      const DeepCollectionEquality().hash(potaParkCache),
      searchPoint,
      searchBreadth,
      pointError);

  @override
  String toString() {
    return 'RepeatersMapState(repeaters: $repeaters, latitude: $latitude, longitude: $longitude, locationError: $locationError, hasLoadError: $hasLoadError, selectedModes: $selectedModes, selectedRepeater: $selectedRepeater, potaSpots: $potaSpots, potaParkCache: $potaParkCache, searchPoint: $searchPoint, searchBreadth: $searchBreadth, pointError: $pointError)';
  }
}

/// @nodoc
abstract mixin class $RepeatersMapStateCopyWith<$Res> {
  factory $RepeatersMapStateCopyWith(
          RepeatersMapState value, $Res Function(RepeatersMapState) _then) =
      _$RepeatersMapStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Repeater> repeaters,
      double? latitude,
      double? longitude,
      LocationErrorType? locationError,
      bool hasLoadError,
      Set<AccessMode> selectedModes,
      Repeater? selectedRepeater,
      List<PotaSpot> potaSpots,
      Map<String, PotaPark> potaParkCache,
      SearchPoint? searchPoint,
      SearchBreadth searchBreadth,
      SearchPointError? pointError});

  $RepeaterCopyWith<$Res>? get selectedRepeater;
  $SearchPointCopyWith<$Res>? get searchPoint;
}

/// @nodoc
class _$RepeatersMapStateCopyWithImpl<$Res>
    implements $RepeatersMapStateCopyWith<$Res> {
  _$RepeatersMapStateCopyWithImpl(this._self, this._then);

  final RepeatersMapState _self;
  final $Res Function(RepeatersMapState) _then;

  /// Create a copy of RepeatersMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeaters = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? locationError = freezed,
    Object? hasLoadError = null,
    Object? selectedModes = null,
    Object? selectedRepeater = freezed,
    Object? potaSpots = null,
    Object? potaParkCache = null,
    Object? searchPoint = freezed,
    Object? searchBreadth = null,
    Object? pointError = freezed,
  }) {
    return _then(_self.copyWith(
      repeaters: null == repeaters
          ? _self.repeaters
          : repeaters // ignore: cast_nullable_to_non_nullable
              as List<Repeater>,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      locationError: freezed == locationError
          ? _self.locationError
          : locationError // ignore: cast_nullable_to_non_nullable
              as LocationErrorType?,
      hasLoadError: null == hasLoadError
          ? _self.hasLoadError
          : hasLoadError // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedModes: null == selectedModes
          ? _self.selectedModes
          : selectedModes // ignore: cast_nullable_to_non_nullable
              as Set<AccessMode>,
      selectedRepeater: freezed == selectedRepeater
          ? _self.selectedRepeater
          : selectedRepeater // ignore: cast_nullable_to_non_nullable
              as Repeater?,
      potaSpots: null == potaSpots
          ? _self.potaSpots
          : potaSpots // ignore: cast_nullable_to_non_nullable
              as List<PotaSpot>,
      potaParkCache: null == potaParkCache
          ? _self.potaParkCache
          : potaParkCache // ignore: cast_nullable_to_non_nullable
              as Map<String, PotaPark>,
      searchPoint: freezed == searchPoint
          ? _self.searchPoint
          : searchPoint // ignore: cast_nullable_to_non_nullable
              as SearchPoint?,
      searchBreadth: null == searchBreadth
          ? _self.searchBreadth
          : searchBreadth // ignore: cast_nullable_to_non_nullable
              as SearchBreadth,
      pointError: freezed == pointError
          ? _self.pointError
          : pointError // ignore: cast_nullable_to_non_nullable
              as SearchPointError?,
    ));
  }

  /// Create a copy of RepeatersMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res>? get selectedRepeater {
    if (_self.selectedRepeater == null) {
      return null;
    }

    return $RepeaterCopyWith<$Res>(_self.selectedRepeater!, (value) {
      return _then(_self.copyWith(selectedRepeater: value));
    });
  }

  /// Create a copy of RepeatersMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPointCopyWith<$Res>? get searchPoint {
    if (_self.searchPoint == null) {
      return null;
    }

    return $SearchPointCopyWith<$Res>(_self.searchPoint!, (value) {
      return _then(_self.copyWith(searchPoint: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RepeatersMapState].
extension RepeatersMapStatePatterns on RepeatersMapState {
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
    TResult Function(_RepeatersMapState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeatersMapState() when $default != null:
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
    TResult Function(_RepeatersMapState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeatersMapState():
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
    TResult? Function(_RepeatersMapState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeatersMapState() when $default != null:
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
            List<Repeater> repeaters,
            double? latitude,
            double? longitude,
            LocationErrorType? locationError,
            bool hasLoadError,
            Set<AccessMode> selectedModes,
            Repeater? selectedRepeater,
            List<PotaSpot> potaSpots,
            Map<String, PotaPark> potaParkCache,
            SearchPoint? searchPoint,
            SearchBreadth searchBreadth,
            SearchPointError? pointError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeatersMapState() when $default != null:
        return $default(
            _that.repeaters,
            _that.latitude,
            _that.longitude,
            _that.locationError,
            _that.hasLoadError,
            _that.selectedModes,
            _that.selectedRepeater,
            _that.potaSpots,
            _that.potaParkCache,
            _that.searchPoint,
            _that.searchBreadth,
            _that.pointError);
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
            List<Repeater> repeaters,
            double? latitude,
            double? longitude,
            LocationErrorType? locationError,
            bool hasLoadError,
            Set<AccessMode> selectedModes,
            Repeater? selectedRepeater,
            List<PotaSpot> potaSpots,
            Map<String, PotaPark> potaParkCache,
            SearchPoint? searchPoint,
            SearchBreadth searchBreadth,
            SearchPointError? pointError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeatersMapState():
        return $default(
            _that.repeaters,
            _that.latitude,
            _that.longitude,
            _that.locationError,
            _that.hasLoadError,
            _that.selectedModes,
            _that.selectedRepeater,
            _that.potaSpots,
            _that.potaParkCache,
            _that.searchPoint,
            _that.searchBreadth,
            _that.pointError);
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
            List<Repeater> repeaters,
            double? latitude,
            double? longitude,
            LocationErrorType? locationError,
            bool hasLoadError,
            Set<AccessMode> selectedModes,
            Repeater? selectedRepeater,
            List<PotaSpot> potaSpots,
            Map<String, PotaPark> potaParkCache,
            SearchPoint? searchPoint,
            SearchBreadth searchBreadth,
            SearchPointError? pointError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeatersMapState() when $default != null:
        return $default(
            _that.repeaters,
            _that.latitude,
            _that.longitude,
            _that.locationError,
            _that.hasLoadError,
            _that.selectedModes,
            _that.selectedRepeater,
            _that.potaSpots,
            _that.potaParkCache,
            _that.searchPoint,
            _that.searchBreadth,
            _that.pointError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RepeatersMapState implements RepeatersMapState {
  const _RepeatersMapState(
      {final List<Repeater> repeaters = const <Repeater>[],
      this.latitude,
      this.longitude,
      this.locationError,
      this.hasLoadError = false,
      final Set<AccessMode> selectedModes = const <AccessMode>{},
      this.selectedRepeater,
      final List<PotaSpot> potaSpots = const <PotaSpot>[],
      final Map<String, PotaPark> potaParkCache = const <String, PotaPark>{},
      this.searchPoint,
      this.searchBreadth = SearchBreadth.quick,
      this.pointError})
      : _repeaters = repeaters,
        _selectedModes = selectedModes,
        _potaSpots = potaSpots,
        _potaParkCache = potaParkCache;

  final List<Repeater> _repeaters;
  @override
  @JsonKey()
  List<Repeater> get repeaters {
    if (_repeaters is EqualUnmodifiableListView) return _repeaters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_repeaters);
  }

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final LocationErrorType? locationError;
  @override
  @JsonKey()
  final bool hasLoadError;
  final Set<AccessMode> _selectedModes;
  @override
  @JsonKey()
  Set<AccessMode> get selectedModes {
    if (_selectedModes is EqualUnmodifiableSetView) return _selectedModes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedModes);
  }

  @override
  final Repeater? selectedRepeater;
  final List<PotaSpot> _potaSpots;
  @override
  @JsonKey()
  List<PotaSpot> get potaSpots {
    if (_potaSpots is EqualUnmodifiableListView) return _potaSpots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_potaSpots);
  }

  final Map<String, PotaPark> _potaParkCache;
  @override
  @JsonKey()
  Map<String, PotaPark> get potaParkCache {
    if (_potaParkCache is EqualUnmodifiableMapView) return _potaParkCache;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_potaParkCache);
  }

  /// Punto arbitrario attualmente selezionato: al massimo uno per volta
  /// (FR-007). `null` significa nessun pin sulla mappa.
  @override
  final SearchPoint? searchPoint;

  /// Ampiezza di ricerca scelta per la valutazione (FR-024).
  @override
  @JsonKey()
  final SearchBreadth searchBreadth;

  /// Errore dell'ultima selezione, mostrato come banner senza far collassare
  /// la mappa. Si azzera alla selezione successiva riuscita.
  @override
  final SearchPointError? pointError;

  /// Create a copy of RepeatersMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeatersMapStateCopyWith<_RepeatersMapState> get copyWith =>
      __$RepeatersMapStateCopyWithImpl<_RepeatersMapState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeatersMapState &&
            const DeepCollectionEquality()
                .equals(other._repeaters, _repeaters) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationError, locationError) ||
                other.locationError == locationError) &&
            (identical(other.hasLoadError, hasLoadError) ||
                other.hasLoadError == hasLoadError) &&
            const DeepCollectionEquality()
                .equals(other._selectedModes, _selectedModes) &&
            (identical(other.selectedRepeater, selectedRepeater) ||
                other.selectedRepeater == selectedRepeater) &&
            const DeepCollectionEquality()
                .equals(other._potaSpots, _potaSpots) &&
            const DeepCollectionEquality()
                .equals(other._potaParkCache, _potaParkCache) &&
            (identical(other.searchPoint, searchPoint) ||
                other.searchPoint == searchPoint) &&
            (identical(other.searchBreadth, searchBreadth) ||
                other.searchBreadth == searchBreadth) &&
            (identical(other.pointError, pointError) ||
                other.pointError == pointError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_repeaters),
      latitude,
      longitude,
      locationError,
      hasLoadError,
      const DeepCollectionEquality().hash(_selectedModes),
      selectedRepeater,
      const DeepCollectionEquality().hash(_potaSpots),
      const DeepCollectionEquality().hash(_potaParkCache),
      searchPoint,
      searchBreadth,
      pointError);

  @override
  String toString() {
    return 'RepeatersMapState(repeaters: $repeaters, latitude: $latitude, longitude: $longitude, locationError: $locationError, hasLoadError: $hasLoadError, selectedModes: $selectedModes, selectedRepeater: $selectedRepeater, potaSpots: $potaSpots, potaParkCache: $potaParkCache, searchPoint: $searchPoint, searchBreadth: $searchBreadth, pointError: $pointError)';
  }
}

/// @nodoc
abstract mixin class _$RepeatersMapStateCopyWith<$Res>
    implements $RepeatersMapStateCopyWith<$Res> {
  factory _$RepeatersMapStateCopyWith(
          _RepeatersMapState value, $Res Function(_RepeatersMapState) _then) =
      __$RepeatersMapStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Repeater> repeaters,
      double? latitude,
      double? longitude,
      LocationErrorType? locationError,
      bool hasLoadError,
      Set<AccessMode> selectedModes,
      Repeater? selectedRepeater,
      List<PotaSpot> potaSpots,
      Map<String, PotaPark> potaParkCache,
      SearchPoint? searchPoint,
      SearchBreadth searchBreadth,
      SearchPointError? pointError});

  @override
  $RepeaterCopyWith<$Res>? get selectedRepeater;
  @override
  $SearchPointCopyWith<$Res>? get searchPoint;
}

/// @nodoc
class __$RepeatersMapStateCopyWithImpl<$Res>
    implements _$RepeatersMapStateCopyWith<$Res> {
  __$RepeatersMapStateCopyWithImpl(this._self, this._then);

  final _RepeatersMapState _self;
  final $Res Function(_RepeatersMapState) _then;

  /// Create a copy of RepeatersMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? repeaters = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? locationError = freezed,
    Object? hasLoadError = null,
    Object? selectedModes = null,
    Object? selectedRepeater = freezed,
    Object? potaSpots = null,
    Object? potaParkCache = null,
    Object? searchPoint = freezed,
    Object? searchBreadth = null,
    Object? pointError = freezed,
  }) {
    return _then(_RepeatersMapState(
      repeaters: null == repeaters
          ? _self._repeaters
          : repeaters // ignore: cast_nullable_to_non_nullable
              as List<Repeater>,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      locationError: freezed == locationError
          ? _self.locationError
          : locationError // ignore: cast_nullable_to_non_nullable
              as LocationErrorType?,
      hasLoadError: null == hasLoadError
          ? _self.hasLoadError
          : hasLoadError // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedModes: null == selectedModes
          ? _self._selectedModes
          : selectedModes // ignore: cast_nullable_to_non_nullable
              as Set<AccessMode>,
      selectedRepeater: freezed == selectedRepeater
          ? _self.selectedRepeater
          : selectedRepeater // ignore: cast_nullable_to_non_nullable
              as Repeater?,
      potaSpots: null == potaSpots
          ? _self._potaSpots
          : potaSpots // ignore: cast_nullable_to_non_nullable
              as List<PotaSpot>,
      potaParkCache: null == potaParkCache
          ? _self._potaParkCache
          : potaParkCache // ignore: cast_nullable_to_non_nullable
              as Map<String, PotaPark>,
      searchPoint: freezed == searchPoint
          ? _self.searchPoint
          : searchPoint // ignore: cast_nullable_to_non_nullable
              as SearchPoint?,
      searchBreadth: null == searchBreadth
          ? _self.searchBreadth
          : searchBreadth // ignore: cast_nullable_to_non_nullable
              as SearchBreadth,
      pointError: freezed == pointError
          ? _self.pointError
          : pointError // ignore: cast_nullable_to_non_nullable
              as SearchPointError?,
    ));
  }

  /// Create a copy of RepeatersMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res>? get selectedRepeater {
    if (_self.selectedRepeater == null) {
      return null;
    }

    return $RepeaterCopyWith<$Res>(_self.selectedRepeater!, (value) {
      return _then(_self.copyWith(selectedRepeater: value));
    });
  }

  /// Create a copy of RepeatersMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPointCopyWith<$Res>? get searchPoint {
    if (_self.searchPoint == null) {
      return null;
    }

    return $SearchPointCopyWith<$Res>(_self.searchPoint!, (value) {
      return _then(_self.copyWith(searchPoint: value));
    });
  }
}

// dart format on
