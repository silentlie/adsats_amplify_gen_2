// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NoticeState {
  GlobalKey<FormState> get formKey => throw _privateConstructorUsedError;
  set formKey(GlobalKey<FormState> value) => throw _privateConstructorUsedError;
  Notice get notice => throw _privateConstructorUsedError;
  set notice(Notice value) => throw _privateConstructorUsedError;
  bool get editMode => throw _privateConstructorUsedError;
  set editMode(bool value) => throw _privateConstructorUsedError;

  /// Create a copy of NoticeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoticeStateCopyWith<NoticeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeStateCopyWith<$Res> {
  factory $NoticeStateCopyWith(
          NoticeState value, $Res Function(NoticeState) then) =
      _$NoticeStateCopyWithImpl<$Res, NoticeState>;
  @useResult
  $Res call({GlobalKey<FormState> formKey, Notice notice, bool editMode});
}

/// @nodoc
class _$NoticeStateCopyWithImpl<$Res, $Val extends NoticeState>
    implements $NoticeStateCopyWith<$Res> {
  _$NoticeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoticeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formKey = null,
    Object? notice = null,
    Object? editMode = null,
  }) {
    return _then(_value.copyWith(
      formKey: null == formKey
          ? _value.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>,
      notice: null == notice
          ? _value.notice
          : notice // ignore: cast_nullable_to_non_nullable
              as Notice,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeStateImplCopyWith<$Res>
    implements $NoticeStateCopyWith<$Res> {
  factory _$$NoticeStateImplCopyWith(
          _$NoticeStateImpl value, $Res Function(_$NoticeStateImpl) then) =
      __$$NoticeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GlobalKey<FormState> formKey, Notice notice, bool editMode});
}

/// @nodoc
class __$$NoticeStateImplCopyWithImpl<$Res>
    extends _$NoticeStateCopyWithImpl<$Res, _$NoticeStateImpl>
    implements _$$NoticeStateImplCopyWith<$Res> {
  __$$NoticeStateImplCopyWithImpl(
      _$NoticeStateImpl _value, $Res Function(_$NoticeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NoticeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formKey = null,
    Object? notice = null,
    Object? editMode = null,
  }) {
    return _then(_$NoticeStateImpl(
      formKey: null == formKey
          ? _value.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>,
      notice: null == notice
          ? _value.notice
          : notice // ignore: cast_nullable_to_non_nullable
              as Notice,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NoticeStateImpl extends _NoticeState {
  _$NoticeStateImpl(
      {required this.formKey, required this.notice, this.editMode = true})
      : super._();

  @override
  GlobalKey<FormState> formKey;
  @override
  Notice notice;
  @override
  @JsonKey()
  bool editMode;

  @override
  String toString() {
    return 'NoticeState(formKey: $formKey, notice: $notice, editMode: $editMode)';
  }

  /// Create a copy of NoticeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeStateImplCopyWith<_$NoticeStateImpl> get copyWith =>
      __$$NoticeStateImplCopyWithImpl<_$NoticeStateImpl>(this, _$identity);
}

abstract class _NoticeState extends NoticeState {
  factory _NoticeState(
      {required GlobalKey<FormState> formKey,
      required Notice notice,
      bool editMode}) = _$NoticeStateImpl;
  _NoticeState._() : super._();

  @override
  GlobalKey<FormState> get formKey;
  set formKey(GlobalKey<FormState> value);
  @override
  Notice get notice;
  set notice(Notice value);
  @override
  bool get editMode;
  set editMode(bool value);

  /// Create a copy of NoticeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoticeStateImplCopyWith<_$NoticeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
