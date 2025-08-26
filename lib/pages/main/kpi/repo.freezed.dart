// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StaffKPI {
  Staff get staff;

  /// Create a copy of StaffKPI
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StaffKPICopyWith<StaffKPI> get copyWith =>
      _$StaffKPICopyWithImpl<StaffKPI>(this as StaffKPI, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StaffKPI &&
            (identical(other.staff, staff) || other.staff == staff));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staff);

  @override
  String toString() {
    return 'StaffKPI(staff: $staff)';
  }
}

/// @nodoc
abstract mixin class $StaffKPICopyWith<$Res> {
  factory $StaffKPICopyWith(StaffKPI value, $Res Function(StaffKPI) _then) =
      _$StaffKPICopyWithImpl;
  @useResult
  $Res call({Staff staff});
}

/// @nodoc
class _$StaffKPICopyWithImpl<$Res> implements $StaffKPICopyWith<$Res> {
  _$StaffKPICopyWithImpl(this._self, this._then);

  final StaffKPI _self;
  final $Res Function(StaffKPI) _then;

  /// Create a copy of StaffKPI
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staff = null,
  }) {
    return _then(_self.copyWith(
      staff: null == staff
          ? _self.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as Staff,
    ));
  }
}

/// Adds pattern-matching-related methods to [StaffKPI].
extension StaffKPIPatterns on StaffKPI {
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
    TResult Function(_StaffKPI value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StaffKPI() when $default != null:
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
    TResult Function(_StaffKPI value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StaffKPI():
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
    TResult? Function(_StaffKPI value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StaffKPI() when $default != null:
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
    TResult Function(Staff staff)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StaffKPI() when $default != null:
        return $default(_that.staff);
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
    TResult Function(Staff staff) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StaffKPI():
        return $default(_that.staff);
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
    TResult? Function(Staff staff)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StaffKPI() when $default != null:
        return $default(_that.staff);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StaffKPI extends StaffKPI {
  _StaffKPI({required this.staff}) : super._();

  @override
  final Staff staff;

  /// Create a copy of StaffKPI
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StaffKPICopyWith<_StaffKPI> get copyWith =>
      __$StaffKPICopyWithImpl<_StaffKPI>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StaffKPI &&
            (identical(other.staff, staff) || other.staff == staff));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staff);

  @override
  String toString() {
    return 'StaffKPI(staff: $staff)';
  }
}

/// @nodoc
abstract mixin class _$StaffKPICopyWith<$Res>
    implements $StaffKPICopyWith<$Res> {
  factory _$StaffKPICopyWith(_StaffKPI value, $Res Function(_StaffKPI) _then) =
      __$StaffKPICopyWithImpl;
  @override
  @useResult
  $Res call({Staff staff});
}

/// @nodoc
class __$StaffKPICopyWithImpl<$Res> implements _$StaffKPICopyWith<$Res> {
  __$StaffKPICopyWithImpl(this._self, this._then);

  final _StaffKPI _self;
  final $Res Function(_StaffKPI) _then;

  /// Create a copy of StaffKPI
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? staff = null,
  }) {
    return _then(_StaffKPI(
      staff: null == staff
          ? _self.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as Staff,
    ));
  }
}

// dart format on
