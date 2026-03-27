// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnboardingState {
  /// 0=welcome, 1=location, 2=userType, 3=callsign, 4=discovery, 5=telegram
  int get currentStep;
  int get welcomeCardIndex;
  UserType? get selectedUserType;
  String get callsign;

  /// For SWL users: whether they have a callsign (null = not yet chosen)
  bool? get hasSwlCallsign;
  bool get isSubmitting;
  bool get locationGranted;

  /// Nearest repeater for the discovery step
  Repeater? get nearestRepeater;
  bool get isLoadingDiscovery;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      _$OnboardingStateCopyWithImpl<OnboardingState>(
          this as OnboardingState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnboardingState &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.welcomeCardIndex, welcomeCardIndex) ||
                other.welcomeCardIndex == welcomeCardIndex) &&
            (identical(other.selectedUserType, selectedUserType) ||
                other.selectedUserType == selectedUserType) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.hasSwlCallsign, hasSwlCallsign) ||
                other.hasSwlCallsign == hasSwlCallsign) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.locationGranted, locationGranted) ||
                other.locationGranted == locationGranted) &&
            (identical(other.nearestRepeater, nearestRepeater) ||
                other.nearestRepeater == nearestRepeater) &&
            (identical(other.isLoadingDiscovery, isLoadingDiscovery) ||
                other.isLoadingDiscovery == isLoadingDiscovery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentStep,
      welcomeCardIndex,
      selectedUserType,
      callsign,
      hasSwlCallsign,
      isSubmitting,
      locationGranted,
      nearestRepeater,
      isLoadingDiscovery);

  @override
  String toString() {
    return 'OnboardingState(currentStep: $currentStep, welcomeCardIndex: $welcomeCardIndex, selectedUserType: $selectedUserType, callsign: $callsign, hasSwlCallsign: $hasSwlCallsign, isSubmitting: $isSubmitting, locationGranted: $locationGranted, nearestRepeater: $nearestRepeater, isLoadingDiscovery: $isLoadingDiscovery)';
  }
}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) _then) =
      _$OnboardingStateCopyWithImpl;
  @useResult
  $Res call(
      {int currentStep,
      int welcomeCardIndex,
      UserType? selectedUserType,
      String callsign,
      bool? hasSwlCallsign,
      bool isSubmitting,
      bool locationGranted,
      Repeater? nearestRepeater,
      bool isLoadingDiscovery});

  $RepeaterCopyWith<$Res>? get nearestRepeater;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? welcomeCardIndex = null,
    Object? selectedUserType = freezed,
    Object? callsign = null,
    Object? hasSwlCallsign = freezed,
    Object? isSubmitting = null,
    Object? locationGranted = null,
    Object? nearestRepeater = freezed,
    Object? isLoadingDiscovery = null,
  }) {
    return _then(_self.copyWith(
      currentStep: null == currentStep
          ? _self.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      welcomeCardIndex: null == welcomeCardIndex
          ? _self.welcomeCardIndex
          : welcomeCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedUserType: freezed == selectedUserType
          ? _self.selectedUserType
          : selectedUserType // ignore: cast_nullable_to_non_nullable
              as UserType?,
      callsign: null == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String,
      hasSwlCallsign: freezed == hasSwlCallsign
          ? _self.hasSwlCallsign
          : hasSwlCallsign // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      locationGranted: null == locationGranted
          ? _self.locationGranted
          : locationGranted // ignore: cast_nullable_to_non_nullable
              as bool,
      nearestRepeater: freezed == nearestRepeater
          ? _self.nearestRepeater
          : nearestRepeater // ignore: cast_nullable_to_non_nullable
              as Repeater?,
      isLoadingDiscovery: null == isLoadingDiscovery
          ? _self.isLoadingDiscovery
          : isLoadingDiscovery // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res>? get nearestRepeater {
    if (_self.nearestRepeater == null) {
      return null;
    }

    return $RepeaterCopyWith<$Res>(_self.nearestRepeater!, (value) {
      return _then(_self.copyWith(nearestRepeater: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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
    TResult Function(_OnboardingState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OnboardingState() when $default != null:
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
    TResult Function(_OnboardingState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OnboardingState():
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
    TResult? Function(_OnboardingState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OnboardingState() when $default != null:
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
            int currentStep,
            int welcomeCardIndex,
            UserType? selectedUserType,
            String callsign,
            bool? hasSwlCallsign,
            bool isSubmitting,
            bool locationGranted,
            Repeater? nearestRepeater,
            bool isLoadingDiscovery)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OnboardingState() when $default != null:
        return $default(
            _that.currentStep,
            _that.welcomeCardIndex,
            _that.selectedUserType,
            _that.callsign,
            _that.hasSwlCallsign,
            _that.isSubmitting,
            _that.locationGranted,
            _that.nearestRepeater,
            _that.isLoadingDiscovery);
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
            int currentStep,
            int welcomeCardIndex,
            UserType? selectedUserType,
            String callsign,
            bool? hasSwlCallsign,
            bool isSubmitting,
            bool locationGranted,
            Repeater? nearestRepeater,
            bool isLoadingDiscovery)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OnboardingState():
        return $default(
            _that.currentStep,
            _that.welcomeCardIndex,
            _that.selectedUserType,
            _that.callsign,
            _that.hasSwlCallsign,
            _that.isSubmitting,
            _that.locationGranted,
            _that.nearestRepeater,
            _that.isLoadingDiscovery);
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
            int currentStep,
            int welcomeCardIndex,
            UserType? selectedUserType,
            String callsign,
            bool? hasSwlCallsign,
            bool isSubmitting,
            bool locationGranted,
            Repeater? nearestRepeater,
            bool isLoadingDiscovery)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OnboardingState() when $default != null:
        return $default(
            _that.currentStep,
            _that.welcomeCardIndex,
            _that.selectedUserType,
            _that.callsign,
            _that.hasSwlCallsign,
            _that.isSubmitting,
            _that.locationGranted,
            _that.nearestRepeater,
            _that.isLoadingDiscovery);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OnboardingState implements OnboardingState {
  const _OnboardingState(
      {this.currentStep = 0,
      this.welcomeCardIndex = 0,
      this.selectedUserType,
      this.callsign = '',
      this.hasSwlCallsign,
      this.isSubmitting = false,
      this.locationGranted = false,
      this.nearestRepeater,
      this.isLoadingDiscovery = false});

  /// 0=welcome, 1=location, 2=userType, 3=callsign, 4=discovery, 5=telegram
  @override
  @JsonKey()
  final int currentStep;
  @override
  @JsonKey()
  final int welcomeCardIndex;
  @override
  final UserType? selectedUserType;
  @override
  @JsonKey()
  final String callsign;

  /// For SWL users: whether they have a callsign (null = not yet chosen)
  @override
  final bool? hasSwlCallsign;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool locationGranted;

  /// Nearest repeater for the discovery step
  @override
  final Repeater? nearestRepeater;
  @override
  @JsonKey()
  final bool isLoadingDiscovery;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OnboardingStateCopyWith<_OnboardingState> get copyWith =>
      __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnboardingState &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.welcomeCardIndex, welcomeCardIndex) ||
                other.welcomeCardIndex == welcomeCardIndex) &&
            (identical(other.selectedUserType, selectedUserType) ||
                other.selectedUserType == selectedUserType) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.hasSwlCallsign, hasSwlCallsign) ||
                other.hasSwlCallsign == hasSwlCallsign) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.locationGranted, locationGranted) ||
                other.locationGranted == locationGranted) &&
            (identical(other.nearestRepeater, nearestRepeater) ||
                other.nearestRepeater == nearestRepeater) &&
            (identical(other.isLoadingDiscovery, isLoadingDiscovery) ||
                other.isLoadingDiscovery == isLoadingDiscovery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentStep,
      welcomeCardIndex,
      selectedUserType,
      callsign,
      hasSwlCallsign,
      isSubmitting,
      locationGranted,
      nearestRepeater,
      isLoadingDiscovery);

  @override
  String toString() {
    return 'OnboardingState(currentStep: $currentStep, welcomeCardIndex: $welcomeCardIndex, selectedUserType: $selectedUserType, callsign: $callsign, hasSwlCallsign: $hasSwlCallsign, isSubmitting: $isSubmitting, locationGranted: $locationGranted, nearestRepeater: $nearestRepeater, isLoadingDiscovery: $isLoadingDiscovery)';
  }
}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(
          _OnboardingState value, $Res Function(_OnboardingState) _then) =
      __$OnboardingStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int currentStep,
      int welcomeCardIndex,
      UserType? selectedUserType,
      String callsign,
      bool? hasSwlCallsign,
      bool isSubmitting,
      bool locationGranted,
      Repeater? nearestRepeater,
      bool isLoadingDiscovery});

  @override
  $RepeaterCopyWith<$Res>? get nearestRepeater;
}

