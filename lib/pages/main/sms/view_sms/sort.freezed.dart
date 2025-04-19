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
mixin _$NoticeSortState {
  bool get sortAscending;
  int get sortColumnIndex;
  Comparable Function(Notice notice) get getField;
  int get rowsPerPage;

  /// Create a copy of NoticeSortState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NoticeSortStateCopyWith<NoticeSortState> get copyWith =>
      _$NoticeSortStateCopyWithImpl<NoticeSortState>(
          this as NoticeSortState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NoticeSortState &&
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
    return 'NoticeSortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class $NoticeSortStateCopyWith<$Res> {
  factory $NoticeSortStateCopyWith(
          NoticeSortState value, $Res Function(NoticeSortState) _then) =
      _$NoticeSortStateCopyWithImpl;
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable Function(Notice notice) getField,
      int rowsPerPage});
}

/// @nodoc
class _$NoticeSortStateCopyWithImpl<$Res>
    implements $NoticeSortStateCopyWith<$Res> {
  _$NoticeSortStateCopyWithImpl(this._self, this._then);

  final NoticeSortState _self;
  final $Res Function(NoticeSortState) _then;

  /// Create a copy of NoticeSortState
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
              as Comparable Function(Notice notice),
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _NoticeSortState implements NoticeSortState {
  _NoticeSortState(
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
  final Comparable Function(Notice notice) getField;
  @override
  @JsonKey()
  final int rowsPerPage;

  /// Create a copy of NoticeSortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NoticeSortStateCopyWith<_NoticeSortState> get copyWith =>
      __$NoticeSortStateCopyWithImpl<_NoticeSortState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoticeSortState &&
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
    return 'NoticeSortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class _$NoticeSortStateCopyWith<$Res>
    implements $NoticeSortStateCopyWith<$Res> {
  factory _$NoticeSortStateCopyWith(
          _NoticeSortState value, $Res Function(_NoticeSortState) _then) =
      __$NoticeSortStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable Function(Notice notice) getField,
      int rowsPerPage});
}

/// @nodoc
class __$NoticeSortStateCopyWithImpl<$Res>
    implements _$NoticeSortStateCopyWith<$Res> {
  __$NoticeSortStateCopyWithImpl(this._self, this._then);

  final _NoticeSortState _self;
  final $Res Function(_NoticeSortState) _then;

  /// Create a copy of NoticeSortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sortAscending = null,
    Object? sortColumnIndex = null,
    Object? getField = null,
    Object? rowsPerPage = null,
  }) {
    return _then(_NoticeSortState(
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
              as Comparable Function(Notice notice),
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
