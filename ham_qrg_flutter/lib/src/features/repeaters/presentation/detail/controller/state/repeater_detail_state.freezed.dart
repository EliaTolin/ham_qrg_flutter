// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeater_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepeaterDetailState {
  Repeater get repeater;
  RepeaterFeedbackStats? get feedbackStats;
  RepeaterFeedback? get myFeedback;
  List<RepeaterFeedback> get communityFeedbacks;
  bool get isLoadingFeedback;
  bool get isSubmittingFeedback;
  StationKind? get selectedStation;
  Set<AccessMode> get selectedAccessModes;
  String? get locationText;
  String get comment;

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeaterDetailStateCopyWith<RepeaterDetailState> get copyWith =>
      _$RepeaterDetailStateCopyWithImpl<RepeaterDetailState>(
          this as RepeaterDetailState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepeaterDetailState &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.feedbackStats, feedbackStats) ||
                other.feedbackStats == feedbackStats) &&
            (identical(other.myFeedback, myFeedback) ||
                other.myFeedback == myFeedback) &&
            const DeepCollectionEquality()
                .equals(other.communityFeedbacks, communityFeedbacks) &&
            (identical(other.isLoadingFeedback, isLoadingFeedback) ||
                other.isLoadingFeedback == isLoadingFeedback) &&
            (identical(other.isSubmittingFeedback, isSubmittingFeedback) ||
                other.isSubmittingFeedback == isSubmittingFeedback) &&
            (identical(other.selectedStation, selectedStation) ||
                other.selectedStation == selectedStation) &&
            const DeepCollectionEquality()
                .equals(other.selectedAccessModes, selectedAccessModes) &&
            (identical(other.locationText, locationText) ||
                other.locationText == locationText) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      repeater,
      feedbackStats,
      myFeedback,
      const DeepCollectionEquality().hash(communityFeedbacks),
      isLoadingFeedback,
      isSubmittingFeedback,
      selectedStation,
      const DeepCollectionEquality().hash(selectedAccessModes),
      locationText,
      comment);

  @override
  String toString() {
    return 'RepeaterDetailState(repeater: $repeater, feedbackStats: $feedbackStats, myFeedback: $myFeedback, communityFeedbacks: $communityFeedbacks, isLoadingFeedback: $isLoadingFeedback, isSubmittingFeedback: $isSubmittingFeedback, selectedStation: $selectedStation, selectedAccessModes: $selectedAccessModes, locationText: $locationText, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class $RepeaterDetailStateCopyWith<$Res> {
  factory $RepeaterDetailStateCopyWith(
          RepeaterDetailState value, $Res Function(RepeaterDetailState) _then) =
      _$RepeaterDetailStateCopyWithImpl;
  @useResult
  $Res call(
      {Repeater repeater,
      RepeaterFeedbackStats? feedbackStats,
      RepeaterFeedback? myFeedback,
      List<RepeaterFeedback> communityFeedbacks,
      bool isLoadingFeedback,
      bool isSubmittingFeedback,
      StationKind? selectedStation,
      Set<AccessMode> selectedAccessModes,
      String? locationText,
      String comment});

  $RepeaterCopyWith<$Res> get repeater;
  $RepeaterFeedbackStatsCopyWith<$Res>? get feedbackStats;
  $RepeaterFeedbackCopyWith<$Res>? get myFeedback;
}

