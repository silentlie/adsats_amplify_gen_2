// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NoticeFilterState {
  Staff get user => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;
  NoticeType? get type => throw _privateConstructorUsedError;
  NoticeStatus? get status => throw _privateConstructorUsedError;
  bool? get archived => throw _privateConstructorUsedError;
  DateTimeRange? get noticedAt => throw _privateConstructorUsedError;
  DateTimeRange? get deadlineAt => throw _privateConstructorUsedError;

  /// Create a copy of NoticeFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoticeFilterStateCopyWith<NoticeFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeFilterStateCopyWith<$Res> {
  factory $NoticeFilterStateCopyWith(
          NoticeFilterState value, $Res Function(NoticeFilterState) then) =
      _$NoticeFilterStateCopyWithImpl<$Res, NoticeFilterState>;
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
class _$NoticeFilterStateCopyWithImpl<$Res, $Val extends NoticeFilterState>
    implements $NoticeFilterStateCopyWith<$Res> {
  _$NoticeFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Staff,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NoticeType?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NoticeStatus?,
      archived: freezed == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      noticedAt: freezed == noticedAt
          ? _value.noticedAt
          : noticedAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      deadlineAt: freezed == deadlineAt
          ? _value.deadlineAt
          : deadlineAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeFilterStateImplCopyWith<$Res>
    implements $NoticeFilterStateCopyWith<$Res> {
  factory _$$NoticeFilterStateImplCopyWith(_$NoticeFilterStateImpl value,
          $Res Function(_$NoticeFilterStateImpl) then) =
      __$$NoticeFilterStateImplCopyWithImpl<$Res>;
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
class __$$NoticeFilterStateImplCopyWithImpl<$Res>
    extends _$NoticeFilterStateCopyWithImpl<$Res, _$NoticeFilterStateImpl>
    implements _$$NoticeFilterStateImplCopyWith<$Res> {
  __$$NoticeFilterStateImplCopyWithImpl(_$NoticeFilterStateImpl _value,
      $Res Function(_$NoticeFilterStateImpl) _then)
      : super(_value, _then);

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
    return _then(_$NoticeFilterStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Staff,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NoticeType?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NoticeStatus?,
      archived: freezed == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      noticedAt: freezed == noticedAt
          ? _value.noticedAt
          : noticedAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      deadlineAt: freezed == deadlineAt
          ? _value.deadlineAt
          : deadlineAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ));
  }
}

/// @nodoc

class _$NoticeFilterStateImpl extends _NoticeFilterState {
  _$NoticeFilterStateImpl(
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

  @override
  String toString() {
    return 'NoticeFilterState(user: $user, search: $search, type: $type, status: $status, archived: $archived, noticedAt: $noticedAt, deadlineAt: $deadlineAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeFilterStateImpl &&
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

  /// Create a copy of NoticeFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeFilterStateImplCopyWith<_$NoticeFilterStateImpl> get copyWith =>
      __$$NoticeFilterStateImplCopyWithImpl<_$NoticeFilterStateImpl>(
          this, _$identity);
}

abstract class _NoticeFilterState extends NoticeFilterState {
  factory _NoticeFilterState(
      {required final Staff user,
      final String search,
      final NoticeType? type,
      final NoticeStatus? status,
      final bool? archived,
      final DateTimeRange? noticedAt,
      final DateTimeRange? deadlineAt}) = _$NoticeFilterStateImpl;
  _NoticeFilterState._() : super._();

  @override
  Staff get user;
  @override
  String get search;
  @override
  NoticeType? get type;
  @override
  NoticeStatus? get status;
  @override
  bool? get archived;
  @override
  DateTimeRange? get noticedAt;
  @override
  DateTimeRange? get deadlineAt;

  /// Create a copy of NoticeFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoticeFilterStateImplCopyWith<_$NoticeFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
