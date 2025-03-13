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
mixin _$CrewDocumentFilterState {
  Staff get staff;
  CrewDocumentCategory get category;
  String get search;
  bool? get archived;
  DateTimeRange? get createdAt;

  /// Create a copy of CrewDocumentFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CrewDocumentFilterStateCopyWith<CrewDocumentFilterState> get copyWith =>
      _$CrewDocumentFilterStateCopyWithImpl<CrewDocumentFilterState>(
          this as CrewDocumentFilterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CrewDocumentFilterState &&
            (identical(other.staff, staff) || other.staff == staff) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, staff, category, search, archived, createdAt);

  @override
  String toString() {
    return 'CrewDocumentFilterState(staff: $staff, category: $category, search: $search, archived: $archived, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $CrewDocumentFilterStateCopyWith<$Res> {
  factory $CrewDocumentFilterStateCopyWith(CrewDocumentFilterState value,
          $Res Function(CrewDocumentFilterState) _then) =
      _$CrewDocumentFilterStateCopyWithImpl;
  @useResult
  $Res call(
      {Staff staff,
      CrewDocumentCategory category,
      String search,
      bool? archived,
      DateTimeRange? createdAt});
}

/// @nodoc
class _$CrewDocumentFilterStateCopyWithImpl<$Res>
    implements $CrewDocumentFilterStateCopyWith<$Res> {
  _$CrewDocumentFilterStateCopyWithImpl(this._self, this._then);

  final CrewDocumentFilterState _self;
  final $Res Function(CrewDocumentFilterState) _then;

  /// Create a copy of CrewDocumentFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staff = null,
    Object? category = null,
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_self.copyWith(
      staff: null == staff
          ? _self.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as Staff,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as CrewDocumentCategory,
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
    ));
  }
}

/// @nodoc

class _CrewDocumentFilterState extends CrewDocumentFilterState {
  _CrewDocumentFilterState(
      {required this.staff,
      required this.category,
      this.search = "",
      this.archived = false,
      this.createdAt})
      : super._();

  @override
  final Staff staff;
  @override
  final CrewDocumentCategory category;
  @override
  @JsonKey()
  final String search;
  @override
  @JsonKey()
  final bool? archived;
  @override
  final DateTimeRange? createdAt;

  /// Create a copy of CrewDocumentFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CrewDocumentFilterStateCopyWith<_CrewDocumentFilterState> get copyWith =>
      __$CrewDocumentFilterStateCopyWithImpl<_CrewDocumentFilterState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CrewDocumentFilterState &&
            (identical(other.staff, staff) || other.staff == staff) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, staff, category, search, archived, createdAt);

  @override
  String toString() {
    return 'CrewDocumentFilterState(staff: $staff, category: $category, search: $search, archived: $archived, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$CrewDocumentFilterStateCopyWith<$Res>
    implements $CrewDocumentFilterStateCopyWith<$Res> {
  factory _$CrewDocumentFilterStateCopyWith(_CrewDocumentFilterState value,
          $Res Function(_CrewDocumentFilterState) _then) =
      __$CrewDocumentFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Staff staff,
      CrewDocumentCategory category,
      String search,
      bool? archived,
      DateTimeRange? createdAt});
}

/// @nodoc
class __$CrewDocumentFilterStateCopyWithImpl<$Res>
    implements _$CrewDocumentFilterStateCopyWith<$Res> {
  __$CrewDocumentFilterStateCopyWithImpl(this._self, this._then);

  final _CrewDocumentFilterState _self;
  final $Res Function(_CrewDocumentFilterState) _then;

  /// Create a copy of CrewDocumentFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? staff = null,
    Object? category = null,
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_CrewDocumentFilterState(
      staff: null == staff
          ? _self.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as Staff,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as CrewDocumentCategory,
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
    ));
  }
}

// dart format on
