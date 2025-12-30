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
  Set<RepeaterMode> get selectedModes;

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
            const DeepCollectionEquality()
                .equals(other.selectedModes, selectedModes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(repeaters),
      latitude,
      longitude,
      locationError,
      const DeepCollectionEquality().hash(selectedModes));

  @override
  String toString() {
    return 'RepeatersMapState(repeaters: $repeaters, latitude: $latitude, longitude: $longitude, locationError: $locationError, selectedModes: $selectedModes)';
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
      Set<RepeaterMode> selectedModes});
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
    Object? selectedModes = null,
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
      selectedModes: null == selectedModes
          ? _self.selectedModes
          : selectedModes // ignore: cast_nullable_to_non_nullable
              as Set<RepeaterMode>,
    ));
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
            Set<RepeaterMode> selectedModes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeatersMapState() when $default != null:
        return $default(_that.repeaters, _that.latitude, _that.longitude,
            _that.locationError, _that.selectedModes);
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
            Set<RepeaterMode> selectedModes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeatersMapState():
        return $default(_that.repeaters, _that.latitude, _that.longitude,
            _that.locationError, _that.selectedModes);
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
            Set<RepeaterMode> selectedModes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeatersMapState() when $default != null:
        return $default(_that.repeaters, _that.latitude, _that.longitude,
            _that.locationError, _that.selectedModes);
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
      final Set<RepeaterMode> selectedModes = const <RepeaterMode>{}})
      : _repeaters = repeaters,
        _selectedModes = selectedModes;

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
  final Set<RepeaterMode> _selectedModes;
  @override
  @JsonKey()
  Set<RepeaterMode> get selectedModes {
    if (_selectedModes is EqualUnmodifiableSetView) return _selectedModes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedModes);
  }

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
            const DeepCollectionEquality()
                .equals(other._selectedModes, _selectedModes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_repeaters),
      latitude,
      longitude,
      locationError,
      const DeepCollectionEquality().hash(_selectedModes));

  @override
  String toString() {
    return 'RepeatersMapState(repeaters: $repeaters, latitude: $latitude, longitude: $longitude, locationError: $locationError, selectedModes: $selectedModes)';
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
      Set<RepeaterMode> selectedModes});
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
    Object? selectedModes = null,
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
      selectedModes: null == selectedModes
          ? _self._selectedModes
          : selectedModes // ignore: cast_nullable_to_non_nullable
              as Set<RepeaterMode>,
    ));
  }
}

// dart format on
