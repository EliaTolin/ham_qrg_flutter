// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'received_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReceivedNotification {
  int get id;
  String? get title;
  String? get body;
  String? get payload;
  String? get imageUrl;

  /// Create a copy of ReceivedNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReceivedNotificationCopyWith<ReceivedNotification> get copyWith =>
      _$ReceivedNotificationCopyWithImpl<ReceivedNotification>(
          this as ReceivedNotification, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReceivedNotification &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, body, payload, imageUrl);

  @override
  String toString() {
    return 'ReceivedNotification(id: $id, title: $title, body: $body, payload: $payload, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class $ReceivedNotificationCopyWith<$Res> {
  factory $ReceivedNotificationCopyWith(ReceivedNotification value,
          $Res Function(ReceivedNotification) _then) =
      _$ReceivedNotificationCopyWithImpl;
  @useResult
  $Res call(
      {int id, String? title, String? body, String? payload, String? imageUrl});
}

/// @nodoc
class _$ReceivedNotificationCopyWithImpl<$Res>
    implements $ReceivedNotificationCopyWith<$Res> {
  _$ReceivedNotificationCopyWithImpl(this._self, this._then);

  final ReceivedNotification _self;
  final $Res Function(ReceivedNotification) _then;

  /// Create a copy of ReceivedNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? body = freezed,
    Object? payload = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: freezed == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReceivedNotification].
extension ReceivedNotificationPatterns on ReceivedNotification {
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
    TResult Function(_ReceivedNotification value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReceivedNotification() when $default != null:
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
    TResult Function(_ReceivedNotification value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReceivedNotification():
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
    TResult? Function(_ReceivedNotification value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReceivedNotification() when $default != null:
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
    TResult Function(int id, String? title, String? body, String? payload,
            String? imageUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReceivedNotification() when $default != null:
        return $default(
            _that.id, _that.title, _that.body, _that.payload, _that.imageUrl);
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
    TResult Function(int id, String? title, String? body, String? payload,
            String? imageUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReceivedNotification():
        return $default(
            _that.id, _that.title, _that.body, _that.payload, _that.imageUrl);
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
    TResult? Function(int id, String? title, String? body, String? payload,
            String? imageUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReceivedNotification() when $default != null:
        return $default(
            _that.id, _that.title, _that.body, _that.payload, _that.imageUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReceivedNotification implements ReceivedNotification {
  const _ReceivedNotification(
      {required this.id, this.title, this.body, this.payload, this.imageUrl});

  @override
  final int id;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final String? payload;
  @override
  final String? imageUrl;

  /// Create a copy of ReceivedNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReceivedNotificationCopyWith<_ReceivedNotification> get copyWith =>
      __$ReceivedNotificationCopyWithImpl<_ReceivedNotification>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReceivedNotification &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, body, payload, imageUrl);

  @override
  String toString() {
    return 'ReceivedNotification(id: $id, title: $title, body: $body, payload: $payload, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class _$ReceivedNotificationCopyWith<$Res>
    implements $ReceivedNotificationCopyWith<$Res> {
  factory _$ReceivedNotificationCopyWith(_ReceivedNotification value,
          $Res Function(_ReceivedNotification) _then) =
      __$ReceivedNotificationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id, String? title, String? body, String? payload, String? imageUrl});
}

/// @nodoc
class __$ReceivedNotificationCopyWithImpl<$Res>
    implements _$ReceivedNotificationCopyWith<$Res> {
  __$ReceivedNotificationCopyWithImpl(this._self, this._then);

  final _ReceivedNotification _self;
  final $Res Function(_ReceivedNotification) _then;

  /// Create a copy of ReceivedNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? body = freezed,
    Object? payload = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_ReceivedNotification(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: freezed == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
