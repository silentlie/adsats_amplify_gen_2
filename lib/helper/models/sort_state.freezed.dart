// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SortState<T> {
  bool get sortAscending;
  int get sortColumnIndex;
  Comparable? Function(T notice) get getField;
  int Function(T a, T b, bool sortAscending)? get custom;
  int get rowsPerPage;

  /// Create a copy of SortState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SortStateCopyWith<T, SortState<T>> get copyWith =>
      _$SortStateCopyWithImpl<T, SortState<T>>(
          this as SortState<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SortState<T> &&
            (identical(other.sortAscending, sortAscending) ||
                other.sortAscending == sortAscending) &&
            (identical(other.sortColumnIndex, sortColumnIndex) ||
                other.sortColumnIndex == sortColumnIndex) &&
            (identical(other.getField, getField) ||
                other.getField == getField) &&
            (identical(other.custom, custom) || other.custom == custom) &&
            (identical(other.rowsPerPage, rowsPerPage) ||
                other.rowsPerPage == rowsPerPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortAscending, sortColumnIndex,
      getField, custom, rowsPerPage);

  @override
  String toString() {
    return 'SortState<$T>(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, custom: $custom, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class $SortStateCopyWith<T, $Res> {
  factory $SortStateCopyWith(
          SortState<T> value, $Res Function(SortState<T>) _then) =
      _$SortStateCopyWithImpl;
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable? Function(T notice) getField,
      int Function(T a, T b, bool sortAscending)? custom,
      int rowsPerPage});
}

/// @nodoc
class _$SortStateCopyWithImpl<T, $Res> implements $SortStateCopyWith<T, $Res> {
  _$SortStateCopyWithImpl(this._self, this._then);

  final SortState<T> _self;
  final $Res Function(SortState<T>) _then;

  /// Create a copy of SortState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortAscending = null,
    Object? sortColumnIndex = null,
    Object? getField = null,
    Object? custom = freezed,
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
              as Comparable? Function(T notice),
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as int Function(T a, T b, bool sortAscending)?,
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [SortState].
extension SortStatePatterns<T> on SortState<T> {
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
    TResult Function(_SortState<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SortState() when $default != null:
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
    TResult Function(_SortState<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SortState():
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
    TResult? Function(_SortState<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SortState() when $default != null:
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
            Comparable? Function(T notice) getField,
            int Function(T a, T b, bool sortAscending)? custom,
            int rowsPerPage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SortState() when $default != null:
        return $default(_that.sortAscending, _that.sortColumnIndex,
            _that.getField, _that.custom, _that.rowsPerPage);
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
            Comparable? Function(T notice) getField,
            int Function(T a, T b, bool sortAscending)? custom,
            int rowsPerPage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SortState():
        return $default(_that.sortAscending, _that.sortColumnIndex,
            _that.getField, _that.custom, _that.rowsPerPage);
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
            Comparable? Function(T notice) getField,
            int Function(T a, T b, bool sortAscending)? custom,
            int rowsPerPage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SortState() when $default != null:
        return $default(_that.sortAscending, _that.sortColumnIndex,
            _that.getField, _that.custom, _that.rowsPerPage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SortState<T> implements SortState<T> {
  const _SortState(
      {this.sortAscending = false,
      this.sortColumnIndex = 0,
      required this.getField,
      this.custom = null,
      this.rowsPerPage = PaginatedDataTable.defaultRowsPerPage});

  @override
  @JsonKey()
  final bool sortAscending;
  @override
  @JsonKey()
  final int sortColumnIndex;
  @override
  final Comparable? Function(T notice) getField;
  @override
  @JsonKey()
  final int Function(T a, T b, bool sortAscending)? custom;
  @override
  @JsonKey()
  final int rowsPerPage;

  /// Create a copy of SortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SortStateCopyWith<T, _SortState<T>> get copyWith =>
      __$SortStateCopyWithImpl<T, _SortState<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SortState<T> &&
            (identical(other.sortAscending, sortAscending) ||
                other.sortAscending == sortAscending) &&
            (identical(other.sortColumnIndex, sortColumnIndex) ||
                other.sortColumnIndex == sortColumnIndex) &&
            (identical(other.getField, getField) ||
                other.getField == getField) &&
            (identical(other.custom, custom) || other.custom == custom) &&
            (identical(other.rowsPerPage, rowsPerPage) ||
                other.rowsPerPage == rowsPerPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortAscending, sortColumnIndex,
      getField, custom, rowsPerPage);

  @override
  String toString() {
    return 'SortState<$T>(sortAscending: $sortAscending, sortColumnIndex: $sortColumnIndex, getField: $getField, custom: $custom, rowsPerPage: $rowsPerPage)';
  }
}

/// @nodoc
abstract mixin class _$SortStateCopyWith<T, $Res>
    implements $SortStateCopyWith<T, $Res> {
  factory _$SortStateCopyWith(
          _SortState<T> value, $Res Function(_SortState<T>) _then) =
      __$SortStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool sortAscending,
      int sortColumnIndex,
      Comparable? Function(T notice) getField,
      int Function(T a, T b, bool sortAscending)? custom,
      int rowsPerPage});
}

/// @nodoc
class __$SortStateCopyWithImpl<T, $Res>
    implements _$SortStateCopyWith<T, $Res> {
  __$SortStateCopyWithImpl(this._self, this._then);

  final _SortState<T> _self;
  final $Res Function(_SortState<T>) _then;

  /// Create a copy of SortState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sortAscending = null,
    Object? sortColumnIndex = null,
    Object? getField = null,
    Object? custom = freezed,
    Object? rowsPerPage = null,
  }) {
    return _then(_SortState<T>(
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
              as Comparable? Function(T notice),
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as int Function(T a, T b, bool sortAscending)?,
      rowsPerPage: null == rowsPerPage
          ? _self.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
