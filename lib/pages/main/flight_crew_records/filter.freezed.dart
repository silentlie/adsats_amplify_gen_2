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
mixin _$FlightCrewRecordFilterState {
  Staff get staff;
  FlightCrewRecordCategory get category;
  String get search;
  bool? get archived;
  DateTimeRange? get createdAt;
  DateTimeRange? get issuedAt;
  DateTimeRange? get expiredAt;

  /// Create a copy of FlightCrewRecordFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlightCrewRecordFilterStateCopyWith<FlightCrewRecordFilterState>
      get copyWith => _$FlightCrewRecordFilterStateCopyWithImpl<
              FlightCrewRecordFilterState>(
          this as FlightCrewRecordFilterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlightCrewRecordFilterState &&
            (identical(other.staff, staff) || other.staff == staff) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.issuedAt, issuedAt) ||
                other.issuedAt == issuedAt) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staff, category, search,
      archived, createdAt, issuedAt, expiredAt);

  @override
  String toString() {
    return 'FlightCrewRecordFilterState(staff: $staff, category: $category, search: $search, archived: $archived, createdAt: $createdAt, issuedAt: $issuedAt, expiredAt: $expiredAt)';
  }
}

/// @nodoc
abstract mixin class $FlightCrewRecordFilterStateCopyWith<$Res> {
  factory $FlightCrewRecordFilterStateCopyWith(
          FlightCrewRecordFilterState value,
          $Res Function(FlightCrewRecordFilterState) _then) =
      _$FlightCrewRecordFilterStateCopyWithImpl;
  @useResult
  $Res call(
      {Staff staff,
      FlightCrewRecordCategory category,
      String search,
      bool? archived,
      DateTimeRange? createdAt,
      DateTimeRange? issuedAt,
      DateTimeRange? expiredAt});
}

/// @nodoc
class _$FlightCrewRecordFilterStateCopyWithImpl<$Res>
    implements $FlightCrewRecordFilterStateCopyWith<$Res> {
  _$FlightCrewRecordFilterStateCopyWithImpl(this._self, this._then);

  final FlightCrewRecordFilterState _self;
  final $Res Function(FlightCrewRecordFilterState) _then;

  /// Create a copy of FlightCrewRecordFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staff = null,
    Object? category = null,
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
    Object? issuedAt = freezed,
    Object? expiredAt = freezed,
  }) {
    return _then(_self.copyWith(
      staff: null == staff
          ? _self.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as Staff,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as FlightCrewRecordCategory,
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
      issuedAt: freezed == issuedAt
          ? _self.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      expiredAt: freezed == expiredAt
          ? _self.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ));
  }
}

/// @nodoc

class _FlightCrewRecordFilterState extends FlightCrewRecordFilterState {
  _FlightCrewRecordFilterState(
      {required this.staff,
      required this.category,
      this.search = "",
      this.archived = false,
      this.createdAt,
      this.issuedAt,
      this.expiredAt})
      : super._();

  @override
  final Staff staff;
  @override
  final FlightCrewRecordCategory category;
  @override
  @JsonKey()
  final String search;
  @override
  @JsonKey()
  final bool? archived;
  @override
  final DateTimeRange? createdAt;
  @override
  final DateTimeRange? issuedAt;
  @override
  final DateTimeRange? expiredAt;

  /// Create a copy of FlightCrewRecordFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FlightCrewRecordFilterStateCopyWith<_FlightCrewRecordFilterState>
      get copyWith => __$FlightCrewRecordFilterStateCopyWithImpl<
          _FlightCrewRecordFilterState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FlightCrewRecordFilterState &&
            (identical(other.staff, staff) || other.staff == staff) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.issuedAt, issuedAt) ||
                other.issuedAt == issuedAt) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staff, category, search,
      archived, createdAt, issuedAt, expiredAt);

  @override
  String toString() {
    return 'FlightCrewRecordFilterState(staff: $staff, category: $category, search: $search, archived: $archived, createdAt: $createdAt, issuedAt: $issuedAt, expiredAt: $expiredAt)';
  }
}

/// @nodoc
abstract mixin class _$FlightCrewRecordFilterStateCopyWith<$Res>
    implements $FlightCrewRecordFilterStateCopyWith<$Res> {
  factory _$FlightCrewRecordFilterStateCopyWith(
          _FlightCrewRecordFilterState value,
          $Res Function(_FlightCrewRecordFilterState) _then) =
      __$FlightCrewRecordFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Staff staff,
      FlightCrewRecordCategory category,
      String search,
      bool? archived,
      DateTimeRange? createdAt,
      DateTimeRange? issuedAt,
      DateTimeRange? expiredAt});
}

/// @nodoc
class __$FlightCrewRecordFilterStateCopyWithImpl<$Res>
    implements _$FlightCrewRecordFilterStateCopyWith<$Res> {
  __$FlightCrewRecordFilterStateCopyWithImpl(this._self, this._then);

  final _FlightCrewRecordFilterState _self;
  final $Res Function(_FlightCrewRecordFilterState) _then;

  /// Create a copy of FlightCrewRecordFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? staff = null,
    Object? category = null,
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
    Object? issuedAt = freezed,
    Object? expiredAt = freezed,
  }) {
    return _then(_FlightCrewRecordFilterState(
      staff: null == staff
          ? _self.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as Staff,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as FlightCrewRecordCategory,
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
      issuedAt: freezed == issuedAt
          ? _self.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      expiredAt: freezed == expiredAt
          ? _self.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ));
  }
}

// dart format on
