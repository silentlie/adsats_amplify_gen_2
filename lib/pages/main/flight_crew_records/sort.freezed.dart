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
mixin _$FlightCrewRecordSortState {
  bool get sortAscending;
  int get sortColumnIndex;
  Comparable Function(CrewDocument crewDocument) get getField;
  int get rowsPerPage;

  /// Create a copy of FlightCrewRecordSortState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlightCrewRecordSortStateCopyWith<FlightCrewRecordSortState> get copyWith =>
      _$FlightCrewRecordSortStateCopyWithImpl<FlightCrewRecordSortState>(
          this as FlightCrewRecordSortState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlightCrewRecordSortState &&
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
    return 'FlightCrewRecordSortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class $FlightCrewRecordSortStateCopyWith<$Res> {
  factory $FlightCrewRecordSortStateCopyWith(FlightCrewRecordSortState value,
          $Res Function(FlightCrewRecordSortState) _then) =
      _$FlightCrewRecordSortStateCopyWithImpl;
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable<dynamic> Function(CrewDocument) getField,
      int rowsPerPage});
}

/// @nodoc
class _$FlightCrewRecordSortStateCopyWithImpl<$Res>
    implements $FlightCrewRecordSortStateCopyWith<$Res> {
  _$FlightCrewRecordSortStateCopyWithImpl(this._self, this._then);

  final FlightCrewRecordSortState _self;
  final $Res Function(FlightCrewRecordSortState) _then;

  /// Create a copy of FlightCrewRecordSortState
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
          ? _self.getField!
          : getField // ignore: cast_nullable_to_non_nullable
              as Comparable<dynamic> Function(CrewDocument),
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _FlightCrewRecordSortState implements FlightCrewRecordSortState {
  _FlightCrewRecordSortState(
      {this.sortAscending = false,
      this.sortColumnIndex = 3,
      required this.getField,
      this.rowsPerPage = PaginatedDataTable.defaultRowsPerPage});

  @override
  @JsonKey()
  final bool sortAscending;
  @override
  @JsonKey()
  final int sortColumnIndex;
  @override
  final Comparable<dynamic> Function(CrewDocument) getField;
  @override
  @JsonKey()
  final int rowsPerPage;

  /// Create a copy of FlightCrewRecordSortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FlightCrewRecordSortStateCopyWith<_FlightCrewRecordSortState>
      get copyWith =>
          __$FlightCrewRecordSortStateCopyWithImpl<_FlightCrewRecordSortState>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FlightCrewRecordSortState &&
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
    return 'FlightCrewRecordSortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class _$FlightCrewRecordSortStateCopyWith<$Res>
    implements $FlightCrewRecordSortStateCopyWith<$Res> {
  factory _$FlightCrewRecordSortStateCopyWith(_FlightCrewRecordSortState value,
          $Res Function(_FlightCrewRecordSortState) _then) =
      __$FlightCrewRecordSortStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable<dynamic> Function(CrewDocument) getField,
      int rowsPerPage});
}

/// @nodoc
class __$FlightCrewRecordSortStateCopyWithImpl<$Res>
    implements _$FlightCrewRecordSortStateCopyWith<$Res> {
  __$FlightCrewRecordSortStateCopyWithImpl(this._self, this._then);

  final _FlightCrewRecordSortState _self;
  final $Res Function(_FlightCrewRecordSortState) _then;

  /// Create a copy of FlightCrewRecordSortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sortAscending = null,
    Object? sortColumnIndex = null,
    Object? getField = null,
    Object? rowsPerPage = null,
  }) {
    return _then(_FlightCrewRecordSortState(
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
              as Comparable<dynamic> Function(CrewDocument),
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
