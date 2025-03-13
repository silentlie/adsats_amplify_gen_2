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
mixin _$CrewDocumentCategoryFilterState {
  String get search;
  bool? get archived;
  DateTimeRange? get createdAt;
  String get roleId;

  /// Create a copy of CrewDocumentCategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CrewDocumentCategoryFilterStateCopyWith<CrewDocumentCategoryFilterState>
      get copyWith => _$CrewDocumentCategoryFilterStateCopyWithImpl<
              CrewDocumentCategoryFilterState>(
          this as CrewDocumentCategoryFilterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CrewDocumentCategoryFilterState &&
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

  @override
  String toString() {
    return 'CrewDocumentCategoryFilterState(search: $search, archived: $archived, createdAt: $createdAt, roleId: $roleId)';
  }
}

/// @nodoc
abstract mixin class $CrewDocumentCategoryFilterStateCopyWith<$Res> {
  factory $CrewDocumentCategoryFilterStateCopyWith(
          CrewDocumentCategoryFilterState value,
          $Res Function(CrewDocumentCategoryFilterState) _then) =
      _$CrewDocumentCategoryFilterStateCopyWithImpl;
  @useResult
  $Res call(
      {String search, bool? archived, DateTimeRange? createdAt, String roleId});
}

/// @nodoc
class _$CrewDocumentCategoryFilterStateCopyWithImpl<$Res>
    implements $CrewDocumentCategoryFilterStateCopyWith<$Res> {
  _$CrewDocumentCategoryFilterStateCopyWithImpl(this._self, this._then);

  final CrewDocumentCategoryFilterState _self;
  final $Res Function(CrewDocumentCategoryFilterState) _then;

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
    return _then(_self.copyWith(
      search: null == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      archived: freezed == archived
          ? _self.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      roleId: null == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _CrewDocumentCategoryFilterState extends CrewDocumentCategoryFilterState {
  _CrewDocumentCategoryFilterState(
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

  /// Create a copy of CrewDocumentCategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CrewDocumentCategoryFilterStateCopyWith<_CrewDocumentCategoryFilterState>
      get copyWith => __$CrewDocumentCategoryFilterStateCopyWithImpl<
          _CrewDocumentCategoryFilterState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CrewDocumentCategoryFilterState &&
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

  @override
  String toString() {
    return 'CrewDocumentCategoryFilterState(search: $search, archived: $archived, createdAt: $createdAt, roleId: $roleId)';
  }
}

/// @nodoc
abstract mixin class _$CrewDocumentCategoryFilterStateCopyWith<$Res>
    implements $CrewDocumentCategoryFilterStateCopyWith<$Res> {
  factory _$CrewDocumentCategoryFilterStateCopyWith(
          _CrewDocumentCategoryFilterState value,
          $Res Function(_CrewDocumentCategoryFilterState) _then) =
      __$CrewDocumentCategoryFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String search, bool? archived, DateTimeRange? createdAt, String roleId});
}

/// @nodoc
class __$CrewDocumentCategoryFilterStateCopyWithImpl<$Res>
    implements _$CrewDocumentCategoryFilterStateCopyWith<$Res> {
  __$CrewDocumentCategoryFilterStateCopyWithImpl(this._self, this._then);

  final _CrewDocumentCategoryFilterState _self;
  final $Res Function(_CrewDocumentCategoryFilterState) _then;

  /// Create a copy of CrewDocumentCategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
    Object? roleId = null,
  }) {
    return _then(_CrewDocumentCategoryFilterState(
      search: null == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      archived: freezed == archived
          ? _self.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      roleId: null == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
