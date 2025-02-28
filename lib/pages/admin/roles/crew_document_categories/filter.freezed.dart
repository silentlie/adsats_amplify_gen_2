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
mixin _$CrewDocumentCategoryFilterState {
  String get search => throw _privateConstructorUsedError;
  bool? get archived => throw _privateConstructorUsedError;
  DateTimeRange? get createdAt => throw _privateConstructorUsedError;
  String get roleId => throw _privateConstructorUsedError;

  /// Create a copy of CrewDocumentCategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CrewDocumentCategoryFilterStateCopyWith<CrewDocumentCategoryFilterState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrewDocumentCategoryFilterStateCopyWith<$Res> {
  factory $CrewDocumentCategoryFilterStateCopyWith(
          CrewDocumentCategoryFilterState value,
          $Res Function(CrewDocumentCategoryFilterState) then) =
      _$CrewDocumentCategoryFilterStateCopyWithImpl<$Res,
          CrewDocumentCategoryFilterState>;
  @useResult
  $Res call(
      {String search, bool? archived, DateTimeRange? createdAt, String roleId});
}

/// @nodoc
class _$CrewDocumentCategoryFilterStateCopyWithImpl<$Res,
        $Val extends CrewDocumentCategoryFilterState>
    implements $CrewDocumentCategoryFilterStateCopyWith<$Res> {
  _$CrewDocumentCategoryFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CrewDocumentCategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
    Object? roleId = null,
  }) {
    return _then(_value.copyWith(
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      archived: freezed == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrewDocumentCategoryFilterStateImplCopyWith<$Res>
    implements $CrewDocumentCategoryFilterStateCopyWith<$Res> {
  factory _$$CrewDocumentCategoryFilterStateImplCopyWith(
          _$CrewDocumentCategoryFilterStateImpl value,
          $Res Function(_$CrewDocumentCategoryFilterStateImpl) then) =
      __$$CrewDocumentCategoryFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String search, bool? archived, DateTimeRange? createdAt, String roleId});
}

/// @nodoc
class __$$CrewDocumentCategoryFilterStateImplCopyWithImpl<$Res>
    extends _$CrewDocumentCategoryFilterStateCopyWithImpl<$Res,
        _$CrewDocumentCategoryFilterStateImpl>
    implements _$$CrewDocumentCategoryFilterStateImplCopyWith<$Res> {
  __$$CrewDocumentCategoryFilterStateImplCopyWithImpl(
      _$CrewDocumentCategoryFilterStateImpl _value,
      $Res Function(_$CrewDocumentCategoryFilterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CrewDocumentCategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
    Object? roleId = null,
  }) {
    return _then(_$CrewDocumentCategoryFilterStateImpl(
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      archived: freezed == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CrewDocumentCategoryFilterStateImpl
    extends _CrewDocumentCategoryFilterState {
  _$CrewDocumentCategoryFilterStateImpl(
      {this.search = "",
      this.archived = false,
      this.createdAt,
      required this.roleId})
      : super._();

  @override
  @JsonKey()
  final String search;
  @override
  @JsonKey()
  final bool? archived;
  @override
  final DateTimeRange? createdAt;
  @override
  final String roleId;

  @override
  String toString() {
    return 'CrewDocumentCategoryFilterState(search: $search, archived: $archived, createdAt: $createdAt, roleId: $roleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrewDocumentCategoryFilterStateImpl &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.roleId, roleId) || other.roleId == roleId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, search, archived, createdAt, roleId);

  /// Create a copy of CrewDocumentCategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CrewDocumentCategoryFilterStateImplCopyWith<
          _$CrewDocumentCategoryFilterStateImpl>
      get copyWith => __$$CrewDocumentCategoryFilterStateImplCopyWithImpl<
          _$CrewDocumentCategoryFilterStateImpl>(this, _$identity);
}

abstract class _CrewDocumentCategoryFilterState
    extends CrewDocumentCategoryFilterState {
  factory _CrewDocumentCategoryFilterState(
      {final String search,
      final bool? archived,
      final DateTimeRange? createdAt,
      required final String roleId}) = _$CrewDocumentCategoryFilterStateImpl;
  _CrewDocumentCategoryFilterState._() : super._();

  @override
  String get search;
  @override
  bool? get archived;
  @override
  DateTimeRange? get createdAt;
  @override
  String get roleId;

  /// Create a copy of CrewDocumentCategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CrewDocumentCategoryFilterStateImplCopyWith<
          _$CrewDocumentCategoryFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
