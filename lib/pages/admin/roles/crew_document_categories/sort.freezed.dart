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
mixin _$CrewDocumentCategorySortState {
  bool get sortAscending => throw _privateConstructorUsedError;
  int get sortColumnIndex => throw _privateConstructorUsedError;
  Comparable<dynamic> Function(CrewDocumentCategory) get getField =>
      throw _privateConstructorUsedError;
  int get rowsPerPage => throw _privateConstructorUsedError;

  /// Create a copy of CrewDocumentCategorySortState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CrewDocumentCategorySortStateCopyWith<CrewDocumentCategorySortState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrewDocumentCategorySortStateCopyWith<$Res> {
  factory $CrewDocumentCategorySortStateCopyWith(
          CrewDocumentCategorySortState value,
          $Res Function(CrewDocumentCategorySortState) then) =
      _$CrewDocumentCategorySortStateCopyWithImpl<$Res,
          CrewDocumentCategorySortState>;
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable<dynamic> Function(CrewDocumentCategory) getField,
      int rowsPerPage});
}

/// @nodoc
class _$CrewDocumentCategorySortStateCopyWithImpl<$Res,
        $Val extends CrewDocumentCategorySortState>
    implements $CrewDocumentCategorySortStateCopyWith<$Res> {
  _$CrewDocumentCategorySortStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              as Comparable<dynamic> Function(CrewDocumentCategory),
      rowsPerPage: null == rowsPerPage
          ? _value.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrewDocumentCategorySortStateImplCopyWith<$Res>
    implements $CrewDocumentCategorySortStateCopyWith<$Res> {
  factory _$$CrewDocumentCategorySortStateImplCopyWith(
          _$CrewDocumentCategorySortStateImpl value,
          $Res Function(_$CrewDocumentCategorySortStateImpl) then) =
      __$$CrewDocumentCategorySortStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable<dynamic> Function(CrewDocumentCategory) getField,
      int rowsPerPage});
}

/// @nodoc
class __$$CrewDocumentCategorySortStateImplCopyWithImpl<$Res>
    extends _$CrewDocumentCategorySortStateCopyWithImpl<$Res,
        _$CrewDocumentCategorySortStateImpl>
    implements _$$CrewDocumentCategorySortStateImplCopyWith<$Res> {
  __$$CrewDocumentCategorySortStateImplCopyWithImpl(
      _$CrewDocumentCategorySortStateImpl _value,
      $Res Function(_$CrewDocumentCategorySortStateImpl) _then)
      : super(_value, _then);

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
    return _then(_$CrewDocumentCategorySortStateImpl(
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
              as Comparable<dynamic> Function(CrewDocumentCategory),
      rowsPerPage: null == rowsPerPage
          ? _value.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CrewDocumentCategorySortStateImpl
    implements _CrewDocumentCategorySortState {
  _$CrewDocumentCategorySortStateImpl(
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

  @override
  String toString() {
    return 'CrewDocumentCategorySortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrewDocumentCategorySortStateImpl &&
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

  /// Create a copy of CrewDocumentCategorySortState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CrewDocumentCategorySortStateImplCopyWith<
          _$CrewDocumentCategorySortStateImpl>
      get copyWith => __$$CrewDocumentCategorySortStateImplCopyWithImpl<
          _$CrewDocumentCategorySortStateImpl>(this, _$identity);
}

abstract class _CrewDocumentCategorySortState
    implements CrewDocumentCategorySortState {
  factory _CrewDocumentCategorySortState(
      {final bool sortAscending,
      final int sortColumnIndex,
      required final Comparable<dynamic> Function(CrewDocumentCategory)
          getField,
      final int rowsPerPage}) = _$CrewDocumentCategorySortStateImpl;

  @override
  bool get sortAscending;
  @override
  int get sortColumnIndex;
  @override
  Comparable<dynamic> Function(CrewDocumentCategory) get getField;
  @override
  int get rowsPerPage;

  /// Create a copy of CrewDocumentCategorySortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CrewDocumentCategorySortStateImplCopyWith<
          _$CrewDocumentCategorySortStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
