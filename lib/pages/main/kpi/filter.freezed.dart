// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StaffKPIFilterState {
  String get search;
  bool? get archived;
  DateTimeRange? get timeRange;

  /// Create a copy of StaffKPIFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StaffKPIFilterStateCopyWith<StaffKPIFilterState> get copyWith =>
      _$StaffKPIFilterStateCopyWithImpl<StaffKPIFilterState>(
          this as StaffKPIFilterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StaffKPIFilterState &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.timeRange, timeRange) ||
                other.timeRange == timeRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search, archived, timeRange);

  @override
  String toString() {
    return 'StaffKPIFilterState(search: $search, archived: $archived, timeRange: $timeRange)';
  }
}

/// @nodoc
abstract mixin class $StaffKPIFilterStateCopyWith<$Res> {
  factory $StaffKPIFilterStateCopyWith(
          StaffKPIFilterState value, $Res Function(StaffKPIFilterState) _then) =
      _$StaffKPIFilterStateCopyWithImpl;
  @useResult
  $Res call({String search, bool? archived, DateTimeRange? timeRange});
}

/// @nodoc
class _$StaffKPIFilterStateCopyWithImpl<$Res>
    implements $StaffKPIFilterStateCopyWith<$Res> {
  _$StaffKPIFilterStateCopyWithImpl(this._self, this._then);

  final StaffKPIFilterState _self;
  final $Res Function(StaffKPIFilterState) _then;

  /// Create a copy of StaffKPIFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
    Object? archived = freezed,
    Object? timeRange = freezed,
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
      timeRange: freezed == timeRange
          ? _self.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ));
  }
}

/// @nodoc

class _StaffKPIFilterState extends StaffKPIFilterState {
  _StaffKPIFilterState({this.search = "", this.archived, this.timeRange})
      : super._();

  @override
  @JsonKey()
  final String search;
  @override
  final bool? archived;
  @override
  final DateTimeRange? timeRange;

  /// Create a copy of StaffKPIFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StaffKPIFilterStateCopyWith<_StaffKPIFilterState> get copyWith =>
      __$StaffKPIFilterStateCopyWithImpl<_StaffKPIFilterState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StaffKPIFilterState &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.timeRange, timeRange) ||
                other.timeRange == timeRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search, archived, timeRange);

  @override
  String toString() {
    return 'StaffKPIFilterState(search: $search, archived: $archived, timeRange: $timeRange)';
  }
}

/// @nodoc
abstract mixin class _$StaffKPIFilterStateCopyWith<$Res>
    implements $StaffKPIFilterStateCopyWith<$Res> {
  factory _$StaffKPIFilterStateCopyWith(_StaffKPIFilterState value,
          $Res Function(_StaffKPIFilterState) _then) =
      __$StaffKPIFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call({String search, bool? archived, DateTimeRange? timeRange});
}

/// @nodoc
class __$StaffKPIFilterStateCopyWithImpl<$Res>
    implements _$StaffKPIFilterStateCopyWith<$Res> {
  __$StaffKPIFilterStateCopyWithImpl(this._self, this._then);

  final _StaffKPIFilterState _self;
  final $Res Function(_StaffKPIFilterState) _then;

  /// Create a copy of StaffKPIFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? search = null,
    Object? archived = freezed,
    Object? timeRange = freezed,
  }) {
    return _then(_StaffKPIFilterState(
      search: null == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      archived: freezed == archived
          ? _self.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeRange: freezed == timeRange
          ? _self.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ));
  }
}

// dart format on
