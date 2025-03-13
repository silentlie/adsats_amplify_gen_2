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
mixin _$AdminFilterState {
  String get search;
  bool? get archived;
  DateTimeRange? get createdAt;

  /// Create a copy of AdminFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminFilterStateCopyWith<AdminFilterState> get copyWith =>
      _$AdminFilterStateCopyWithImpl<AdminFilterState>(
          this as AdminFilterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminFilterState &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search, archived, createdAt);

  @override
  String toString() {
    return 'AdminFilterState(search: $search, archived: $archived, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $AdminFilterStateCopyWith<$Res> {
  factory $AdminFilterStateCopyWith(
          AdminFilterState value, $Res Function(AdminFilterState) _then) =
      _$AdminFilterStateCopyWithImpl;
  @useResult
  $Res call({String search, bool? archived, DateTimeRange? createdAt});
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
    ));
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
  final DateTimeRange? createdAt;

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
  int get hashCode => Object.hash(runtimeType, search, archived, createdAt);

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
  $Res call({String search, bool? archived, DateTimeRange? createdAt});
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
              as DateTimeRange?,
    ));
  }
}

// dart format on
