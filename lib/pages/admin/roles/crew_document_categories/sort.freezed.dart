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
mixin _$CrewDocumentCategorySortState {
  bool get sortAscending;
  int get sortColumnIndex;
  Comparable Function(CrewDocumentCategory crewDocumentCategory) get getField;
  int get rowsPerPage;

  /// Create a copy of CrewDocumentCategorySortState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CrewDocumentCategorySortStateCopyWith<CrewDocumentCategorySortState>
      get copyWith => _$CrewDocumentCategorySortStateCopyWithImpl<
              CrewDocumentCategorySortState>(
          this as CrewDocumentCategorySortState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CrewDocumentCategorySortState &&
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
    return 'CrewDocumentCategorySortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class $CrewDocumentCategorySortStateCopyWith<$Res> {
  factory $CrewDocumentCategorySortStateCopyWith(
          CrewDocumentCategorySortState value,
          $Res Function(CrewDocumentCategorySortState) _then) =
      _$CrewDocumentCategorySortStateCopyWithImpl;
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable<dynamic> Function(CrewDocumentCategory) getField,
      int rowsPerPage});
}

/// @nodoc
class _$CrewDocumentCategorySortStateCopyWithImpl<$Res>
    implements $CrewDocumentCategorySortStateCopyWith<$Res> {
  _$CrewDocumentCategorySortStateCopyWithImpl(this._self, this._then);

  final CrewDocumentCategorySortState _self;
  final $Res Function(CrewDocumentCategorySortState) _then;

  /// Create a copy of CrewDocumentCategorySortState
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
              as Comparable<dynamic> Function(CrewDocumentCategory),
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _CrewDocumentCategorySortState implements CrewDocumentCategorySortState {
  _CrewDocumentCategorySortState(
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
  final Comparable<dynamic> Function(CrewDocumentCategory) getField;
  @override
  @JsonKey()
  final int rowsPerPage;

  /// Create a copy of CrewDocumentCategorySortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CrewDocumentCategorySortStateCopyWith<_CrewDocumentCategorySortState>
      get copyWith => __$CrewDocumentCategorySortStateCopyWithImpl<
          _CrewDocumentCategorySortState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CrewDocumentCategorySortState &&
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
    return 'CrewDocumentCategorySortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class _$CrewDocumentCategorySortStateCopyWith<$Res>
    implements $CrewDocumentCategorySortStateCopyWith<$Res> {
  factory _$CrewDocumentCategorySortStateCopyWith(
          _CrewDocumentCategorySortState value,
          $Res Function(_CrewDocumentCategorySortState) _then) =
      __$CrewDocumentCategorySortStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable<dynamic> Function(CrewDocumentCategory) getField,
      int rowsPerPage});
}

/// @nodoc
class __$CrewDocumentCategorySortStateCopyWithImpl<$Res>
    implements _$CrewDocumentCategorySortStateCopyWith<$Res> {
  __$CrewDocumentCategorySortStateCopyWithImpl(this._self, this._then);

  final _CrewDocumentCategorySortState _self;
  final $Res Function(_CrewDocumentCategorySortState) _then;

  /// Create a copy of CrewDocumentCategorySortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sortAscending = null,
    Object? sortColumnIndex = null,
    Object? getField = null,
    Object? rowsPerPage = null,
  }) {
    return _then(_CrewDocumentCategorySortState(
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
              as Comparable<dynamic> Function(CrewDocumentCategory),
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
