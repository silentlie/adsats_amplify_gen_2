// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NoticeState {
  GlobalKey<FormState> get formKey;
  set formKey(GlobalKey<FormState> value);
  Notice get notice;
  set notice(Notice value);
  bool get editMode;
  set editMode(bool value);

  /// Create a copy of NoticeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NoticeStateCopyWith<NoticeState> get copyWith =>
      _$NoticeStateCopyWithImpl<NoticeState>(this as NoticeState, _$identity);

  @override
  String toString() {
    return 'NoticeState(formKey: $formKey, notice: $notice, editMode: $editMode)';
  }
}

/// @nodoc
abstract mixin class $NoticeStateCopyWith<$Res> {
  factory $NoticeStateCopyWith(
          NoticeState value, $Res Function(NoticeState) _then) =
      _$NoticeStateCopyWithImpl;
  @useResult
  $Res call({GlobalKey<FormState> formKey, Notice notice, bool editMode});
}

/// @nodoc
class _$NoticeStateCopyWithImpl<$Res> implements $NoticeStateCopyWith<$Res> {
  _$NoticeStateCopyWithImpl(this._self, this._then);

  final NoticeState _self;
  final $Res Function(NoticeState) _then;

  /// Create a copy of NoticeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formKey = null,
    Object? notice = null,
    Object? editMode = null,
  }) {
    return _then(_self.copyWith(
      formKey: null == formKey
          ? _self.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>,
      notice: null == notice
          ? _self.notice
          : notice // ignore: cast_nullable_to_non_nullable
              as Notice,
      editMode: null == editMode
          ? _self.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _NoticeState extends NoticeState {
  _NoticeState(
      {required this.formKey, required this.notice, this.editMode = true})
      : super._();

  @override
  GlobalKey<FormState> formKey;
  @override
  Notice notice;
  @override
  @JsonKey()
  bool editMode;

  /// Create a copy of NoticeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NoticeStateCopyWith<_NoticeState> get copyWith =>
      __$NoticeStateCopyWithImpl<_NoticeState>(this, _$identity);

  @override
  String toString() {
    return 'NoticeState(formKey: $formKey, notice: $notice, editMode: $editMode)';
  }
}

/// @nodoc
abstract mixin class _$NoticeStateCopyWith<$Res>
    implements $NoticeStateCopyWith<$Res> {
  factory _$NoticeStateCopyWith(
          _NoticeState value, $Res Function(_NoticeState) _then) =
      __$NoticeStateCopyWithImpl;
  @override
  @useResult
  $Res call({GlobalKey<FormState> formKey, Notice notice, bool editMode});
}

/// @nodoc
class __$NoticeStateCopyWithImpl<$Res> implements _$NoticeStateCopyWith<$Res> {
  __$NoticeStateCopyWithImpl(this._self, this._then);

  final _NoticeState _self;
  final $Res Function(_NoticeState) _then;

  /// Create a copy of NoticeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? formKey = null,
    Object? notice = null,
    Object? editMode = null,
  }) {
    return _then(_NoticeState(
      formKey: null == formKey
          ? _self.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>,
      notice: null == notice
          ? _self.notice
          : notice // ignore: cast_nullable_to_non_nullable
              as Notice,
      editMode: null == editMode
          ? _self.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
