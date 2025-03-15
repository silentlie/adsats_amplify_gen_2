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
mixin _$ReportState {
  GlobalKey<FormState> get formKey;
  set formKey(GlobalKey<FormState> value);
  Report get report;
  set report(Report value);
  bool get editMode;
  set editMode(bool value);

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportStateCopyWith<ReportState> get copyWith =>
      _$ReportStateCopyWithImpl<ReportState>(this as ReportState, _$identity);

  @override
  String toString() {
    return 'ReportState(formKey: $formKey, report: $report, editMode: $editMode)';
  }
}

/// @nodoc
abstract mixin class $ReportStateCopyWith<$Res> {
  factory $ReportStateCopyWith(
          ReportState value, $Res Function(ReportState) _then) =
      _$ReportStateCopyWithImpl;
  @useResult
  $Res call({GlobalKey<FormState> formKey, Report report, bool editMode});
}

/// @nodoc
class _$ReportStateCopyWithImpl<$Res> implements $ReportStateCopyWith<$Res> {
  _$ReportStateCopyWithImpl(this._self, this._then);

  final ReportState _self;
  final $Res Function(ReportState) _then;

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formKey = null,
    Object? report = null,
    Object? editMode = null,
  }) {
    return _then(_self.copyWith(
      formKey: null == formKey
          ? _self.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>,
      report: null == report
          ? _self.report
          : report // ignore: cast_nullable_to_non_nullable
              as Report,
      editMode: null == editMode
          ? _self.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _ReportState extends ReportState {
  _ReportState(
      {required this.formKey, required this.report, this.editMode = true})
      : super._();

  @override
  GlobalKey<FormState> formKey;
  @override
  Report report;
  @override
  @JsonKey()
  bool editMode;

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportStateCopyWith<_ReportState> get copyWith =>
      __$ReportStateCopyWithImpl<_ReportState>(this, _$identity);

  @override
  String toString() {
    return 'ReportState(formKey: $formKey, report: $report, editMode: $editMode)';
  }
}

/// @nodoc
abstract mixin class _$ReportStateCopyWith<$Res>
    implements $ReportStateCopyWith<$Res> {
  factory _$ReportStateCopyWith(
          _ReportState value, $Res Function(_ReportState) _then) =
      __$ReportStateCopyWithImpl;
  @override
  @useResult
  $Res call({GlobalKey<FormState> formKey, Report report, bool editMode});
}

/// @nodoc
class __$ReportStateCopyWithImpl<$Res> implements _$ReportStateCopyWith<$Res> {
  __$ReportStateCopyWithImpl(this._self, this._then);

  final _ReportState _self;
  final $Res Function(_ReportState) _then;

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? formKey = null,
    Object? report = null,
    Object? editMode = null,
  }) {
    return _then(_ReportState(
      formKey: null == formKey
          ? _self.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>,
      report: null == report
          ? _self.report
          : report // ignore: cast_nullable_to_non_nullable
              as Report,
      editMode: null == editMode
          ? _self.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
