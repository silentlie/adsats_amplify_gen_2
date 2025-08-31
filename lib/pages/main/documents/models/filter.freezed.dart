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
mixin _$DocumentFilterState {
  Subcategory get subcategory;
  String get search;
  bool? get archived;
  DateTimeRange? get createdAt;
  DateTimeRange? get issuedAt;
  DateTimeRange? get expiredAt;

  /// Create a copy of DocumentFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DocumentFilterStateCopyWith<DocumentFilterState> get copyWith =>
      _$DocumentFilterStateCopyWithImpl<DocumentFilterState>(
          this as DocumentFilterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DocumentFilterState &&
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.issuedAt, issuedAt) ||
                other.issuedAt == issuedAt) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subcategory, search, archived,
      createdAt, issuedAt, expiredAt);

  @override
  String toString() {
    return 'DocumentFilterState(subcategory: $subcategory, search: $search, archived: $archived, createdAt: $createdAt, issuedAt: $issuedAt, expiredAt: $expiredAt)';
  }
}

/// @nodoc
abstract mixin class $DocumentFilterStateCopyWith<$Res> {
  factory $DocumentFilterStateCopyWith(
          DocumentFilterState value, $Res Function(DocumentFilterState) _then) =
      _$DocumentFilterStateCopyWithImpl;
  @useResult
  $Res call(
      {Subcategory subcategory,
      String search,
      bool? archived,
      DateTimeRange? createdAt,
      DateTimeRange? issuedAt,
      DateTimeRange? expiredAt});
}

/// @nodoc
class _$DocumentFilterStateCopyWithImpl<$Res>
    implements $DocumentFilterStateCopyWith<$Res> {
  _$DocumentFilterStateCopyWithImpl(this._self, this._then);

  final DocumentFilterState _self;
  final $Res Function(DocumentFilterState) _then;

  /// Create a copy of DocumentFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subcategory = null,
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
    Object? issuedAt = freezed,
    Object? expiredAt = freezed,
  }) {
    return _then(_self.copyWith(
      subcategory: null == subcategory
          ? _self.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory,
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
      issuedAt: freezed == issuedAt
          ? _self.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      expiredAt: freezed == expiredAt
          ? _self.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DocumentFilterState].
extension DocumentFilterStatePatterns on DocumentFilterState {
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
    TResult Function(_DocumentFilterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentFilterState() when $default != null:
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
    TResult Function(_DocumentFilterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentFilterState():
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
    TResult? Function(_DocumentFilterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentFilterState() when $default != null:
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
            Subcategory subcategory,
            String search,
            bool? archived,
            DateTimeRange? createdAt,
            DateTimeRange? issuedAt,
            DateTimeRange? expiredAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentFilterState() when $default != null:
        return $default(_that.subcategory, _that.search, _that.archived,
            _that.createdAt, _that.issuedAt, _that.expiredAt);
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
            Subcategory subcategory,
            String search,
            bool? archived,
            DateTimeRange? createdAt,
            DateTimeRange? issuedAt,
            DateTimeRange? expiredAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentFilterState():
        return $default(_that.subcategory, _that.search, _that.archived,
            _that.createdAt, _that.issuedAt, _that.expiredAt);
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
            Subcategory subcategory,
            String search,
            bool? archived,
            DateTimeRange? createdAt,
            DateTimeRange? issuedAt,
            DateTimeRange? expiredAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentFilterState() when $default != null:
        return $default(_that.subcategory, _that.search, _that.archived,
            _that.createdAt, _that.issuedAt, _that.expiredAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DocumentFilterState extends DocumentFilterState {
  _DocumentFilterState(
      {required this.subcategory,
      this.search = "",
      this.archived = false,
      this.createdAt,
      this.issuedAt,
      this.expiredAt})
      : super._();

  @override
  final Subcategory subcategory;
  @override
  @JsonKey()
  final String search;
  @override
  @JsonKey()
  final bool? archived;
  @override
  final DateTimeRange? createdAt;
  @override
  final DateTimeRange? issuedAt;
  @override
  final DateTimeRange? expiredAt;

  /// Create a copy of DocumentFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DocumentFilterStateCopyWith<_DocumentFilterState> get copyWith =>
      __$DocumentFilterStateCopyWithImpl<_DocumentFilterState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DocumentFilterState &&
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.issuedAt, issuedAt) ||
                other.issuedAt == issuedAt) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subcategory, search, archived,
      createdAt, issuedAt, expiredAt);

  @override
  String toString() {
    return 'DocumentFilterState(subcategory: $subcategory, search: $search, archived: $archived, createdAt: $createdAt, issuedAt: $issuedAt, expiredAt: $expiredAt)';
  }
}

/// @nodoc
abstract mixin class _$DocumentFilterStateCopyWith<$Res>
    implements $DocumentFilterStateCopyWith<$Res> {
  factory _$DocumentFilterStateCopyWith(_DocumentFilterState value,
          $Res Function(_DocumentFilterState) _then) =
      __$DocumentFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Subcategory subcategory,
      String search,
      bool? archived,
      DateTimeRange? createdAt,
      DateTimeRange? issuedAt,
      DateTimeRange? expiredAt});
}

/// @nodoc
class __$DocumentFilterStateCopyWithImpl<$Res>
    implements _$DocumentFilterStateCopyWith<$Res> {
  __$DocumentFilterStateCopyWithImpl(this._self, this._then);

  final _DocumentFilterState _self;
  final $Res Function(_DocumentFilterState) _then;

  /// Create a copy of DocumentFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subcategory = null,
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
    Object? issuedAt = freezed,
    Object? expiredAt = freezed,
  }) {
    return _then(_DocumentFilterState(
      subcategory: null == subcategory
          ? _self.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory,
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
      issuedAt: freezed == issuedAt
          ? _self.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      expiredAt: freezed == expiredAt
          ? _self.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ));
  }
}

// dart format on
