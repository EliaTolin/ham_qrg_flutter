// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sota_spots_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SotaSpotsState {
  List<SotaSpot> get spots;
  List<SotaSpot> get filteredSpots;
  bool get hasLoadError;
  bool get isRefreshing;
  DateTime? get lastUpdatedAt;
  DateTime? get nextRefreshAt;
  SotaSpotsSortOrder get sortOrder;
  Map<String, double> get distanceBySummitCode;
  List<String> get availableBands;
  List<String> get availableModes;
  List<String> get availableAssociations;
  String? get selectedBand;
  String? get selectedMode;
  int? get minPoints;
  String? get selectedAssociation;

  /// Create a copy of SotaSpotsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SotaSpotsStateCopyWith<SotaSpotsState> get copyWith =>
      _$SotaSpotsStateCopyWithImpl<SotaSpotsState>(
          this as SotaSpotsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SotaSpotsState &&
            const DeepCollectionEquality().equals(other.spots, spots) &&
            const DeepCollectionEquality()
                .equals(other.filteredSpots, filteredSpots) &&
            (identical(other.hasLoadError, hasLoadError) ||
                other.hasLoadError == hasLoadError) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt) &&
            (identical(other.nextRefreshAt, nextRefreshAt) ||
                other.nextRefreshAt == nextRefreshAt) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality()
                .equals(other.distanceBySummitCode, distanceBySummitCode) &&
            const DeepCollectionEquality()
                .equals(other.availableBands, availableBands) &&
            const DeepCollectionEquality()
                .equals(other.availableModes, availableModes) &&
            const DeepCollectionEquality()
                .equals(other.availableAssociations, availableAssociations) &&
            (identical(other.selectedBand, selectedBand) ||
                other.selectedBand == selectedBand) &&
            (identical(other.selectedMode, selectedMode) ||
                other.selectedMode == selectedMode) &&
            (identical(other.minPoints, minPoints) ||
                other.minPoints == minPoints) &&
            (identical(other.selectedAssociation, selectedAssociation) ||
                other.selectedAssociation == selectedAssociation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(spots),
      const DeepCollectionEquality().hash(filteredSpots),
      hasLoadError,
      isRefreshing,
      lastUpdatedAt,
      nextRefreshAt,
      sortOrder,
      const DeepCollectionEquality().hash(distanceBySummitCode),
      const DeepCollectionEquality().hash(availableBands),
      const DeepCollectionEquality().hash(availableModes),
      const DeepCollectionEquality().hash(availableAssociations),
      selectedBand,
      selectedMode,
      minPoints,
      selectedAssociation);

  @override
  String toString() {
    return 'SotaSpotsState(spots: $spots, filteredSpots: $filteredSpots, hasLoadError: $hasLoadError, isRefreshing: $isRefreshing, lastUpdatedAt: $lastUpdatedAt, nextRefreshAt: $nextRefreshAt, sortOrder: $sortOrder, distanceBySummitCode: $distanceBySummitCode, availableBands: $availableBands, availableModes: $availableModes, availableAssociations: $availableAssociations, selectedBand: $selectedBand, selectedMode: $selectedMode, minPoints: $minPoints, selectedAssociation: $selectedAssociation)';
  }
}

/// @nodoc
abstract mixin class $SotaSpotsStateCopyWith<$Res> {
  factory $SotaSpotsStateCopyWith(
          SotaSpotsState value, $Res Function(SotaSpotsState) _then) =
      _$SotaSpotsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<SotaSpot> spots,
      List<SotaSpot> filteredSpots,
      bool hasLoadError,
      bool isRefreshing,
      DateTime? lastUpdatedAt,
      DateTime? nextRefreshAt,
      SotaSpotsSortOrder sortOrder,
      Map<String, double> distanceBySummitCode,
      List<String> availableBands,
      List<String> availableModes,
      List<String> availableAssociations,
      String? selectedBand,
      String? selectedMode,
      int? minPoints,
      String? selectedAssociation});
}

