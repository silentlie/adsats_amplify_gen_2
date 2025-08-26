// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlightCrewRecordsCategorySortState {
  bool get sortAscending;
  int get sortColumnIndex;
  Comparable Function(FlightCrewRecordCategory flightCrewRecordCategory)
      get getField;
  int get rowsPerPage;

  /// Create a copy of FlightCrewRecordsCategorySortState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlightCrewRecordsCategorySortStateCopyWith<
          FlightCrewRecordsCategorySortState>
      get copyWith => _$FlightCrewRecordsCategorySortStateCopyWithImpl<
              FlightCrewRecordsCategorySortState>(
          this as FlightCrewRecordsCategorySortState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlightCrewRecordsCategorySortState &&
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
    return 'FlightCrewRecordsCategorySortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class $FlightCrewRecordsCategorySortStateCopyWith<$Res> {
  factory $FlightCrewRecordsCategorySortStateCopyWith(
          FlightCrewRecordsCategorySortState value,
          $Res Function(FlightCrewRecordsCategorySortState) _then) =
      _$FlightCrewRecordsCategorySortStateCopyWithImpl;
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable Function(FlightCrewRecordCategory flightCrewRecordCategory)
          getField,
      int rowsPerPage});
}

/// @nodoc
class _$FlightCrewRecordsCategorySortStateCopyWithImpl<$Res>
    implements $FlightCrewRecordsCategorySortStateCopyWith<$Res> {
  _$FlightCrewRecordsCategorySortStateCopyWithImpl(this._self, this._then);

  final FlightCrewRecordsCategorySortState _self;
  final $Res Function(FlightCrewRecordsCategorySortState) _then;

  /// Create a copy of FlightCrewRecordsCategorySortState
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
              as Comparable Function(
                  FlightCrewRecordCategory flightCrewRecordCategory),
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [FlightCrewRecordsCategorySortState].
extension FlightCrewRecordsCategorySortStatePatterns
    on FlightCrewRecordsCategorySortState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FlightCrewRecordsCategorySortState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FlightCrewRecordsCategorySortState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FlightCrewRecordsCategorySortState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FlightCrewRecordsCategorySortState():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FlightCrewRecordsCategorySortState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FlightCrewRecordsCategorySortState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool sortAscending,
            int sortColumnIndex,
            Comparable Function(
                    FlightCrewRecordCategory flightCrewRecordCategory)
                getField,
            int rowsPerPage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FlightCrewRecordsCategorySortState() when $default != null:
        return $default(_that.sortAscending, _that.sortColumnIndex,
            _that.getField, _that.rowsPerPage);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool sortAscending,
            int sortColumnIndex,
            Comparable Function(
                    FlightCrewRecordCategory flightCrewRecordCategory)
                getField,
            int rowsPerPage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FlightCrewRecordsCategorySortState():
        return $default(_that.sortAscending, _that.sortColumnIndex,
            _that.getField, _that.rowsPerPage);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            bool sortAscending,
            int sortColumnIndex,
            Comparable Function(
                    FlightCrewRecordCategory flightCrewRecordCategory)
                getField,
            int rowsPerPage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FlightCrewRecordsCategorySortState() when $default != null:
        return $default(_that.sortAscending, _that.sortColumnIndex,
            _that.getField, _that.rowsPerPage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FlightCrewRecordsCategorySortState
    implements FlightCrewRecordsCategorySortState {
  _FlightCrewRecordsCategorySortState(
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
  final Comparable Function(FlightCrewRecordCategory flightCrewRecordCategory)
      getField;
  @override
  @JsonKey()
  final int rowsPerPage;

  /// Create a copy of FlightCrewRecordsCategorySortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FlightCrewRecordsCategorySortStateCopyWith<
          _FlightCrewRecordsCategorySortState>
      get copyWith => __$FlightCrewRecordsCategorySortStateCopyWithImpl<
          _FlightCrewRecordsCategorySortState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FlightCrewRecordsCategorySortState &&
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
    return 'FlightCrewRecordsCategorySortState(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class _$FlightCrewRecordsCategorySortStateCopyWith<$Res>
    implements $FlightCrewRecordsCategorySortStateCopyWith<$Res> {
  factory _$FlightCrewRecordsCategorySortStateCopyWith(
          _FlightCrewRecordsCategorySortState value,
          $Res Function(_FlightCrewRecordsCategorySortState) _then) =
      __$FlightCrewRecordsCategorySortStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable Function(FlightCrewRecordCategory flightCrewRecordCategory)
          getField,
      int rowsPerPage});
}

/// @nodoc
class __$FlightCrewRecordsCategorySortStateCopyWithImpl<$Res>
    implements _$FlightCrewRecordsCategorySortStateCopyWith<$Res> {
  __$FlightCrewRecordsCategorySortStateCopyWithImpl(this._self, this._then);

  final _FlightCrewRecordsCategorySortState _self;
  final $Res Function(_FlightCrewRecordsCategorySortState) _then;

  /// Create a copy of FlightCrewRecordsCategorySortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sortAscending = null,
    Object? sortColumnIndex = null,
    Object? getField = null,
    Object? rowsPerPage = null,
  }) {
    return _then(_FlightCrewRecordsCategorySortState(
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
              as Comparable Function(
                  FlightCrewRecordCategory flightCrewRecordCategory),
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
