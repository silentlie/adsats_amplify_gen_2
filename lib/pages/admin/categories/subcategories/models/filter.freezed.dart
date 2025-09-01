// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubcategoryFilterState {
  String get search;
  bool? get archived;
  DateTimeRange? get createdAt;
  String get categoryId;

  /// Create a copy of SubcategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubcategoryFilterStateCopyWith<SubcategoryFilterState> get copyWith =>
      _$SubcategoryFilterStateCopyWithImpl<SubcategoryFilterState>(
          this as SubcategoryFilterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubcategoryFilterState &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, search, archived, createdAt, categoryId);

  @override
  String toString() {
    return 'SubcategoryFilterState(search: $search, archived: $archived, createdAt: $createdAt, categoryId: $categoryId)';
  }
}

/// @nodoc
abstract mixin class $SubcategoryFilterStateCopyWith<$Res> {
  factory $SubcategoryFilterStateCopyWith(SubcategoryFilterState value,
          $Res Function(SubcategoryFilterState) _then) =
      _$SubcategoryFilterStateCopyWithImpl;
  @useResult
  $Res call(
      {String search,
      bool? archived,
      DateTimeRange? createdAt,
      String categoryId});
}

/// @nodoc
class _$SubcategoryFilterStateCopyWithImpl<$Res>
    implements $SubcategoryFilterStateCopyWith<$Res> {
  _$SubcategoryFilterStateCopyWithImpl(this._self, this._then);

  final SubcategoryFilterState _self;
  final $Res Function(SubcategoryFilterState) _then;

  /// Create a copy of SubcategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
    Object? categoryId = null,
  }) {
    return _then(_self.copyWith(
      search: null == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      archived: freezed == archived
          ? _self.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubcategoryFilterState].
extension SubcategoryFilterStatePatterns on SubcategoryFilterState {
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
    TResult Function(_SubcategoryFilterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubcategoryFilterState() when $default != null:
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
    TResult Function(_SubcategoryFilterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubcategoryFilterState():
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
    TResult? Function(_SubcategoryFilterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubcategoryFilterState() when $default != null:
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
    TResult Function(String search, bool? archived, DateTimeRange? createdAt,
            String categoryId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubcategoryFilterState() when $default != null:
        return $default(
            _that.search, _that.archived, _that.createdAt, _that.categoryId);
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
    TResult Function(String search, bool? archived, DateTimeRange? createdAt,
            String categoryId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubcategoryFilterState():
        return $default(
            _that.search, _that.archived, _that.createdAt, _that.categoryId);
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
    TResult? Function(String search, bool? archived, DateTimeRange? createdAt,
            String categoryId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubcategoryFilterState() when $default != null:
        return $default(
            _that.search, _that.archived, _that.createdAt, _that.categoryId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SubcategoryFilterState extends SubcategoryFilterState {
  _SubcategoryFilterState(
      {this.search = "",
      this.archived = false,
      this.createdAt,
      required this.categoryId})
      : super._();

  @override
  @JsonKey()
  final String search;
  @override
  @JsonKey()
  final bool? archived;
  @override
  final DateTimeRange? createdAt;
  @override
  final String categoryId;

  /// Create a copy of SubcategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubcategoryFilterStateCopyWith<_SubcategoryFilterState> get copyWith =>
      __$SubcategoryFilterStateCopyWithImpl<_SubcategoryFilterState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubcategoryFilterState &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, search, archived, createdAt, categoryId);

  @override
  String toString() {
    return 'SubcategoryFilterState(search: $search, archived: $archived, createdAt: $createdAt, categoryId: $categoryId)';
  }
}

/// @nodoc
abstract mixin class _$SubcategoryFilterStateCopyWith<$Res>
    implements $SubcategoryFilterStateCopyWith<$Res> {
  factory _$SubcategoryFilterStateCopyWith(_SubcategoryFilterState value,
          $Res Function(_SubcategoryFilterState) _then) =
      __$SubcategoryFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String search,
      bool? archived,
      DateTimeRange? createdAt,
      String categoryId});
}

/// @nodoc
class __$SubcategoryFilterStateCopyWithImpl<$Res>
    implements _$SubcategoryFilterStateCopyWith<$Res> {
  __$SubcategoryFilterStateCopyWithImpl(this._self, this._then);

  final _SubcategoryFilterState _self;
  final $Res Function(_SubcategoryFilterState) _then;

  /// Create a copy of SubcategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
    Object? categoryId = null,
  }) {
    return _then(_SubcategoryFilterState(
      search: null == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      archived: freezed == archived
          ? _self.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