/// @nodoc
class _$SotaSpotsStateCopyWithImpl<$Res>
    implements $SotaSpotsStateCopyWith<$Res> {
  _$SotaSpotsStateCopyWithImpl(this._self, this._then);

  final SotaSpotsState _self;
  final $Res Function(SotaSpotsState) _then;

  /// Create a copy of SotaSpotsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spots = null,
    Object? filteredSpots = null,
    Object? hasLoadError = null,
    Object? isRefreshing = null,
    Object? lastUpdatedAt = freezed,
    Object? nextRefreshAt = freezed,
    Object? sortOrder = null,
    Object? distanceBySummitCode = null,
    Object? availableBands = null,
    Object? availableModes = null,
    Object? availableAssociations = null,
    Object? selectedBand = freezed,
    Object? selectedMode = freezed,
    Object? minPoints = freezed,
    Object? selectedAssociation = freezed,
  }) {
    return _then(_self.copyWith(
      spots: null == spots
          ? _self.spots
          : spots // ignore: cast_nullable_to_non_nullable
              as List<SotaSpot>,
      filteredSpots: null == filteredSpots
          ? _self.filteredSpots
          : filteredSpots // ignore: cast_nullable_to_non_nullable
              as List<SotaSpot>,
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
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SotaSpotsSortOrder,
      distanceBySummitCode: null == distanceBySummitCode
          ? _self.distanceBySummitCode
          : distanceBySummitCode // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      availableBands: null == availableBands
          ? _self.availableBands
          : availableBands // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availableModes: null == availableModes
          ? _self.availableModes
          : availableModes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availableAssociations: null == availableAssociations
          ? _self.availableAssociations
          : availableAssociations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedBand: freezed == selectedBand
          ? _self.selectedBand
          : selectedBand // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedMode: freezed == selectedMode
          ? _self.selectedMode
          : selectedMode // ignore: cast_nullable_to_non_nullable
              as String?,
      minPoints: freezed == minPoints
          ? _self.minPoints
          : minPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedAssociation: freezed == selectedAssociation
          ? _self.selectedAssociation
          : selectedAssociation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SotaSpotsState].
extension SotaSpotsStatePatterns on SotaSpotsState {
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
    TResult Function(_SotaSpotsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SotaSpotsState() when $default != null:
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
    TResult Function(_SotaSpotsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpotsState():
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
    TResult? Function(_SotaSpotsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpotsState() when $default != null:
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
            List<SotaSpot> spots,
            List<SotaSpot> filteredSpots,
            bool hasLoadError,
            bool isRefreshing,
            DateTime? lastUpdatedAt,
            DateTime? nextRefreshAt,
            SotaSpotsSortOrder sortOrder,
            Map<String, double> distanceBySummitCode,
            List<String> availableBands,
            List<String> availableModes,
            List<String> availableAssociations,
            String? selectedBand,
            String? selectedMode,
            int? minPoints,
            String? selectedAssociation)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SotaSpotsState() when $default != null:
        return $default(
            _that.spots,
            _that.filteredSpots,
            _that.hasLoadError,
            _that.isRefreshing,
            _that.lastUpdatedAt,
            _that.nextRefreshAt,
            _that.sortOrder,
            _that.distanceBySummitCode,
            _that.availableBands,
            _that.availableModes,
            _that.availableAssociations,
            _that.selectedBand,
            _that.selectedMode,
            _that.minPoints,
            _that.selectedAssociation);
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
            List<SotaSpot> spots,
            List<SotaSpot> filteredSpots,
            bool hasLoadError,
            bool isRefreshing,
            DateTime? lastUpdatedAt,
            DateTime? nextRefreshAt,
            SotaSpotsSortOrder sortOrder,
            Map<String, double> distanceBySummitCode,
            List<String> availableBands,
            List<String> availableModes,
            List<String> availableAssociations,
            String? selectedBand,
            String? selectedMode,
            int? minPoints,
            String? selectedAssociation)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpotsState():
        return $default(
            _that.spots,
            _that.filteredSpots,
            _that.hasLoadError,
            _that.isRefreshing,
            _that.lastUpdatedAt,
            _that.nextRefreshAt,
            _that.sortOrder,
            _that.distanceBySummitCode,
            _that.availableBands,
            _that.availableModes,
            _that.availableAssociations,
            _that.selectedBand,
            _that.selectedMode,
            _that.minPoints,
            _that.selectedAssociation);
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
            List<SotaSpot> spots,
            List<SotaSpot> filteredSpots,
            bool hasLoadError,
            bool isRefreshing,
            DateTime? lastUpdatedAt,
            DateTime? nextRefreshAt,
            SotaSpotsSortOrder sortOrder,
            Map<String, double> distanceBySummitCode,
            List<String> availableBands,
            List<String> availableModes,
            List<String> availableAssociations,
            String? selectedBand,
            String? selectedMode,
            int? minPoints,
            String? selectedAssociation)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SotaSpotsState() when $default != null:
        return $default(
            _that.spots,
            _that.filteredSpots,
            _that.hasLoadError,
            _that.isRefreshing,
            _that.lastUpdatedAt,
            _that.nextRefreshAt,
            _that.sortOrder,
            _that.distanceBySummitCode,
            _that.availableBands,
            _that.availableModes,
            _that.availableAssociations,
            _that.selectedBand,
            _that.selectedMode,
            _that.minPoints,
            _that.selectedAssociation);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SotaSpotsState implements SotaSpotsState {
  const _SotaSpotsState(
      {final List<SotaSpot> spots = const <SotaSpot>[],
      final List<SotaSpot> filteredSpots = const <SotaSpot>[],
      this.hasLoadError = false,
      this.isRefreshing = false,
      this.lastUpdatedAt,
      this.nextRefreshAt,
      this.sortOrder = SotaSpotsSortOrder.time,
      final Map<String, double> distanceBySummitCode = const <String, double>{},
      final List<String> availableBands = const <String>[],
      final List<String> availableModes = const <String>[],
      final List<String> availableAssociations = const <String>[],
      this.selectedBand,
      this.selectedMode,
      this.minPoints,
      this.selectedAssociation})
      : _spots = spots,
        _filteredSpots = filteredSpots,
        _distanceBySummitCode = distanceBySummitCode,
        _availableBands = availableBands,
        _availableModes = availableModes,
        _availableAssociations = availableAssociations;

  final List<SotaSpot> _spots;
  @override
  @JsonKey()
  List<SotaSpot> get spots {
    if (_spots is EqualUnmodifiableListView) return _spots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spots);
  }

  final List<SotaSpot> _filteredSpots;
  @override
  @JsonKey()
  List<SotaSpot> get filteredSpots {
    if (_filteredSpots is EqualUnmodifiableListView) return _filteredSpots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredSpots);
  }

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
  @JsonKey()
  final SotaSpotsSortOrder sortOrder;
  final Map<String, double> _distanceBySummitCode;
  @override
  @JsonKey()
  Map<String, double> get distanceBySummitCode {
    if (_distanceBySummitCode is EqualUnmodifiableMapView)
      return _distanceBySummitCode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_distanceBySummitCode);
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

  final List<String> _availableAssociations;
  @override
  @JsonKey()
  List<String> get availableAssociations {
    if (_availableAssociations is EqualUnmodifiableListView)
      return _availableAssociations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableAssociations);
  }

  @override
  final String? selectedBand;
  @override
  final String? selectedMode;
  @override
  final int? minPoints;
  @override
  final String? selectedAssociation;

  /// Create a copy of SotaSpotsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SotaSpotsStateCopyWith<_SotaSpotsState> get copyWith =>
      __$SotaSpotsStateCopyWithImpl<_SotaSpotsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SotaSpotsState &&
            const DeepCollectionEquality().equals(other._spots, _spots) &&
            const DeepCollectionEquality()
                .equals(other._filteredSpots, _filteredSpots) &&
            (identical(other.hasLoadError, hasLoadError) ||
                other.hasLoadError == hasLoadError) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt) &&
            (identical(other.nextRefreshAt, nextRefreshAt) ||
                other.nextRefreshAt == nextRefreshAt) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality()
                .equals(other._distanceBySummitCode, _distanceBySummitCode) &&
            const DeepCollectionEquality()
                .equals(other._availableBands, _availableBands) &&
            const DeepCollectionEquality()
                .equals(other._availableModes, _availableModes) &&
            const DeepCollectionEquality()
                .equals(other._availableAssociations, _availableAssociations) &&
            (identical(other.selectedBand, selectedBand) ||
                other.selectedBand == selectedBand) &&
            (identical(other.selectedMode, selectedMode) ||
                other.selectedMode == selectedMode) &&
            (identical(other.minPoints, minPoints) ||
                other.minPoints == minPoints) &&
            (identical(other.selectedAssociation, selectedAssociation) ||
                other.selectedAssociation == selectedAssociation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_spots),
      const DeepCollectionEquality().hash(_filteredSpots),
      hasLoadError,
      isRefreshing,
      lastUpdatedAt,
      nextRefreshAt,
      sortOrder,
      const DeepCollectionEquality().hash(_distanceBySummitCode),
      const DeepCollectionEquality().hash(_availableBands),
      const DeepCollectionEquality().hash(_availableModes),
      const DeepCollectionEquality().hash(_availableAssociations),
      selectedBand,
      selectedMode,
      minPoints,
      selectedAssociation);

  @override
  String toString() {
    return 'SotaSpotsState(spots: $spots, filteredSpots: $filteredSpots, hasLoadError: $hasLoadError, isRefreshing: $isRefreshing, lastUpdatedAt: $lastUpdatedAt, nextRefreshAt: $nextRefreshAt, sortOrder: $sortOrder, distanceBySummitCode: $distanceBySummitCode, availableBands: $availableBands, availableModes: $availableModes, availableAssociations: $availableAssociations, selectedBand: $selectedBand, selectedMode: $selectedMode, minPoints: $minPoints, selectedAssociation: $selectedAssociation)';
  }
}

