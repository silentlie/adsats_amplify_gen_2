// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StaffSortState {
  bool get sortAscending;
  int get sortColumnIndex;
  Comparable Function(Staff staff) get getField;
  int get rowsPerPage;

  /// Create a copy of StaffSortState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StaffSortStateCopyWith<StaffSortState> get copyWith =>
      _$StaffSortStateCopyWithImpl<StaffSortState>(
          this as StaffSortState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StaffSortState &&
            (identical(other.sortAscending, sortAscending) ||
                other.sortAscending == sortAscending) &&
            (identical(other.sortColumnIndex, sortColumnIndex) ||
                other.sortColumnIndex == sortColumnIndex) &&
            (identical(other.getField, getField) ||
                other.getField == getField) &&
            (identical(other.rowsPerPage, rowsPerPage) ||
                other.rowsPerPage == rowsPerPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, sortAscending, sortColumnIndex, getField, rowsPerPage);

  @override
  String toString() {
    return 'StaffSortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class $StaffSortStateCopyWith<$Res> {
  factory $StaffSortStateCopyWith(
          StaffSortState value, $Res Function(StaffSortState) _then) =
      _$StaffSortStateCopyWithImpl;
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable Function(Staff staff) getField,
      int rowsPerPage});
}

/// @nodoc
class _$StaffSortStateCopyWithImpl<$Res>
    implements $StaffSortStateCopyWith<$Res> {
  _$StaffSortStateCopyWithImpl(this._self, this._then);

  final StaffSortState _self;
  final $Res Function(StaffSortState) _then;

  /// Create a copy of StaffSortState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortAscending = null,
    Object? sortColumnIndex = null,
    Object? getField = null,
    Object? rowsPerPage = null,
  }) {
    return _then(_self.copyWith(
      sortAscending: null == sortAscending
          ? _self.sortAscending
          : sortAscending // ignore: cast_nullable_to_non_nullable
              as bool,
      sortColumnIndex: null == sortColumnIndex
          ? _self.sortColumnIndex
          : sortColumnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      getField: null == getField
          ? _self.getField
          : getField // ignore: cast_nullable_to_non_nullable
              as Comparable Function(Staff staff),
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _StaffSortState implements StaffSortState {
  _StaffSortState(
      {this.sortAscending = false,
      this.sortColumnIndex = 5,
      required this.getField,
      this.rowsPerPage = PaginatedDataTable.defaultRowsPerPage});

  @override
  @JsonKey()
  final bool sortAscending;
  @override
  @JsonKey()
  final int sortColumnIndex;
  @override
  final Comparable Function(Staff staff) getField;
  @override
  @JsonKey()
  final int rowsPerPage;

  /// Create a copy of StaffSortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StaffSortStateCopyWith<_StaffSortState> get copyWith =>
      __$StaffSortStateCopyWithImpl<_StaffSortState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StaffSortState &&
            (identical(other.sortAscending, sortAscending) ||
                other.sortAscending == sortAscending) &&
            (identical(other.sortColumnIndex, sortColumnIndex) ||
                other.sortColumnIndex == sortColumnIndex) &&
            (identical(other.getField, getField) ||
                other.getField == getField) &&
            (identical(other.rowsPerPage, rowsPerPage) ||
                other.rowsPerPage == rowsPerPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, sortAscending, sortColumnIndex, getField, rowsPerPage);

  @override
  String toString() {
    return 'StaffSortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class _$StaffSortStateCopyWith<$Res>
    implements $StaffSortStateCopyWith<$Res> {
  factory _$StaffSortStateCopyWith(
          _StaffSortState value, $Res Function(_StaffSortState) _then) =
      __$StaffSortStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable Function(Staff staff) getField,
      int rowsPerPage});
}

/// @nodoc
class __$StaffSortStateCopyWithImpl<$Res>
    implements _$StaffSortStateCopyWith<$Res> {
  __$StaffSortStateCopyWithImpl(this._self, this._then);

  final _StaffSortState _self;
  final $Res Function(_StaffSortState) _then;

  /// Create a copy of StaffSortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sortAscending = null,
    Object? sortColumnIndex = null,
    Object? getField = null,
    Object? rowsPerPage = null,
  }) {
    return _then(_StaffSortState(
      sortAscending: null == sortAscending
          ? _self.sortAscending
          : sortAscending // ignore: cast_nullable_to_non_nullable
              as bool,
      sortColumnIndex: null == sortColumnIndex
          ? _self.sortColumnIndex
          : sortColumnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      getField: null == getField
          ? _self.getField
          : getField // ignore: cast_nullable_to_non_nullable
              as Comparable Function(Staff staff),
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
