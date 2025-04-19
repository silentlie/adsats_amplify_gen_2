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
mixin _$SessionSortState {
  bool get sortAscending;
  int get sortColumnIndex;
  Comparable Function(Session session) get getField;
  int get rowsPerPage;

  /// Create a copy of SessionSortState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionSortStateCopyWith<SessionSortState> get copyWith =>
      _$SessionSortStateCopyWithImpl<SessionSortState>(
          this as SessionSortState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionSortState &&
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
    return 'SessionSortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class $SessionSortStateCopyWith<$Res> {
  factory $SessionSortStateCopyWith(
          SessionSortState value, $Res Function(SessionSortState) _then) =
      _$SessionSortStateCopyWithImpl;
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable Function(Session session) getField,
      int rowsPerPage});
}

/// @nodoc
class _$SessionSortStateCopyWithImpl<$Res>
    implements $SessionSortStateCopyWith<$Res> {
  _$SessionSortStateCopyWithImpl(this._self, this._then);

  final SessionSortState _self;
  final $Res Function(SessionSortState) _then;

  /// Create a copy of SessionSortState
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
              as Comparable Function(Session session),
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _SessionSortState implements SessionSortState {
  _SessionSortState(
      {this.sortAscending = false,
      this.sortColumnIndex = 0,
      required this.getField,
      this.rowsPerPage = PaginatedDataTable.defaultRowsPerPage});

  @override
  @JsonKey()
  final bool sortAscending;
  @override
  @JsonKey()
  final int sortColumnIndex;
  @override
  final Comparable Function(Session session) getField;
  @override
  @JsonKey()
  final int rowsPerPage;

  /// Create a copy of SessionSortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionSortStateCopyWith<_SessionSortState> get copyWith =>
      __$SessionSortStateCopyWithImpl<_SessionSortState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionSortState &&
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
    return 'SessionSortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class _$SessionSortStateCopyWith<$Res>
    implements $SessionSortStateCopyWith<$Res> {
  factory _$SessionSortStateCopyWith(
          _SessionSortState value, $Res Function(_SessionSortState) _then) =
      __$SessionSortStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable Function(Session session) getField,
      int rowsPerPage});
}

/// @nodoc
class __$SessionSortStateCopyWithImpl<$Res>
    implements _$SessionSortStateCopyWith<$Res> {
  __$SessionSortStateCopyWithImpl(this._self, this._then);

  final _SessionSortState _self;
  final $Res Function(_SessionSortState) _then;

  /// Create a copy of SessionSortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sortAscending = null,
    Object? sortColumnIndex = null,
    Object? getField = null,
    Object? rowsPerPage = null,
  }) {
    return _then(_SessionSortState(
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
              as Comparable Function(Session session),
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