/// @nodoc
abstract mixin class _$SotaSpotsStateCopyWith<$Res>
    implements $SotaSpotsStateCopyWith<$Res> {
  factory _$SotaSpotsStateCopyWith(
          _SotaSpotsState value, $Res Function(_SotaSpotsState) _then) =
      __$SotaSpotsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<SotaSpot> spots,
      List<SotaSpot> filteredSpots,
      bool hasLoadError,
      bool isRefreshing,
      DateTime? lastUpdatedAt,
      DateTime? nextRefreshAt,
      SotaSpotsSortOrder sortOrder,
      Map<String, double> distanceBySummitCode,
      List<String> availableBands,
      List<String> availableModes,
      List<String> availableAssociations,
      String? selectedBand,
      String? selectedMode,
      int? minPoints,
      String? selectedAssociation});
}

/// @nodoc
class __$SotaSpotsStateCopyWithImpl<$Res>
    implements _$SotaSpotsStateCopyWith<$Res> {
  __$SotaSpotsStateCopyWithImpl(this._self, this._then);

  final _SotaSpotsState _self;
  final $Res Function(_SotaSpotsState) _then;

  /// Create a copy of SotaSpotsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? spots = null,
    Object? filteredSpots = null,
    Object? hasLoadError = null,
    Object? isRefreshing = null,
    Object? lastUpdatedAt = freezed,
    Object? nextRefreshAt = freezed,
    Object? sortOrder = null,
    Object? distanceBySummitCode = null,
    Object? availableBands = null,
    Object? availableModes = null,
    Object? availableAssociations = null,
    Object? selectedBand = freezed,
    Object? selectedMode = freezed,
    Object? minPoints = freezed,
    Object? selectedAssociation = freezed,
  }) {
    return _then(_SotaSpotsState(
      spots: null == spots
          ? _self._spots
          : spots // ignore: cast_nullable_to_non_nullable
              as List<SotaSpot>,
      filteredSpots: null == filteredSpots
          ? _self._filteredSpots
          : filteredSpots // ignore: cast_nullable_to_non_nullable
              as List<SotaSpot>,
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
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SotaSpotsSortOrder,
      distanceBySummitCode: null == distanceBySummitCode
          ? _self._distanceBySummitCode
          : distanceBySummitCode // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      availableBands: null == availableBands
          ? _self._availableBands
          : availableBands // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availableModes: null == availableModes
          ? _self._availableModes
          : availableModes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availableAssociations: null == availableAssociations
          ? _self._availableAssociations
          : availableAssociations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedBand: freezed == selectedBand
          ? _self.selectedBand
          : selectedBand // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedMode: freezed == selectedMode
          ? _self.selectedMode
          : selectedMode // ignore: cast_nullable_to_non_nullable
              as String?,
      minPoints: freezed == minPoints
          ? _self.minPoints
          : minPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedAssociation: freezed == selectedAssociation
          ? _self.selectedAssociation
          : selectedAssociation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
