// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportFormState {
  Report get report;
  bool get editMode;

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportFormStateCopyWith<ReportFormState> get copyWith =>
      _$ReportFormStateCopyWithImpl<ReportFormState>(
          this as ReportFormState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportFormState &&
            (identical(other.report, report) || other.report == report) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, report, editMode);

  @override
  String toString() {
    return 'ReportFormState(report: $report, editMode: $editMode)';
  }
}

/// @nodoc
abstract mixin class $ReportFormStateCopyWith<$Res> {
  factory $ReportFormStateCopyWith(
          ReportFormState value, $Res Function(ReportFormState) _then) =
      _$ReportFormStateCopyWithImpl;
  @useResult
  $Res call({Report report, bool editMode});
}

/// @nodoc
class _$ReportFormStateCopyWithImpl<$Res>
    implements $ReportFormStateCopyWith<$Res> {
  _$ReportFormStateCopyWithImpl(this._self, this._then);

  final ReportFormState _self;
  final $Res Function(ReportFormState) _then;

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? report = null,
    Object? editMode = null,
  }) {
    return _then(_self.copyWith(
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

/// Adds pattern-matching-related methods to [ReportFormState].
extension ReportFormStatePatterns on ReportFormState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ReportFormState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportFormState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ReportFormState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFormState():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ReportFormState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFormState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Report report, bool editMode)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportFormState() when $default != null:
        return $default(_that.report, _that.editMode);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Report report, bool editMode) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFormState():
        return $default(_that.report, _that.editMode);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Report report, bool editMode)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFormState() when $default != null:
        return $default(_that.report, _that.editMode);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReportFormState extends ReportFormState {
  const _ReportFormState({required this.report, required this.editMode})
      : super._();

  @override
  final Report report;
  @override
  final bool editMode;

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportFormStateCopyWith<_ReportFormState> get copyWith =>
      __$ReportFormStateCopyWithImpl<_ReportFormState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportFormState &&
            (identical(other.report, report) || other.report == report) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, report, editMode);

  @override
  String toString() {
    return 'ReportFormState(report: $report, editMode: $editMode)';
  }
}

/// @nodoc
abstract mixin class _$ReportFormStateCopyWith<$Res>
    implements $ReportFormStateCopyWith<$Res> {
  factory _$ReportFormStateCopyWith(
          _ReportFormState value, $Res Function(_ReportFormState) _then) =
      __$ReportFormStateCopyWithImpl;
  @override
  @useResult
  $Res call({Report report, bool editMode});
}

/// @nodoc
class __$ReportFormStateCopyWithImpl<$Res>
    implements _$ReportFormStateCopyWith<$Res> {
  __$ReportFormStateCopyWithImpl(this._self, this._then);

  final _ReportFormState _self;
  final $Res Function(_ReportFormState) _then;

  /// Create a copy of ReportFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? report = null,
    Object? editMode = null,
  }) {
    return _then(_ReportFormState(
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
