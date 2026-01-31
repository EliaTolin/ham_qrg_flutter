// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_issue_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportIssueState {
  Repeater get repeater;
  String get description;
  bool get isConfirmed;
  bool get isSubmitting;

  /// Create a copy of ReportIssueState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportIssueStateCopyWith<ReportIssueState> get copyWith =>
      _$ReportIssueStateCopyWithImpl<ReportIssueState>(
          this as ReportIssueState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportIssueState &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isConfirmed, isConfirmed) ||
                other.isConfirmed == isConfirmed) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, repeater, description, isConfirmed, isSubmitting);

  @override
  String toString() {
    return 'ReportIssueState(repeater: $repeater, description: $description, isConfirmed: $isConfirmed, isSubmitting: $isSubmitting)';
  }
}

/// @nodoc
abstract mixin class $ReportIssueStateCopyWith<$Res> {
  factory $ReportIssueStateCopyWith(
          ReportIssueState value, $Res Function(ReportIssueState) _then) =
      _$ReportIssueStateCopyWithImpl;
  @useResult
  $Res call(
      {Repeater repeater,
      String description,
      bool isConfirmed,
      bool isSubmitting});

  $RepeaterCopyWith<$Res> get repeater;
}

/// @nodoc
class _$ReportIssueStateCopyWithImpl<$Res>
    implements $ReportIssueStateCopyWith<$Res> {
  _$ReportIssueStateCopyWithImpl(this._self, this._then);

  final ReportIssueState _self;
  final $Res Function(ReportIssueState) _then;

  /// Create a copy of ReportIssueState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeater = null,
    Object? description = null,
    Object? isConfirmed = null,
    Object? isSubmitting = null,
  }) {
    return _then(_self.copyWith(
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isConfirmed: null == isConfirmed
          ? _self.isConfirmed
          : isConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ReportIssueState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReportIssueState].
extension ReportIssueStatePatterns on ReportIssueState {
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
    TResult Function(_ReportIssueState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportIssueState() when $default != null:
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
    TResult Function(_ReportIssueState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportIssueState():
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
    TResult? Function(_ReportIssueState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportIssueState() when $default != null:
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
    TResult Function(Repeater repeater, String description, bool isConfirmed,
            bool isSubmitting)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportIssueState() when $default != null:
        return $default(_that.repeater, _that.description, _that.isConfirmed,
            _that.isSubmitting);
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
    TResult Function(Repeater repeater, String description, bool isConfirmed,
            bool isSubmitting)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportIssueState():
        return $default(_that.repeater, _that.description, _that.isConfirmed,
            _that.isSubmitting);
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
    TResult? Function(Repeater repeater, String description, bool isConfirmed,
            bool isSubmitting)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportIssueState() when $default != null:
        return $default(_that.repeater, _that.description, _that.isConfirmed,
            _that.isSubmitting);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReportIssueState implements ReportIssueState {
  const _ReportIssueState(
      {required this.repeater,
      this.description = '',
      this.isConfirmed = false,
      this.isSubmitting = false});

  @override
  final Repeater repeater;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool isConfirmed;
  @override
  @JsonKey()
  final bool isSubmitting;

  /// Create a copy of ReportIssueState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportIssueStateCopyWith<_ReportIssueState> get copyWith =>
      __$ReportIssueStateCopyWithImpl<_ReportIssueState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportIssueState &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isConfirmed, isConfirmed) ||
                other.isConfirmed == isConfirmed) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, repeater, description, isConfirmed, isSubmitting);

  @override
  String toString() {
    return 'ReportIssueState(repeater: $repeater, description: $description, isConfirmed: $isConfirmed, isSubmitting: $isSubmitting)';
  }
}

/// @nodoc
abstract mixin class _$ReportIssueStateCopyWith<$Res>
    implements $ReportIssueStateCopyWith<$Res> {
  factory _$ReportIssueStateCopyWith(
          _ReportIssueState value, $Res Function(_ReportIssueState) _then) =
      __$ReportIssueStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Repeater repeater,
      String description,
      bool isConfirmed,
      bool isSubmitting});

  @override
  $RepeaterCopyWith<$Res> get repeater;
}

/// @nodoc
class __$ReportIssueStateCopyWithImpl<$Res>
    implements _$ReportIssueStateCopyWith<$Res> {
  __$ReportIssueStateCopyWithImpl(this._self, this._then);

  final _ReportIssueState _self;
  final $Res Function(_ReportIssueState) _then;

  /// Create a copy of ReportIssueState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? repeater = null,
    Object? description = null,
    Object? isConfirmed = null,
    Object? isSubmitting = null,
  }) {
    return _then(_ReportIssueState(
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isConfirmed: null == isConfirmed
          ? _self.isConfirmed
          : isConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ReportIssueState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }
}

// dart format on
