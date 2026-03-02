// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_reports_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserReportsState {
  List<UserReport> get reports;
  UserReportStatusFilter get activeFilter;
  bool get hasLoadError;

  /// Create a copy of UserReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserReportsStateCopyWith<UserReportsState> get copyWith =>
      _$UserReportsStateCopyWithImpl<UserReportsState>(
          this as UserReportsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserReportsState &&
            const DeepCollectionEquality().equals(other.reports, reports) &&
            (identical(other.activeFilter, activeFilter) ||
                other.activeFilter == activeFilter) &&
            (identical(other.hasLoadError, hasLoadError) ||
                other.hasLoadError == hasLoadError));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(reports), activeFilter, hasLoadError);

  @override
  String toString() {
    return 'UserReportsState(reports: $reports, activeFilter: $activeFilter, hasLoadError: $hasLoadError)';
  }
}

/// @nodoc
abstract mixin class $UserReportsStateCopyWith<$Res> {
  factory $UserReportsStateCopyWith(
          UserReportsState value, $Res Function(UserReportsState) _then) =
      _$UserReportsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<UserReport> reports,
      UserReportStatusFilter activeFilter,
      bool hasLoadError});
}

/// @nodoc
class _$UserReportsStateCopyWithImpl<$Res>
    implements $UserReportsStateCopyWith<$Res> {
  _$UserReportsStateCopyWithImpl(this._self, this._then);

  final UserReportsState _self;
  final $Res Function(UserReportsState) _then;

  /// Create a copy of UserReportsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reports = null,
    Object? activeFilter = null,
    Object? hasLoadError = null,
  }) {
    return _then(_self.copyWith(
      reports: null == reports
          ? _self.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<UserReport>,
      activeFilter: null == activeFilter
          ? _self.activeFilter
          : activeFilter // ignore: cast_nullable_to_non_nullable
              as UserReportStatusFilter,
      hasLoadError: null == hasLoadError
          ? _self.hasLoadError
          : hasLoadError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserReportsState].
extension UserReportsStatePatterns on UserReportsState {
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
    TResult Function(_UserReportsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserReportsState() when $default != null:
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
    TResult Function(_UserReportsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReportsState():
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
    TResult? Function(_UserReportsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReportsState() when $default != null:
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
    TResult Function(List<UserReport> reports,
            UserReportStatusFilter activeFilter, bool hasLoadError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserReportsState() when $default != null:
        return $default(_that.reports, _that.activeFilter, _that.hasLoadError);
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
    TResult Function(List<UserReport> reports,
            UserReportStatusFilter activeFilter, bool hasLoadError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReportsState():
        return $default(_that.reports, _that.activeFilter, _that.hasLoadError);
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
    TResult? Function(List<UserReport> reports,
            UserReportStatusFilter activeFilter, bool hasLoadError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReportsState() when $default != null:
        return $default(_that.reports, _that.activeFilter, _that.hasLoadError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UserReportsState implements UserReportsState {
  const _UserReportsState(
      {required final List<UserReport> reports,
      this.activeFilter = UserReportStatusFilter.all,
      this.hasLoadError = false})
      : _reports = reports;

  final List<UserReport> _reports;
  @override
  List<UserReport> get reports {
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reports);
  }

  @override
  @JsonKey()
  final UserReportStatusFilter activeFilter;
  @override
  @JsonKey()
  final bool hasLoadError;

  /// Create a copy of UserReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserReportsStateCopyWith<_UserReportsState> get copyWith =>
      __$UserReportsStateCopyWithImpl<_UserReportsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserReportsState &&
            const DeepCollectionEquality().equals(other._reports, _reports) &&
            (identical(other.activeFilter, activeFilter) ||
                other.activeFilter == activeFilter) &&
            (identical(other.hasLoadError, hasLoadError) ||
                other.hasLoadError == hasLoadError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reports),
      activeFilter,
      hasLoadError);

  @override
  String toString() {
    return 'UserReportsState(reports: $reports, activeFilter: $activeFilter, hasLoadError: $hasLoadError)';
  }
}

/// @nodoc
abstract mixin class _$UserReportsStateCopyWith<$Res>
    implements $UserReportsStateCopyWith<$Res> {
  factory _$UserReportsStateCopyWith(
          _UserReportsState value, $Res Function(_UserReportsState) _then) =
      __$UserReportsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<UserReport> reports,
      UserReportStatusFilter activeFilter,
      bool hasLoadError});
}

/// @nodoc
class __$UserReportsStateCopyWithImpl<$Res>
    implements _$UserReportsStateCopyWith<$Res> {
  __$UserReportsStateCopyWithImpl(this._self, this._then);

  final _UserReportsState _self;
  final $Res Function(_UserReportsState) _then;

  /// Create a copy of UserReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reports = null,
    Object? activeFilter = null,
    Object? hasLoadError = null,
  }) {
    return _then(_UserReportsState(
      reports: null == reports
          ? _self._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<UserReport>,
      activeFilter: null == activeFilter
          ? _self.activeFilter
          : activeFilter // ignore: cast_nullable_to_non_nullable
              as UserReportStatusFilter,
      hasLoadError: null == hasLoadError
          ? _self.hasLoadError
          : hasLoadError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
