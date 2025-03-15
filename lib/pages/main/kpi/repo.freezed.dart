// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
