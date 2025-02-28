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
mixin _$SubcategoryFilterState {
  String get search => throw _privateConstructorUsedError;
  bool? get archived => throw _privateConstructorUsedError;
  DateTimeRange? get createdAt => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;

  /// Create a copy of SubcategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubcategoryFilterStateCopyWith<SubcategoryFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubcategoryFilterStateCopyWith<$Res> {
  factory $SubcategoryFilterStateCopyWith(SubcategoryFilterState value,
          $Res Function(SubcategoryFilterState) then) =
      _$SubcategoryFilterStateCopyWithImpl<$Res, SubcategoryFilterState>;
  @useResult
  $Res call(
      {String search,
      bool? archived,
      DateTimeRange? createdAt,
      String categoryId});
}

/// @nodoc
class _$SubcategoryFilterStateCopyWithImpl<$Res,
        $Val extends SubcategoryFilterState>
    implements $SubcategoryFilterStateCopyWith<$Res> {
  _$SubcategoryFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubcategoryFilterStateImplCopyWith<$Res>
    implements $SubcategoryFilterStateCopyWith<$Res> {
  factory _$$SubcategoryFilterStateImplCopyWith(
          _$SubcategoryFilterStateImpl value,
          $Res Function(_$SubcategoryFilterStateImpl) then) =
      __$$SubcategoryFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String search,
      bool? archived,
      DateTimeRange? createdAt,
      String categoryId});
}

/// @nodoc
class __$$SubcategoryFilterStateImplCopyWithImpl<$Res>
    extends _$SubcategoryFilterStateCopyWithImpl<$Res,
        _$SubcategoryFilterStateImpl>
    implements _$$SubcategoryFilterStateImplCopyWith<$Res> {
  __$$SubcategoryFilterStateImplCopyWithImpl(
      _$SubcategoryFilterStateImpl _value,
      $Res Function(_$SubcategoryFilterStateImpl) _then)
      : super(_value, _then);

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
    return _then(_$SubcategoryFilterStateImpl(
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
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SubcategoryFilterStateImpl extends _SubcategoryFilterState {
  _$SubcategoryFilterStateImpl(
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

  @override
  String toString() {
    return 'SubcategoryFilterState(search: $search, archived: $archived, createdAt: $createdAt, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubcategoryFilterStateImpl &&
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

  /// Create a copy of SubcategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubcategoryFilterStateImplCopyWith<_$SubcategoryFilterStateImpl>
      get copyWith => __$$SubcategoryFilterStateImplCopyWithImpl<
          _$SubcategoryFilterStateImpl>(this, _$identity);
}

abstract class _SubcategoryFilterState extends SubcategoryFilterState {
  factory _SubcategoryFilterState(
      {final String search,
      final bool? archived,
      final DateTimeRange? createdAt,
      required final String categoryId}) = _$SubcategoryFilterStateImpl;
  _SubcategoryFilterState._() : super._();

  @override
  String get search;
  @override
  bool? get archived;
  @override
  DateTimeRange? get createdAt;
  @override
  String get categoryId;

  /// Create a copy of SubcategoryFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubcategoryFilterStateImplCopyWith<_$SubcategoryFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
