// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NoticeFilterState {
  Staff get user;
  String get search;
  NoticeType? get type;
  NoticeStatus? get status;
  bool? get archived;
  DateTimeRange? get noticedAt;
  DateTimeRange? get deadlineAt;
  List<Aircraft> get aircraft;

  /// Create a copy of NoticeFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NoticeFilterStateCopyWith<NoticeFilterState> get copyWith =>
      _$NoticeFilterStateCopyWithImpl<NoticeFilterState>(
          this as NoticeFilterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NoticeFilterState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.noticedAt, noticedAt) ||
                other.noticedAt == noticedAt) &&
            (identical(other.deadlineAt, deadlineAt) ||
                other.deadlineAt == deadlineAt) &&
            const DeepCollectionEquality().equals(other.aircraft, aircraft));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      search,
      type,
      status,
      archived,
      noticedAt,
      deadlineAt,
      const DeepCollectionEquality().hash(aircraft));

  @override
  String toString() {
    return 'NoticeFilterState(user: $user, search: $search, type: $type, status: $status, archived: $archived, noticedAt: $noticedAt, deadlineAt: $deadlineAt, aircraft: $aircraft)';
  }
}

/// @nodoc
abstract mixin class $NoticeFilterStateCopyWith<$Res> {
  factory $NoticeFilterStateCopyWith(
          NoticeFilterState value, $Res Function(NoticeFilterState) _then) =
      _$NoticeFilterStateCopyWithImpl;
  @useResult
  $Res call(
      {Staff user,
      String search,
      NoticeType? type,
      NoticeStatus? status,
      bool? archived,
      DateTimeRange? noticedAt,
      DateTimeRange? deadlineAt,
      List<Aircraft> aircraft});
}

/// @nodoc
class _$NoticeFilterStateCopyWithImpl<$Res>
    implements $NoticeFilterStateCopyWith<$Res> {
  _$NoticeFilterStateCopyWithImpl(this._self, this._then);

  final NoticeFilterState _self;
  final $Res Function(NoticeFilterState) _then;

  /// Create a copy of NoticeFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? search = null,
    Object? type = freezed,
    Object? status = freezed,
    Object? archived = freezed,
    Object? noticedAt = freezed,
    Object? deadlineAt = freezed,
    Object? aircraft = null,
  }) {
    return _then(_self.copyWith(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as Staff,
      search: null == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as NoticeType?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as NoticeStatus?,
      archived: freezed == archived
          ? _self.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      noticedAt: freezed == noticedAt
          ? _self.noticedAt
          : noticedAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      deadlineAt: freezed == deadlineAt
          ? _self.deadlineAt
          : deadlineAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      aircraft: null == aircraft
          ? _self.aircraft
          : aircraft // ignore: cast_nullable_to_non_nullable
              as List<Aircraft>,
    ));
  }
}

