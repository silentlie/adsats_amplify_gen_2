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
mixin _$DocumentFilterState {
  Subcategory get subcategory => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;
  bool? get archived => throw _privateConstructorUsedError;
  DateTimeRange? get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of DocumentFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentFilterStateCopyWith<DocumentFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentFilterStateCopyWith<$Res> {
  factory $DocumentFilterStateCopyWith(
          DocumentFilterState value, $Res Function(DocumentFilterState) then) =
      _$DocumentFilterStateCopyWithImpl<$Res, DocumentFilterState>;
  @useResult
  $Res call(
      {Subcategory subcategory,
      String search,
      bool? archived,
      DateTimeRange? createdAt});
}

/// @nodoc
class _$DocumentFilterStateCopyWithImpl<$Res, $Val extends DocumentFilterState>
    implements $DocumentFilterStateCopyWith<$Res> {
  _$DocumentFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subcategory = null,
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      subcategory: null == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory,
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
abstract class _$$DocumentFilterStateImplCopyWith<$Res>
    implements $DocumentFilterStateCopyWith<$Res> {
  factory _$$DocumentFilterStateImplCopyWith(_$DocumentFilterStateImpl value,
          $Res Function(_$DocumentFilterStateImpl) then) =
      __$$DocumentFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Subcategory subcategory,
      String search,
      bool? archived,
      DateTimeRange? createdAt});
}

/// @nodoc
class __$$DocumentFilterStateImplCopyWithImpl<$Res>
    extends _$DocumentFilterStateCopyWithImpl<$Res, _$DocumentFilterStateImpl>
    implements _$$DocumentFilterStateImplCopyWith<$Res> {
  __$$DocumentFilterStateImplCopyWithImpl(_$DocumentFilterStateImpl _value,
      $Res Function(_$DocumentFilterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subcategory = null,
    Object? search = null,
    Object? archived = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$DocumentFilterStateImpl(
      subcategory: null == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory,
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

class _$DocumentFilterStateImpl extends _DocumentFilterState {
  _$DocumentFilterStateImpl(
      {required this.subcategory,
      this.search = "",
      this.archived,
      this.createdAt})
      : super._();

  @override
  final Subcategory subcategory;
  @override
  @JsonKey()
  final String search;
  @override
  final bool? archived;
  @override
  final DateTimeRange? createdAt;

  @override
  String toString() {
    return 'DocumentFilterState(subcategory: $subcategory, search: $search, archived: $archived, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentFilterStateImpl &&
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, subcategory, search, archived, createdAt);

  /// Create a copy of DocumentFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentFilterStateImplCopyWith<_$DocumentFilterStateImpl> get copyWith =>
      __$$DocumentFilterStateImplCopyWithImpl<_$DocumentFilterStateImpl>(
          this, _$identity);
}

abstract class _DocumentFilterState extends DocumentFilterState {
  factory _DocumentFilterState(
      {required final Subcategory subcategory,
      final String search,
      final bool? archived,
      final DateTimeRange? createdAt}) = _$DocumentFilterStateImpl;
  _DocumentFilterState._() : super._();

  @override
  Subcategory get subcategory;
  @override
  String get search;
  @override
  bool? get archived;
  @override
  DateTimeRange? get createdAt;

  /// Create a copy of DocumentFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentFilterStateImplCopyWith<_$DocumentFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
