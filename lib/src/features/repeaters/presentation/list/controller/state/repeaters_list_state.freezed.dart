// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeaters_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepeatersListState {
  List<Repeater> get repeaters;
  LocationErrorType? get locationError;
  Set<AccessMode> get selectedModes;
  double get radiusKm;

  /// Create a copy of RepeatersListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeatersListStateCopyWith<RepeatersListState> get copyWith =>
      _$RepeatersListStateCopyWithImpl<RepeatersListState>(
          this as RepeatersListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepeatersListState &&
            const DeepCollectionEquality().equals(other.repeaters, repeaters) &&
            (identical(other.locationError, locationError) ||
                other.locationError == locationError) &&
            const DeepCollectionEquality()
                .equals(other.selectedModes, selectedModes) &&
            (identical(other.radiusKm, radiusKm) ||
                other.radiusKm == radiusKm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(repeaters),
      locationError,
      const DeepCollectionEquality().hash(selectedModes),
      radiusKm);

  @override
  String toString() {
    return 'RepeatersListState(repeaters: $repeaters, locationError: $locationError, selectedModes: $selectedModes, radiusKm: $radiusKm)';
  }
}

/// @nodoc
abstract mixin class $RepeatersListStateCopyWith<$Res> {
  factory $RepeatersListStateCopyWith(
          RepeatersListState value, $Res Function(RepeatersListState) _then) =
      _$RepeatersListStateCopyWithImpl;
  @useResult
  $Res call(
      {List<Repeater> repeaters,
      LocationErrorType? locationError,
      Set<AccessMode> selectedModes,
      double radiusKm});
}

/// @nodoc
class _$RepeatersListStateCopyWithImpl<$Res>
    implements $RepeatersListStateCopyWith<$Res> {
  _$RepeatersListStateCopyWithImpl(this._self, this._then);

  final RepeatersListState _self;
  final $Res Function(RepeatersListState) _then;

  /// Create a copy of RepeatersListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeaters = null,
    Object? locationError = freezed,
    Object? selectedModes = null,
    Object? radiusKm = null,
  }) {
    return _then(_self.copyWith(
      repeaters: null == repeaters
          ? _self.repeaters
          : repeaters // ignore: cast_nullable_to_non_nullable
              as List<Repeater>,
      locationError: freezed == locationError
          ? _self.locationError
          : locationError // ignore: cast_nullable_to_non_nullable
              as LocationErrorType?,
      selectedModes: null == selectedModes
          ? _self.selectedModes
          : selectedModes // ignore: cast_nullable_to_non_nullable
              as Set<AccessMode>,
      radiusKm: null == radiusKm
          ? _self.radiusKm
          : radiusKm // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [RepeatersListState].
extension RepeatersListStatePatterns on RepeatersListState {
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
    TResult Function(_RepeatersListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeatersListState() when $default != null:
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
    TResult Function(_RepeatersListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeatersListState():
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
    TResult? Function(_RepeatersListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeatersListState() when $default != null:
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
    TResult Function(List<Repeater> repeaters, LocationErrorType? locationError,
            Set<AccessMode> selectedModes, double radiusKm)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeatersListState() when $default != null:
        return $default(_that.repeaters, _that.locationError,
            _that.selectedModes, _that.radiusKm);
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
    TResult Function(List<Repeater> repeaters, LocationErrorType? locationError,
            Set<AccessMode> selectedModes, double radiusKm)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeatersListState():
        return $default(_that.repeaters, _that.locationError,
            _that.selectedModes, _that.radiusKm);
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
            LocationErrorType? locationError,
            Set<AccessMode> selectedModes,
            double radiusKm)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeatersListState() when $default != null:
        return $default(_that.repeaters, _that.locationError,
            _that.selectedModes, _that.radiusKm);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RepeatersListState implements RepeatersListState {
  const _RepeatersListState(
      {final List<Repeater> repeaters = const <Repeater>[],
      this.locationError,
      final Set<AccessMode> selectedModes = const <AccessMode>{},
      this.radiusKm = 100})
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
  final LocationErrorType? locationError;
  final Set<AccessMode> _selectedModes;
  @override
  @JsonKey()
  Set<AccessMode> get selectedModes {
    if (_selectedModes is EqualUnmodifiableSetView) return _selectedModes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedModes);
  }

  @override
  @JsonKey()
  final double radiusKm;

  /// Create a copy of RepeatersListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeatersListStateCopyWith<_RepeatersListState> get copyWith =>
      __$RepeatersListStateCopyWithImpl<_RepeatersListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeatersListState &&
            const DeepCollectionEquality()
                .equals(other._repeaters, _repeaters) &&
            (identical(other.locationError, locationError) ||
                other.locationError == locationError) &&
            const DeepCollectionEquality()
                .equals(other._selectedModes, _selectedModes) &&
            (identical(other.radiusKm, radiusKm) ||
                other.radiusKm == radiusKm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_repeaters),
      locationError,
      const DeepCollectionEquality().hash(_selectedModes),
      radiusKm);

  @override
  String toString() {
    return 'RepeatersListState(repeaters: $repeaters, locationError: $locationError, selectedModes: $selectedModes, radiusKm: $radiusKm)';
  }
}

/// @nodoc
abstract mixin class _$RepeatersListStateCopyWith<$Res>
    implements $RepeatersListStateCopyWith<$Res> {
  factory _$RepeatersListStateCopyWith(
          _RepeatersListState value, $Res Function(_RepeatersListState) _then) =
      __$RepeatersListStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Repeater> repeaters,
      LocationErrorType? locationError,
      Set<AccessMode> selectedModes,
      double radiusKm});
}

/// @nodoc
class __$RepeatersListStateCopyWithImpl<$Res>
    implements _$RepeatersListStateCopyWith<$Res> {
  __$RepeatersListStateCopyWithImpl(this._self, this._then);

  final _RepeatersListState _self;
  final $Res Function(_RepeatersListState) _then;

  /// Create a copy of RepeatersListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? repeaters = null,
    Object? locationError = freezed,
    Object? selectedModes = null,
    Object? radiusKm = null,
  }) {
    return _then(_RepeatersListState(
      repeaters: null == repeaters
          ? _self._repeaters
          : repeaters // ignore: cast_nullable_to_non_nullable
              as List<Repeater>,
      locationError: freezed == locationError
          ? _self.locationError
          : locationError // ignore: cast_nullable_to_non_nullable
              as LocationErrorType?,
      selectedModes: null == selectedModes
          ? _self._selectedModes
          : selectedModes // ignore: cast_nullable_to_non_nullable
              as Set<AccessMode>,
      radiusKm: null == radiusKm
          ? _self.radiusKm
          : radiusKm // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
