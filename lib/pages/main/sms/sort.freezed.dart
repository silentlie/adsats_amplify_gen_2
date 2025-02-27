// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SortState {
  bool get sortAscending => throw _privateConstructorUsedError;
  int get sortColumnIndex => throw _privateConstructorUsedError;
  Comparable<dynamic> Function(Notice) get getField =>
      throw _privateConstructorUsedError;
  int get rowsPerPage => throw _privateConstructorUsedError;

  /// Create a copy of SortState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SortStateCopyWith<SortState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortStateCopyWith<$Res> {
  factory $SortStateCopyWith(SortState value, $Res Function(SortState) then) =
      _$SortStateCopyWithImpl<$Res, SortState>;
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable<dynamic> Function(Notice) getField,
      int rowsPerPage});
}

/// @nodoc
class _$SortStateCopyWithImpl<$Res, $Val extends SortState>
    implements $SortStateCopyWith<$Res> {
  _$SortStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SortState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortAscending = null,
    Object? sortColumnIndex = null,
    Object? getField = null,
    Object? rowsPerPage = null,
  }) {
    return _then(_value.copyWith(
      sortAscending: null == sortAscending
          ? _value.sortAscending
          : sortAscending // ignore: cast_nullable_to_non_nullable
              as bool,
      sortColumnIndex: null == sortColumnIndex
          ? _value.sortColumnIndex
          : sortColumnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      getField: null == getField
          ? _value.getField
          : getField // ignore: cast_nullable_to_non_nullable
              as Comparable<dynamic> Function(Notice),
      rowsPerPage: null == rowsPerPage
          ? _value.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SortStateImplCopyWith<$Res>
    implements $SortStateCopyWith<$Res> {
  factory _$$SortStateImplCopyWith(
          _$SortStateImpl value, $Res Function(_$SortStateImpl) then) =
      __$$SortStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable<dynamic> Function(Notice) getField,
      int rowsPerPage});
}

/// @nodoc
class __$$SortStateImplCopyWithImpl<$Res>
    extends _$SortStateCopyWithImpl<$Res, _$SortStateImpl>
    implements _$$SortStateImplCopyWith<$Res> {
  __$$SortStateImplCopyWithImpl(
      _$SortStateImpl _value, $Res Function(_$SortStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SortState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortAscending = null,
    Object? sortColumnIndex = null,
    Object? getField = null,
    Object? rowsPerPage = null,
  }) {
    return _then(_$SortStateImpl(
      sortAscending: null == sortAscending
          ? _value.sortAscending
          : sortAscending // ignore: cast_nullable_to_non_nullable
              as bool,
      sortColumnIndex: null == sortColumnIndex
          ? _value.sortColumnIndex
          : sortColumnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      getField: null == getField
          ? _value.getField
          : getField // ignore: cast_nullable_to_non_nullable
              as Comparable<dynamic> Function(Notice),
      rowsPerPage: null == rowsPerPage
          ? _value.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SortStateImpl implements _SortState {
  _$SortStateImpl(
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
  final Comparable<dynamic> Function(Notice) getField;
  @override
  @JsonKey()
  final int rowsPerPage;

  @override
  String toString() {
    return 'SortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SortStateImpl &&
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

  /// Create a copy of SortState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SortStateImplCopyWith<_$SortStateImpl> get copyWith =>
      __$$SortStateImplCopyWithImpl<_$SortStateImpl>(this, _$identity);
}

abstract class _SortState implements SortState {
  factory _SortState(
      {final bool sortAscending,
      final int sortColumnIndex,
      required final Comparable<dynamic> Function(Notice) getField,
      final int rowsPerPage}) = _$SortStateImpl;

  @override
  bool get sortAscending;
  @override
  int get sortColumnIndex;
  @override
  Comparable<dynamic> Function(Notice) get getField;
  @override
  int get rowsPerPage;

  /// Create a copy of SortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SortStateImplCopyWith<_$SortStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
