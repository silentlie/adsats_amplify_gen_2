// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AircraftFilterState {
  String get search => throw _privateConstructorUsedError;
  bool? get archived => throw _privateConstructorUsedError;
  DateTimeRange? get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of AircraftFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AircraftFilterStateCopyWith<AircraftFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AircraftFilterStateCopyWith<$Res> {
  factory $AircraftFilterStateCopyWith(
          AircraftFilterState value, $Res Function(AircraftFilterState) then) =
      _$AircraftFilterStateCopyWithImpl<$Res, AircraftFilterState>;
  @useResult
  $Res call({String search, bool? archived, DateTimeRange? createdAt});
}

/// @nodoc
class _$AircraftFilterStateCopyWithImpl<$Res, $Val extends AircraftFilterState>
    implements $AircraftFilterStateCopyWith<$Res> {
  _$AircraftFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AircraftFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      archived: freezed == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AircraftFilterStateImplCopyWith<$Res>
    implements $AircraftFilterStateCopyWith<$Res> {
  factory _$$AircraftFilterStateImplCopyWith(_$AircraftFilterStateImpl value,
          $Res Function(_$AircraftFilterStateImpl) then) =
      __$$AircraftFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String search, bool? archived, DateTimeRange? createdAt});
}

/// @nodoc
class __$$AircraftFilterStateImplCopyWithImpl<$Res>
    extends _$AircraftFilterStateCopyWithImpl<$Res, _$AircraftFilterStateImpl>
    implements _$$AircraftFilterStateImplCopyWith<$Res> {
  __$$AircraftFilterStateImplCopyWithImpl(_$AircraftFilterStateImpl _value,
      $Res Function(_$AircraftFilterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AircraftFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$AircraftFilterStateImpl(
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      archived: freezed == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ));
  }
}

/// @nodoc

class _$AircraftFilterStateImpl extends _AircraftFilterState {
  _$AircraftFilterStateImpl(
      {this.search = "", this.archived = false, this.createdAt})
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
  String toString() {
    return 'AircraftFilterState(search: $search, archived: $archived, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AircraftFilterStateImpl &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search, archived, createdAt);

  /// Create a copy of AircraftFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AircraftFilterStateImplCopyWith<_$AircraftFilterStateImpl> get copyWith =>
      __$$AircraftFilterStateImplCopyWithImpl<_$AircraftFilterStateImpl>(
          this, _$identity);
}

abstract class _AircraftFilterState extends AircraftFilterState {
  factory _AircraftFilterState(
      {final String search,
      final bool? archived,
      final DateTimeRange? createdAt}) = _$AircraftFilterStateImpl;
  _AircraftFilterState._() : super._();

  @override
  String get search;
  @override
  bool? get archived;
  @override
  DateTimeRange? get createdAt;

  /// Create a copy of AircraftFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AircraftFilterStateImplCopyWith<_$AircraftFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
