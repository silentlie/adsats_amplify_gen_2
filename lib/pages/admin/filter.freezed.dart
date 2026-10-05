// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminFilterState {
  String get search;
  bool? get archived;
  DateTimeRange<DateTime>? get createdAt;

  /// Create a copy of AdminFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminFilterStateCopyWith<AdminFilterState> get copyWith =>
      _$AdminFilterStateCopyWithImpl<AdminFilterState>(
          this as AdminFilterState, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as AdminFilterState;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminFilterState &&
            (identical(other.search, _this.search) ||
                other.search == _this.search) &&
            (identical(other.archived, _this.archived) ||
                other.archived == _this.archived) &&
            (identical(other.createdAt, _this.createdAt) ||
                other.createdAt == _this.createdAt));
  }

  @override
  int get hashCode {
    final _this = this as AdminFilterState;
    return Object.hash(
        runtimeType, _this.search, _this.archived, _this.createdAt);
  }

  @override
  String toString() {
    final _this = this as AdminFilterState;
    return 'AdminFilterState(search: ${_this.search}, archived: ${_this.archived}, createdAt: ${_this.createdAt})';
  }
}

/// @nodoc
abstract mixin class $AdminFilterStateCopyWith<$Res> {
  factory $AdminFilterStateCopyWith(
          AdminFilterState value, $Res Function(AdminFilterState) _then) =
      _$AdminFilterStateCopyWithImpl;
  @useResult
  $Res call(
      {String search, bool? archived, DateTimeRange<DateTime>? createdAt});
}

/// @nodoc
class _$AdminFilterStateCopyWithImpl<$Res>
    implements $AdminFilterStateCopyWith<$Res> {
  _$AdminFilterStateCopyWithImpl(this._self, this._then);

  final AdminFilterState _self;
  final $Res Function(AdminFilterState) _then;

  /// Create a copy of AdminFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(AdminFilterState(
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
              as DateTimeRange<DateTime>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AdminFilterState].
extension AdminFilterStatePatterns on AdminFilterState {
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
    TResult Function(_AdminFilterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminFilterState() when $default != null:
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
    TResult Function(_AdminFilterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminFilterState():
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
    TResult? Function(_AdminFilterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminFilterState() when $default != null:
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
            String search, bool? archived, DateTimeRange<DateTime>? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminFilterState() when $default != null:
        return $default(_that.search, _that.archived, _that.createdAt);
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
            String search, bool? archived, DateTimeRange<DateTime>? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminFilterState():
        return $default(_that.search, _that.archived, _that.createdAt);
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
            String search, bool? archived, DateTimeRange<DateTime>? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminFilterState() when $default != null:
        return $default(_that.search, _that.archived, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AdminFilterState extends AdminFilterState {
  _AdminFilterState({this.search = "", this.archived = false, this.createdAt})
      : super._();

  @override
  @JsonKey()
  final String search;
  @override
  @JsonKey()
  final bool? archived;
  @override
  final DateTimeRange<DateTime>? createdAt;

  /// Create a copy of AdminFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminFilterStateCopyWith<_AdminFilterState> get copyWith =>
      __$AdminFilterStateCopyWithImpl<_AdminFilterState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminFilterState &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, search, archived, createdAt);
  }

  @override
  String toString() {
    return 'AdminFilterState(search: $search, archived: $archived, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$AdminFilterStateCopyWith<$Res>
    implements $AdminFilterStateCopyWith<$Res> {
  factory _$AdminFilterStateCopyWith(
          _AdminFilterState value, $Res Function(_AdminFilterState) _then) =
      __$AdminFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String search, bool? archived, DateTimeRange<DateTime>? createdAt});
}

/// @nodoc
class __$AdminFilterStateCopyWithImpl<$Res>
    implements _$AdminFilterStateCopyWith<$Res> {
  __$AdminFilterStateCopyWithImpl(this._self, this._then);

  final _AdminFilterState _self;
  final $Res Function(_AdminFilterState) _then;

  /// Create a copy of AdminFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_AdminFilterState(
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
              as DateTimeRange<DateTime>?,
    ));
  }
}

// dart format on
