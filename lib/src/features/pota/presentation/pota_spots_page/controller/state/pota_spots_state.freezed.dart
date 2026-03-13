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
                other.isRefreshing == isRefreshing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(spots),
      const DeepCollectionEquality().hash(filteredSpots),
      searchQuery,
      hasLoadError,
      isRefreshing);

  @override
  String toString() {
    return 'PotaSpotsState(spots: $spots, filteredSpots: $filteredSpots, searchQuery: $searchQuery, hasLoadError: $hasLoadError, isRefreshing: $isRefreshing)';
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
      bool isRefreshing});
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
    TResult Function(List<PotaSpot> spots, List<PotaSpot> filteredSpots,
            String searchQuery, bool hasLoadError, bool isRefreshing)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PotaSpotsState() when $default != null:
        return $default(_that.spots, _that.filteredSpots, _that.searchQuery,
            _that.hasLoadError, _that.isRefreshing);
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
    TResult Function(List<PotaSpot> spots, List<PotaSpot> filteredSpots,
            String searchQuery, bool hasLoadError, bool isRefreshing)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpotsState():
        return $default(_that.spots, _that.filteredSpots, _that.searchQuery,
            _that.hasLoadError, _that.isRefreshing);
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
    TResult? Function(List<PotaSpot> spots, List<PotaSpot> filteredSpots,
            String searchQuery, bool hasLoadError, bool isRefreshing)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PotaSpotsState() when $default != null:
        return $default(_that.spots, _that.filteredSpots, _that.searchQuery,
            _that.hasLoadError, _that.isRefreshing);
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
      this.isRefreshing = false})
      : _spots = spots,
        _filteredSpots = filteredSpots;

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
                other.isRefreshing == isRefreshing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_spots),
      const DeepCollectionEquality().hash(_filteredSpots),
      searchQuery,
      hasLoadError,
      isRefreshing);

  @override
  String toString() {
    return 'PotaSpotsState(spots: $spots, filteredSpots: $filteredSpots, searchQuery: $searchQuery, hasLoadError: $hasLoadError, isRefreshing: $isRefreshing)';
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
      bool isRefreshing});
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
    ));
  }
}

// dart format on
