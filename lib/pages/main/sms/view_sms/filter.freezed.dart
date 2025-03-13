// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
                other.deadlineAt == deadlineAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, user, search, type, status, archived, noticedAt, deadlineAt);

  @override
  String toString() {
    return 'NoticeFilterState(user: $user, search: $search, type: $type, status: $status, archived: $archived, noticedAt: $noticedAt, deadlineAt: $deadlineAt)';
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
      DateTimeRange? deadlineAt});
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
    ));
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
      this.deadlineAt})
      : super._();

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
                other.deadlineAt == deadlineAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, user, search, type, status, archived, noticedAt, deadlineAt);

  @override
  String toString() {
    return 'NoticeFilterState(user: $user, search: $search, type: $type, status: $status, archived: $archived, noticedAt: $noticedAt, deadlineAt: $deadlineAt)';
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
      DateTimeRange? deadlineAt});
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
    ));
  }
}

// dart format on
