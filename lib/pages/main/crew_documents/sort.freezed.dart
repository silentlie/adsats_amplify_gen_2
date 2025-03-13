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
mixin _$CrewDocumentSortState {
  bool get sortAscending;
  int get sortColumnIndex;
  Comparable Function(CrewDocument crewDocument) get getField;
  int get rowsPerPage;

  /// Create a copy of CrewDocumentSortState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CrewDocumentSortStateCopyWith<CrewDocumentSortState> get copyWith =>
      _$CrewDocumentSortStateCopyWithImpl<CrewDocumentSortState>(
          this as CrewDocumentSortState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CrewDocumentSortState &&
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
    return 'CrewDocumentSortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class $CrewDocumentSortStateCopyWith<$Res> {
  factory $CrewDocumentSortStateCopyWith(CrewDocumentSortState value,
          $Res Function(CrewDocumentSortState) _then) =
      _$CrewDocumentSortStateCopyWithImpl;
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable<dynamic> Function(CrewDocument) getField,
      int rowsPerPage});
}

/// @nodoc
class _$CrewDocumentSortStateCopyWithImpl<$Res>
    implements $CrewDocumentSortStateCopyWith<$Res> {
  _$CrewDocumentSortStateCopyWithImpl(this._self, this._then);

  final CrewDocumentSortState _self;
  final $Res Function(CrewDocumentSortState) _then;

  /// Create a copy of CrewDocumentSortState
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

class _CrewDocumentSortState implements CrewDocumentSortState {
  _CrewDocumentSortState(
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

  /// Create a copy of CrewDocumentSortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CrewDocumentSortStateCopyWith<_CrewDocumentSortState> get copyWith =>
      __$CrewDocumentSortStateCopyWithImpl<_CrewDocumentSortState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CrewDocumentSortState &&
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
    return 'CrewDocumentSortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class _$CrewDocumentSortStateCopyWith<$Res>
    implements $CrewDocumentSortStateCopyWith<$Res> {
  factory _$CrewDocumentSortStateCopyWith(_CrewDocumentSortState value,
          $Res Function(_CrewDocumentSortState) _then) =
      __$CrewDocumentSortStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable<dynamic> Function(CrewDocument) getField,
      int rowsPerPage});
}

/// @nodoc
class __$CrewDocumentSortStateCopyWithImpl<$Res>
    implements _$CrewDocumentSortStateCopyWith<$Res> {
  __$CrewDocumentSortStateCopyWithImpl(this._self, this._then);

  final _CrewDocumentSortState _self;
  final $Res Function(_CrewDocumentSortState) _then;

  /// Create a copy of CrewDocumentSortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sortAscending = null,
    Object? sortColumnIndex = null,
    Object? getField = null,
    Object? rowsPerPage = null,
  }) {
    return _then(_CrewDocumentSortState(
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
