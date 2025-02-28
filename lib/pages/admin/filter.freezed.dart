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
mixin _$AdminFilterState {
  String get search => throw _privateConstructorUsedError;
  bool? get archived => throw _privateConstructorUsedError;
  DateTimeRange? get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of AdminFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminFilterStateCopyWith<AdminFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminFilterStateCopyWith<$Res> {
  factory $AdminFilterStateCopyWith(
          AdminFilterState value, $Res Function(AdminFilterState) then) =
      _$AdminFilterStateCopyWithImpl<$Res, AdminFilterState>;
  @useResult
  $Res call({String search, bool? archived, DateTimeRange? createdAt});
}

/// @nodoc
class _$AdminFilterStateCopyWithImpl<$Res, $Val extends AdminFilterState>
    implements $AdminFilterStateCopyWith<$Res> {
  _$AdminFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminFilterState
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
abstract class _$$AdminFilterStateImplCopyWith<$Res>
    implements $AdminFilterStateCopyWith<$Res> {
  factory _$$AdminFilterStateImplCopyWith(_$AdminFilterStateImpl value,
          $Res Function(_$AdminFilterStateImpl) then) =
      __$$AdminFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String search, bool? archived, DateTimeRange? createdAt});
}

/// @nodoc
class __$$AdminFilterStateImplCopyWithImpl<$Res>
    extends _$AdminFilterStateCopyWithImpl<$Res, _$AdminFilterStateImpl>
    implements _$$AdminFilterStateImplCopyWith<$Res> {
  __$$AdminFilterStateImplCopyWithImpl(_$AdminFilterStateImpl _value,
      $Res Function(_$AdminFilterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$AdminFilterStateImpl(
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

class _$AdminFilterStateImpl extends _AdminFilterState {
  _$AdminFilterStateImpl(
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
    return 'AdminFilterState(search: $search, archived: $archived, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminFilterStateImpl &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search, archived, createdAt);

  /// Create a copy of AdminFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminFilterStateImplCopyWith<_$AdminFilterStateImpl> get copyWith =>
      __$$AdminFilterStateImplCopyWithImpl<_$AdminFilterStateImpl>(
          this, _$identity);
}

abstract class _AdminFilterState extends AdminFilterState {
  factory _AdminFilterState(
      {final String search,
      final bool? archived,
      final DateTimeRange? createdAt}) = _$AdminFilterStateImpl;
  _AdminFilterState._() : super._();

  @override
  String get search;
  @override
  bool? get archived;
  @override
  DateTimeRange? get createdAt;

  /// Create a copy of AdminFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminFilterStateImplCopyWith<_$AdminFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