/// Adds pattern-matching-related methods to [NoticeFilterState].
extension NoticeFilterStatePatterns on NoticeFilterState {
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
    TResult Function(_NoticeFilterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NoticeFilterState() when $default != null:
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
    TResult Function(_NoticeFilterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeFilterState():
        return $default(_that);
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
    TResult? Function(_NoticeFilterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeFilterState() when $default != null:
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
            Staff user,
            String search,
            NoticeType? type,
            NoticeStatus? status,
            bool? archived,
            DateTimeRange? noticedAt,
            DateTimeRange? deadlineAt,
            List<Aircraft> aircraft)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NoticeFilterState() when $default != null:
        return $default(_that.user, _that.search, _that.type, _that.status,
            _that.archived, _that.noticedAt, _that.deadlineAt, _that.aircraft);
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
            Staff user,
            String search,
            NoticeType? type,
            NoticeStatus? status,
            bool? archived,
            DateTimeRange? noticedAt,
            DateTimeRange? deadlineAt,
            List<Aircraft> aircraft)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeFilterState():
        return $default(_that.user, _that.search, _that.type, _that.status,
            _that.archived, _that.noticedAt, _that.deadlineAt, _that.aircraft);
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
            Staff user,
            String search,
            NoticeType? type,
            NoticeStatus? status,
            bool? archived,
            DateTimeRange? noticedAt,
            DateTimeRange? deadlineAt,
            List<Aircraft> aircraft)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeFilterState() when $default != null:
        return $default(_that.user, _that.search, _that.type, _that.status,
            _that.archived, _that.noticedAt, _that.deadlineAt, _that.aircraft);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NoticeFilterState extends NoticeFilterState {
  _NoticeFilterState(
      {required this.user,
      this.search = "",
      this.type,
      this.status,
      this.archived,
      this.noticedAt,
      this.deadlineAt,
      final List<Aircraft> aircraft = const []})
      : _aircraft = aircraft,
        super._();

  @override
  final Staff user;
  @override
  @JsonKey()
  final String search;
  @override
  final NoticeType? type;
  @override
  final NoticeStatus? status;
  @override
  final bool? archived;
  @override
  final DateTimeRange? noticedAt;
  @override
  final DateTimeRange? deadlineAt;
  final List<Aircraft> _aircraft;
  @override
  @JsonKey()
  List<Aircraft> get aircraft {
    if (_aircraft is EqualUnmodifiableListView) return _aircraft;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aircraft);
  }

  /// Create a copy of NoticeFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NoticeFilterStateCopyWith<_NoticeFilterState> get copyWith =>
      __$NoticeFilterStateCopyWithImpl<_NoticeFilterState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoticeFilterState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.noticedAt, noticedAt) ||
                other.noticedAt == noticedAt) &&
            (identical(other.deadlineAt, deadlineAt) ||
                other.deadlineAt == deadlineAt) &&
            const DeepCollectionEquality().equals(other._aircraft, _aircraft));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      search,
      type,
      status,
      archived,
      noticedAt,
      deadlineAt,
      const DeepCollectionEquality().hash(_aircraft));

  @override
  String toString() {
    return 'NoticeFilterState(user: $user, search: $search, type: $type, status: $status, archived: $archived, noticedAt: $noticedAt, deadlineAt: $deadlineAt, aircraft: $aircraft)';
  }
}

/// @nodoc
abstract mixin class _$NoticeFilterStateCopyWith<$Res>
    implements $NoticeFilterStateCopyWith<$Res> {
  factory _$NoticeFilterStateCopyWith(
          _NoticeFilterState value, $Res Function(_NoticeFilterState) _then) =
      __$NoticeFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Staff user,
      String search,
      NoticeType? type,
      NoticeStatus? status,
      bool? archived,
      DateTimeRange? noticedAt,
      DateTimeRange? deadlineAt,
      List<Aircraft> aircraft});
}

/// @nodoc
class __$NoticeFilterStateCopyWithImpl<$Res>
    implements _$NoticeFilterStateCopyWith<$Res> {
  __$NoticeFilterStateCopyWithImpl(this._self, this._then);

  final _NoticeFilterState _self;
  final $Res Function(_NoticeFilterState) _then;

  /// Create a copy of NoticeFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
    Object? search = null,
    Object? type = freezed,
    Object? status = freezed,
    Object? archived = freezed,
    Object? noticedAt = freezed,
    Object? deadlineAt = freezed,
    Object? aircraft = null,
  }) {
    return _then(_NoticeFilterState(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as Staff,
      search: null == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as NoticeType?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as NoticeStatus?,
      archived: freezed == archived
          ? _self.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      noticedAt: freezed == noticedAt
          ? _self.noticedAt
          : noticedAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      deadlineAt: freezed == deadlineAt
          ? _self.deadlineAt
          : deadlineAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      aircraft: null == aircraft
          ? _self._aircraft
          : aircraft // ignore: cast_nullable_to_non_nullable
              as List<Aircraft>,
    ));
  }
}

// dart format on
