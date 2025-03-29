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
mixin _$FlightCrewRecordsCategoryFilterState {
  String get search;
  bool? get archived;
  DateTimeRange? get createdAt;
  String get roleId;

  /// Create a copy of FlightCrewRecordsCategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlightCrewRecordsCategoryFilterStateCopyWith<
          FlightCrewRecordsCategoryFilterState>
      get copyWith => _$FlightCrewRecordsCategoryFilterStateCopyWithImpl<
              FlightCrewRecordsCategoryFilterState>(
          this as FlightCrewRecordsCategoryFilterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlightCrewRecordsCategoryFilterState &&
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
    return 'FlightCrewRecordsCategoryFilterState(search: $search, archived: $archived, createdAt: $createdAt, roleId: $roleId)';
  }
}

/// @nodoc
abstract mixin class $FlightCrewRecordsCategoryFilterStateCopyWith<$Res> {
  factory $FlightCrewRecordsCategoryFilterStateCopyWith(
          FlightCrewRecordsCategoryFilterState value,
          $Res Function(FlightCrewRecordsCategoryFilterState) _then) =
      _$FlightCrewRecordsCategoryFilterStateCopyWithImpl;
  @useResult
  $Res call(
      {String search, bool? archived, DateTimeRange? createdAt, String roleId});
}

/// @nodoc
class _$FlightCrewRecordsCategoryFilterStateCopyWithImpl<$Res>
    implements $FlightCrewRecordsCategoryFilterStateCopyWith<$Res> {
  _$FlightCrewRecordsCategoryFilterStateCopyWithImpl(this._self, this._then);

  final FlightCrewRecordsCategoryFilterState _self;
  final $Res Function(FlightCrewRecordsCategoryFilterState) _then;

  /// Create a copy of FlightCrewRecordsCategoryFilterState
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

class _FlightCrewRecordsCategoryFilterState
    extends FlightCrewRecordsCategoryFilterState {
  _FlightCrewRecordsCategoryFilterState(
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

  /// Create a copy of FlightCrewRecordsCategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FlightCrewRecordsCategoryFilterStateCopyWith<
          _FlightCrewRecordsCategoryFilterState>
      get copyWith => __$FlightCrewRecordsCategoryFilterStateCopyWithImpl<
          _FlightCrewRecordsCategoryFilterState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FlightCrewRecordsCategoryFilterState &&
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
    return 'FlightCrewRecordsCategoryFilterState(search: $search, archived: $archived, createdAt: $createdAt, roleId: $roleId)';
  }
}

/// @nodoc
abstract mixin class _$FlightCrewRecordsCategoryFilterStateCopyWith<$Res>
    implements $FlightCrewRecordsCategoryFilterStateCopyWith<$Res> {
  factory _$FlightCrewRecordsCategoryFilterStateCopyWith(
          _FlightCrewRecordsCategoryFilterState value,
          $Res Function(_FlightCrewRecordsCategoryFilterState) _then) =
      __$FlightCrewRecordsCategoryFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String search, bool? archived, DateTimeRange? createdAt, String roleId});
}

/// @nodoc
class __$FlightCrewRecordsCategoryFilterStateCopyWithImpl<$Res>
    implements _$FlightCrewRecordsCategoryFilterStateCopyWith<$Res> {
  __$FlightCrewRecordsCategoryFilterStateCopyWithImpl(this._self, this._then);

  final _FlightCrewRecordsCategoryFilterState _self;
  final $Res Function(_FlightCrewRecordsCategoryFilterState) _then;

  /// Create a copy of FlightCrewRecordsCategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
    Object? roleId = null,
  }) {
    return _then(_FlightCrewRecordsCategoryFilterState(
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
