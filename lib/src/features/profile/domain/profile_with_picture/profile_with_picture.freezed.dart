// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_with_picture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileWithPicture {
  Profile get profile;
  String? get propic;

  /// Create a copy of ProfileWithPicture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileWithPictureCopyWith<ProfileWithPicture> get copyWith =>
      _$ProfileWithPictureCopyWithImpl<ProfileWithPicture>(
          this as ProfileWithPicture, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileWithPicture &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.propic, propic) || other.propic == propic));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile, propic);

  @override
  String toString() {
    return 'ProfileWithPicture(profile: $profile, propic: $propic)';
  }
}

/// @nodoc
abstract mixin class $ProfileWithPictureCopyWith<$Res> {
  factory $ProfileWithPictureCopyWith(
          ProfileWithPicture value, $Res Function(ProfileWithPicture) _then) =
      _$ProfileWithPictureCopyWithImpl;
  @useResult
  $Res call({Profile profile, String? propic});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$ProfileWithPictureCopyWithImpl<$Res>
    implements $ProfileWithPictureCopyWith<$Res> {
  _$ProfileWithPictureCopyWithImpl(this._self, this._then);

  final ProfileWithPicture _self;
  final $Res Function(ProfileWithPicture) _then;

  /// Create a copy of ProfileWithPicture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? propic = freezed,
  }) {
    return _then(_self.copyWith(
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      propic: freezed == propic
          ? _self.propic
          : propic // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ProfileWithPicture
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProfileWithPicture].
extension ProfileWithPicturePatterns on ProfileWithPicture {
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
    TResult Function(_ProfileWithPicture value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileWithPicture() when $default != null:
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
    TResult Function(_ProfileWithPicture value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileWithPicture():
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
    TResult? Function(_ProfileWithPicture value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileWithPicture() when $default != null:
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
    TResult Function(Profile profile, String? propic)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileWithPicture() when $default != null:
        return $default(_that.profile, _that.propic);
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
    TResult Function(Profile profile, String? propic) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileWithPicture():
        return $default(_that.profile, _that.propic);
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
    TResult? Function(Profile profile, String? propic)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileWithPicture() when $default != null:
        return $default(_that.profile, _that.propic);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProfileWithPicture implements ProfileWithPicture {
  const _ProfileWithPicture({required this.profile, required this.propic});

  @override
  final Profile profile;
  @override
  final String? propic;

  /// Create a copy of ProfileWithPicture
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileWithPictureCopyWith<_ProfileWithPicture> get copyWith =>
      __$ProfileWithPictureCopyWithImpl<_ProfileWithPicture>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileWithPicture &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.propic, propic) || other.propic == propic));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile, propic);

  @override
  String toString() {
    return 'ProfileWithPicture(profile: $profile, propic: $propic)';
  }
}

/// @nodoc
abstract mixin class _$ProfileWithPictureCopyWith<$Res>
    implements $ProfileWithPictureCopyWith<$Res> {
  factory _$ProfileWithPictureCopyWith(
          _ProfileWithPicture value, $Res Function(_ProfileWithPicture) _then) =
      __$ProfileWithPictureCopyWithImpl;
  @override
  @useResult
  $Res call({Profile profile, String? propic});

  @override
  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$ProfileWithPictureCopyWithImpl<$Res>
    implements _$ProfileWithPictureCopyWith<$Res> {
  __$ProfileWithPictureCopyWithImpl(this._self, this._then);

  final _ProfileWithPicture _self;
  final $Res Function(_ProfileWithPicture) _then;

  /// Create a copy of ProfileWithPicture
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profile = null,
    Object? propic = freezed,
  }) {
    return _then(_ProfileWithPicture(
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      propic: freezed == propic
          ? _self.propic
          : propic // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ProfileWithPicture
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

// dart format on
