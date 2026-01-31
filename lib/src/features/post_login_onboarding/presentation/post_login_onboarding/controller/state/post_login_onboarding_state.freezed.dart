// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_login_onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostLoginOnboardingState {
  int get currentStep;
  UserType? get selectedUserType;
  String get callsign;
  bool get isSubmitting;

  /// For SWL users: whether they have a callsign (null = not yet chosen)
  bool? get hasSwlCallsign;

  /// Create a copy of PostLoginOnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostLoginOnboardingStateCopyWith<PostLoginOnboardingState> get copyWith =>
      _$PostLoginOnboardingStateCopyWithImpl<PostLoginOnboardingState>(
          this as PostLoginOnboardingState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostLoginOnboardingState &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.selectedUserType, selectedUserType) ||
                other.selectedUserType == selectedUserType) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.hasSwlCallsign, hasSwlCallsign) ||
                other.hasSwlCallsign == hasSwlCallsign));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStep, selectedUserType,
      callsign, isSubmitting, hasSwlCallsign);

  @override
  String toString() {
    return 'PostLoginOnboardingState(currentStep: $currentStep, selectedUserType: $selectedUserType, callsign: $callsign, isSubmitting: $isSubmitting, hasSwlCallsign: $hasSwlCallsign)';
  }
}

/// @nodoc
abstract mixin class $PostLoginOnboardingStateCopyWith<$Res> {
  factory $PostLoginOnboardingStateCopyWith(PostLoginOnboardingState value,
          $Res Function(PostLoginOnboardingState) _then) =
      _$PostLoginOnboardingStateCopyWithImpl;
  @useResult
  $Res call(
      {int currentStep,
      UserType? selectedUserType,
      String callsign,
      bool isSubmitting,
      bool? hasSwlCallsign});
}

/// @nodoc
class _$PostLoginOnboardingStateCopyWithImpl<$Res>
    implements $PostLoginOnboardingStateCopyWith<$Res> {
  _$PostLoginOnboardingStateCopyWithImpl(this._self, this._then);

  final PostLoginOnboardingState _self;
  final $Res Function(PostLoginOnboardingState) _then;

  /// Create a copy of PostLoginOnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? selectedUserType = freezed,
    Object? callsign = null,
    Object? isSubmitting = null,
    Object? hasSwlCallsign = freezed,
  }) {
    return _then(_self.copyWith(
      currentStep: null == currentStep
          ? _self.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      selectedUserType: freezed == selectedUserType
          ? _self.selectedUserType
          : selectedUserType // ignore: cast_nullable_to_non_nullable
              as UserType?,
      callsign: null == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      hasSwlCallsign: freezed == hasSwlCallsign
          ? _self.hasSwlCallsign
          : hasSwlCallsign // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PostLoginOnboardingState].
extension PostLoginOnboardingStatePatterns on PostLoginOnboardingState {
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
    TResult Function(_PostLoginOnboardingState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostLoginOnboardingState() when $default != null:
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
    TResult Function(_PostLoginOnboardingState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostLoginOnboardingState():
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
    TResult? Function(_PostLoginOnboardingState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostLoginOnboardingState() when $default != null:
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
    TResult Function(int currentStep, UserType? selectedUserType,
            String callsign, bool isSubmitting, bool? hasSwlCallsign)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostLoginOnboardingState() when $default != null:
        return $default(_that.currentStep, _that.selectedUserType,
            _that.callsign, _that.isSubmitting, _that.hasSwlCallsign);
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
    TResult Function(int currentStep, UserType? selectedUserType,
            String callsign, bool isSubmitting, bool? hasSwlCallsign)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostLoginOnboardingState():
        return $default(_that.currentStep, _that.selectedUserType,
            _that.callsign, _that.isSubmitting, _that.hasSwlCallsign);
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
    TResult? Function(int currentStep, UserType? selectedUserType,
            String callsign, bool isSubmitting, bool? hasSwlCallsign)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostLoginOnboardingState() when $default != null:
        return $default(_that.currentStep, _that.selectedUserType,
            _that.callsign, _that.isSubmitting, _that.hasSwlCallsign);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PostLoginOnboardingState implements PostLoginOnboardingState {
  const _PostLoginOnboardingState(
      {this.currentStep = 0,
      this.selectedUserType,
      this.callsign = '',
      this.isSubmitting = false,
      this.hasSwlCallsign});

  @override
  @JsonKey()
  final int currentStep;
  @override
  final UserType? selectedUserType;
  @override
  @JsonKey()
  final String callsign;
  @override
  @JsonKey()
  final bool isSubmitting;

  /// For SWL users: whether they have a callsign (null = not yet chosen)
  @override
  final bool? hasSwlCallsign;

  /// Create a copy of PostLoginOnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostLoginOnboardingStateCopyWith<_PostLoginOnboardingState> get copyWith =>
      __$PostLoginOnboardingStateCopyWithImpl<_PostLoginOnboardingState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostLoginOnboardingState &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.selectedUserType, selectedUserType) ||
                other.selectedUserType == selectedUserType) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.hasSwlCallsign, hasSwlCallsign) ||
                other.hasSwlCallsign == hasSwlCallsign));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStep, selectedUserType,
      callsign, isSubmitting, hasSwlCallsign);

  @override
  String toString() {
    return 'PostLoginOnboardingState(currentStep: $currentStep, selectedUserType: $selectedUserType, callsign: $callsign, isSubmitting: $isSubmitting, hasSwlCallsign: $hasSwlCallsign)';
  }
}

/// @nodoc
abstract mixin class _$PostLoginOnboardingStateCopyWith<$Res>
    implements $PostLoginOnboardingStateCopyWith<$Res> {
  factory _$PostLoginOnboardingStateCopyWith(_PostLoginOnboardingState value,
          $Res Function(_PostLoginOnboardingState) _then) =
      __$PostLoginOnboardingStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int currentStep,
      UserType? selectedUserType,
      String callsign,
      bool isSubmitting,
      bool? hasSwlCallsign});
}

/// @nodoc
class __$PostLoginOnboardingStateCopyWithImpl<$Res>
    implements _$PostLoginOnboardingStateCopyWith<$Res> {
  __$PostLoginOnboardingStateCopyWithImpl(this._self, this._then);

  final _PostLoginOnboardingState _self;
  final $Res Function(_PostLoginOnboardingState) _then;

  /// Create a copy of PostLoginOnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentStep = null,
    Object? selectedUserType = freezed,
    Object? callsign = null,
    Object? isSubmitting = null,
    Object? hasSwlCallsign = freezed,
  }) {
    return _then(_PostLoginOnboardingState(
      currentStep: null == currentStep
          ? _self.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      selectedUserType: freezed == selectedUserType
          ? _self.selectedUserType
          : selectedUserType // ignore: cast_nullable_to_non_nullable
              as UserType?,
      callsign: null == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      hasSwlCallsign: freezed == hasSwlCallsign
          ? _self.hasSwlCallsign
          : hasSwlCallsign // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