/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentStep = null,
    Object? welcomeCardIndex = null,
    Object? selectedUserType = freezed,
    Object? callsign = null,
    Object? hasSwlCallsign = freezed,
    Object? isSubmitting = null,
    Object? locationGranted = null,
    Object? nearestRepeater = freezed,
    Object? isLoadingDiscovery = null,
  }) {
    return _then(_OnboardingState(
      currentStep: null == currentStep
          ? _self.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      welcomeCardIndex: null == welcomeCardIndex
          ? _self.welcomeCardIndex
          : welcomeCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedUserType: freezed == selectedUserType
          ? _self.selectedUserType
          : selectedUserType // ignore: cast_nullable_to_non_nullable
              as UserType?,
      callsign: null == callsign
          ? _self.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String,
      hasSwlCallsign: freezed == hasSwlCallsign
          ? _self.hasSwlCallsign
          : hasSwlCallsign // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      locationGranted: null == locationGranted
          ? _self.locationGranted
          : locationGranted // ignore: cast_nullable_to_non_nullable
              as bool,
      nearestRepeater: freezed == nearestRepeater
          ? _self.nearestRepeater
          : nearestRepeater // ignore: cast_nullable_to_non_nullable
              as Repeater?,
      isLoadingDiscovery: null == isLoadingDiscovery
          ? _self.isLoadingDiscovery
          : isLoadingDiscovery // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res>? get nearestRepeater {
    if (_self.nearestRepeater == null) {
      return null;
    }

    return $RepeaterCopyWith<$Res>(_self.nearestRepeater!, (value) {
      return _then(_self.copyWith(nearestRepeater: value));
    });
  }
}

// dart format on
