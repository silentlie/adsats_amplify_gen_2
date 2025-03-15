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
mixin _$RoleSortState {
  bool get sortAscending;
  int get sortColumnIndex;
  Comparable Function(Role role) get getField;
  int get rowsPerPage;

  /// Create a copy of RoleSortState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoleSortStateCopyWith<RoleSortState> get copyWith =>
      _$RoleSortStateCopyWithImpl<RoleSortState>(
          this as RoleSortState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoleSortState &&
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
    return 'RoleSortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class $RoleSortStateCopyWith<$Res> {
  factory $RoleSortStateCopyWith(
          RoleSortState value, $Res Function(RoleSortState) _then) =
      _$RoleSortStateCopyWithImpl;
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable<dynamic> Function(Role) getField,
      int rowsPerPage});
}

/// @nodoc
class _$RoleSortStateCopyWithImpl<$Res>
    implements $RoleSortStateCopyWith<$Res> {
  _$RoleSortStateCopyWithImpl(this._self, this._then);

  final RoleSortState _self;
  final $Res Function(RoleSortState) _then;

  /// Create a copy of RoleSortState
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
              as Comparable<dynamic> Function(Role),
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _RoleSortState implements RoleSortState {
  _RoleSortState(
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
  final Comparable<dynamic> Function(Role) getField;
  @override
  @JsonKey()
  final int rowsPerPage;

  /// Create a copy of RoleSortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoleSortStateCopyWith<_RoleSortState> get copyWith =>
      __$RoleSortStateCopyWithImpl<_RoleSortState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoleSortState &&
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
    return 'RoleSortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class _$RoleSortStateCopyWith<$Res>
    implements $RoleSortStateCopyWith<$Res> {
  factory _$RoleSortStateCopyWith(
          _RoleSortState value, $Res Function(_RoleSortState) _then) =
      __$RoleSortStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable<dynamic> Function(Role) getField,
      int rowsPerPage});
}

/// @nodoc
class __$RoleSortStateCopyWithImpl<$Res>
    implements _$RoleSortStateCopyWith<$Res> {
  __$RoleSortStateCopyWithImpl(this._self, this._then);

  final _RoleSortState _self;
  final $Res Function(_RoleSortState) _then;

  /// Create a copy of RoleSortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sortAscending = null,
    Object? sortColumnIndex = null,
    Object? getField = null,
    Object? rowsPerPage = null,
  }) {
    return _then(_RoleSortState(
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
              as Comparable<dynamic> Function(Role),
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