/// @nodoc
class _$RepeaterDetailStateCopyWithImpl<$Res>
    implements $RepeaterDetailStateCopyWith<$Res> {
  _$RepeaterDetailStateCopyWithImpl(this._self, this._then);

  final RepeaterDetailState _self;
  final $Res Function(RepeaterDetailState) _then;

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeater = null,
    Object? feedbackStats = freezed,
    Object? myFeedback = freezed,
    Object? communityFeedbacks = null,
    Object? isLoadingFeedback = null,
    Object? isSubmittingFeedback = null,
    Object? selectedStation = freezed,
    Object? selectedAccessModes = null,
    Object? locationText = freezed,
    Object? comment = null,
  }) {
    return _then(_self.copyWith(
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
      feedbackStats: freezed == feedbackStats
          ? _self.feedbackStats
          : feedbackStats // ignore: cast_nullable_to_non_nullable
              as RepeaterFeedbackStats?,
      myFeedback: freezed == myFeedback
          ? _self.myFeedback
          : myFeedback // ignore: cast_nullable_to_non_nullable
              as RepeaterFeedback?,
      communityFeedbacks: null == communityFeedbacks
          ? _self.communityFeedbacks
          : communityFeedbacks // ignore: cast_nullable_to_non_nullable
              as List<RepeaterFeedback>,
      isLoadingFeedback: null == isLoadingFeedback
          ? _self.isLoadingFeedback
          : isLoadingFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmittingFeedback: null == isSubmittingFeedback
          ? _self.isSubmittingFeedback
          : isSubmittingFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedStation: freezed == selectedStation
          ? _self.selectedStation
          : selectedStation // ignore: cast_nullable_to_non_nullable
              as StationKind?,
      selectedAccessModes: null == selectedAccessModes
          ? _self.selectedAccessModes
          : selectedAccessModes // ignore: cast_nullable_to_non_nullable
              as Set<AccessMode>,
      locationText: freezed == locationText
          ? _self.locationText
          : locationText // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterFeedbackStatsCopyWith<$Res>? get feedbackStats {
    if (_self.feedbackStats == null) {
      return null;
    }

    return $RepeaterFeedbackStatsCopyWith<$Res>(_self.feedbackStats!, (value) {
      return _then(_self.copyWith(feedbackStats: value));
    });
  }

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterFeedbackCopyWith<$Res>? get myFeedback {
    if (_self.myFeedback == null) {
      return null;
    }

    return $RepeaterFeedbackCopyWith<$Res>(_self.myFeedback!, (value) {
      return _then(_self.copyWith(myFeedback: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RepeaterDetailState].
extension RepeaterDetailStatePatterns on RepeaterDetailState {
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
    TResult Function(_RepeaterDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailState() when $default != null:
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
    TResult Function(_RepeaterDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailState():
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
    TResult? Function(_RepeaterDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailState() when $default != null:
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
            Repeater repeater,
            RepeaterFeedbackStats? feedbackStats,
            RepeaterFeedback? myFeedback,
            List<RepeaterFeedback> communityFeedbacks,
            bool isLoadingFeedback,
            bool isSubmittingFeedback,
            StationKind? selectedStation,
            Set<AccessMode> selectedAccessModes,
            String? locationText,
            String comment)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailState() when $default != null:
        return $default(
            _that.repeater,
            _that.feedbackStats,
            _that.myFeedback,
            _that.communityFeedbacks,
            _that.isLoadingFeedback,
            _that.isSubmittingFeedback,
            _that.selectedStation,
            _that.selectedAccessModes,
            _that.locationText,
            _that.comment);
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
            Repeater repeater,
            RepeaterFeedbackStats? feedbackStats,
            RepeaterFeedback? myFeedback,
            List<RepeaterFeedback> communityFeedbacks,
            bool isLoadingFeedback,
            bool isSubmittingFeedback,
            StationKind? selectedStation,
            Set<AccessMode> selectedAccessModes,
            String? locationText,
            String comment)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailState():
        return $default(
            _that.repeater,
            _that.feedbackStats,
            _that.myFeedback,
            _that.communityFeedbacks,
            _that.isLoadingFeedback,
            _that.isSubmittingFeedback,
            _that.selectedStation,
            _that.selectedAccessModes,
            _that.locationText,
            _that.comment);
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
            Repeater repeater,
            RepeaterFeedbackStats? feedbackStats,
            RepeaterFeedback? myFeedback,
            List<RepeaterFeedback> communityFeedbacks,
            bool isLoadingFeedback,
            bool isSubmittingFeedback,
            StationKind? selectedStation,
            Set<AccessMode> selectedAccessModes,
            String? locationText,
            String comment)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterDetailState() when $default != null:
        return $default(
            _that.repeater,
            _that.feedbackStats,
            _that.myFeedback,
            _that.communityFeedbacks,
            _that.isLoadingFeedback,
            _that.isSubmittingFeedback,
            _that.selectedStation,
            _that.selectedAccessModes,
            _that.locationText,
            _that.comment);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RepeaterDetailState implements RepeaterDetailState {
  const _RepeaterDetailState(
      {required this.repeater,
      this.feedbackStats,
      this.myFeedback,
      final List<RepeaterFeedback> communityFeedbacks = const [],
      this.isLoadingFeedback = false,
      this.isSubmittingFeedback = false,
      this.selectedStation,
      final Set<AccessMode> selectedAccessModes = const {},
      this.locationText,
      this.comment = ''})
      : _communityFeedbacks = communityFeedbacks,
        _selectedAccessModes = selectedAccessModes;

  @override
  final Repeater repeater;
  @override
  final RepeaterFeedbackStats? feedbackStats;
  @override
  final RepeaterFeedback? myFeedback;
  final List<RepeaterFeedback> _communityFeedbacks;
  @override
  @JsonKey()
  List<RepeaterFeedback> get communityFeedbacks {
    if (_communityFeedbacks is EqualUnmodifiableListView)
      return _communityFeedbacks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_communityFeedbacks);
  }

  @override
  @JsonKey()
  final bool isLoadingFeedback;
  @override
  @JsonKey()
  final bool isSubmittingFeedback;
  @override
  final StationKind? selectedStation;
  final Set<AccessMode> _selectedAccessModes;
  @override
  @JsonKey()
  Set<AccessMode> get selectedAccessModes {
    if (_selectedAccessModes is EqualUnmodifiableSetView)
      return _selectedAccessModes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedAccessModes);
  }

  @override
  final String? locationText;
  @override
  @JsonKey()
  final String comment;

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeaterDetailStateCopyWith<_RepeaterDetailState> get copyWith =>
      __$RepeaterDetailStateCopyWithImpl<_RepeaterDetailState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeaterDetailState &&
            (identical(other.repeater, repeater) ||
                other.repeater == repeater) &&
            (identical(other.feedbackStats, feedbackStats) ||
                other.feedbackStats == feedbackStats) &&
            (identical(other.myFeedback, myFeedback) ||
                other.myFeedback == myFeedback) &&
            const DeepCollectionEquality()
                .equals(other._communityFeedbacks, _communityFeedbacks) &&
            (identical(other.isLoadingFeedback, isLoadingFeedback) ||
                other.isLoadingFeedback == isLoadingFeedback) &&
            (identical(other.isSubmittingFeedback, isSubmittingFeedback) ||
                other.isSubmittingFeedback == isSubmittingFeedback) &&
            (identical(other.selectedStation, selectedStation) ||
                other.selectedStation == selectedStation) &&
            const DeepCollectionEquality()
                .equals(other._selectedAccessModes, _selectedAccessModes) &&
            (identical(other.locationText, locationText) ||
                other.locationText == locationText) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      repeater,
      feedbackStats,
      myFeedback,
      const DeepCollectionEquality().hash(_communityFeedbacks),
      isLoadingFeedback,
      isSubmittingFeedback,
      selectedStation,
      const DeepCollectionEquality().hash(_selectedAccessModes),
      locationText,
      comment);

  @override
  String toString() {
    return 'RepeaterDetailState(repeater: $repeater, feedbackStats: $feedbackStats, myFeedback: $myFeedback, communityFeedbacks: $communityFeedbacks, isLoadingFeedback: $isLoadingFeedback, isSubmittingFeedback: $isSubmittingFeedback, selectedStation: $selectedStation, selectedAccessModes: $selectedAccessModes, locationText: $locationText, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class _$RepeaterDetailStateCopyWith<$Res>
    implements $RepeaterDetailStateCopyWith<$Res> {
  factory _$RepeaterDetailStateCopyWith(_RepeaterDetailState value,
          $Res Function(_RepeaterDetailState) _then) =
      __$RepeaterDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Repeater repeater,
      RepeaterFeedbackStats? feedbackStats,
      RepeaterFeedback? myFeedback,
      List<RepeaterFeedback> communityFeedbacks,
      bool isLoadingFeedback,
      bool isSubmittingFeedback,
      StationKind? selectedStation,
      Set<AccessMode> selectedAccessModes,
      String? locationText,
      String comment});

  @override
  $RepeaterCopyWith<$Res> get repeater;
  @override
  $RepeaterFeedbackStatsCopyWith<$Res>? get feedbackStats;
  @override
  $RepeaterFeedbackCopyWith<$Res>? get myFeedback;
}

/// @nodoc
class __$RepeaterDetailStateCopyWithImpl<$Res>
    implements _$RepeaterDetailStateCopyWith<$Res> {
  __$RepeaterDetailStateCopyWithImpl(this._self, this._then);

  final _RepeaterDetailState _self;
  final $Res Function(_RepeaterDetailState) _then;

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? repeater = null,
    Object? feedbackStats = freezed,
    Object? myFeedback = freezed,
    Object? communityFeedbacks = null,
    Object? isLoadingFeedback = null,
    Object? isSubmittingFeedback = null,
    Object? selectedStation = freezed,
    Object? selectedAccessModes = null,
    Object? locationText = freezed,
    Object? comment = null,
  }) {
    return _then(_RepeaterDetailState(
      repeater: null == repeater
          ? _self.repeater
          : repeater // ignore: cast_nullable_to_non_nullable
              as Repeater,
      feedbackStats: freezed == feedbackStats
          ? _self.feedbackStats
          : feedbackStats // ignore: cast_nullable_to_non_nullable
              as RepeaterFeedbackStats?,
      myFeedback: freezed == myFeedback
          ? _self.myFeedback
          : myFeedback // ignore: cast_nullable_to_non_nullable
              as RepeaterFeedback?,
      communityFeedbacks: null == communityFeedbacks
          ? _self._communityFeedbacks
          : communityFeedbacks // ignore: cast_nullable_to_non_nullable
              as List<RepeaterFeedback>,
      isLoadingFeedback: null == isLoadingFeedback
          ? _self.isLoadingFeedback
          : isLoadingFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmittingFeedback: null == isSubmittingFeedback
          ? _self.isSubmittingFeedback
          : isSubmittingFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedStation: freezed == selectedStation
          ? _self.selectedStation
          : selectedStation // ignore: cast_nullable_to_non_nullable
              as StationKind?,
      selectedAccessModes: null == selectedAccessModes
          ? _self._selectedAccessModes
          : selectedAccessModes // ignore: cast_nullable_to_non_nullable
              as Set<AccessMode>,
      locationText: freezed == locationText
          ? _self.locationText
          : locationText // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterCopyWith<$Res> get repeater {
    return $RepeaterCopyWith<$Res>(_self.repeater, (value) {
      return _then(_self.copyWith(repeater: value));
    });
  }

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterFeedbackStatsCopyWith<$Res>? get feedbackStats {
    if (_self.feedbackStats == null) {
      return null;
    }

    return $RepeaterFeedbackStatsCopyWith<$Res>(_self.feedbackStats!, (value) {
      return _then(_self.copyWith(feedbackStats: value));
    });
  }

  /// Create a copy of RepeaterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeaterFeedbackCopyWith<$Res>? get myFeedback {
    if (_self.myFeedback == null) {
      return null;
    }

    return $RepeaterFeedbackCopyWith<$Res>(_self.myFeedback!, (value) {
      return _then(_self.copyWith(myFeedback: value));
    });
  }
}

// dart format on
