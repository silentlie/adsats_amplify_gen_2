// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NoticeFormState {
  Notice get notice;
  bool get editMode;

  /// Create a copy of NoticeFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NoticeFormStateCopyWith<NoticeFormState> get copyWith =>
      _$NoticeFormStateCopyWithImpl<NoticeFormState>(
          this as NoticeFormState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NoticeFormState &&
            (identical(other.notice, notice) || other.notice == notice) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notice, editMode);

  @override
  String toString() {
    return 'NoticeFormState(notice: $notice, editMode: $editMode)';
  }
}

/// @nodoc
abstract mixin class $NoticeFormStateCopyWith<$Res> {
  factory $NoticeFormStateCopyWith(
          NoticeFormState value, $Res Function(NoticeFormState) _then) =
      _$NoticeFormStateCopyWithImpl;
  @useResult
  $Res call({Notice notice, bool editMode});
}

/// @nodoc
class _$NoticeFormStateCopyWithImpl<$Res>
    implements $NoticeFormStateCopyWith<$Res> {
  _$NoticeFormStateCopyWithImpl(this._self, this._then);

  final NoticeFormState _self;
  final $Res Function(NoticeFormState) _then;

  /// Create a copy of NoticeFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notice = null,
    Object? editMode = null,
  }) {
    return _then(_self.copyWith(
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

/// Adds pattern-matching-related methods to [NoticeFormState].
extension NoticeFormStatePatterns on NoticeFormState {
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
    TResult Function(_NoticeState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NoticeState() when $default != null:
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
    TResult Function(_NoticeState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeState():
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
    TResult? Function(_NoticeState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeState() when $default != null:
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
    TResult Function(Notice notice, bool editMode)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NoticeState() when $default != null:
        return $default(_that.notice, _that.editMode);
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
    TResult Function(Notice notice, bool editMode) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeState():
        return $default(_that.notice, _that.editMode);
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
    TResult? Function(Notice notice, bool editMode)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeState() when $default != null:
        return $default(_that.notice, _that.editMode);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NoticeState extends NoticeFormState {
  const _NoticeState({required this.notice, required this.editMode})
      : super._();

  @override
  final Notice notice;
  @override
  final bool editMode;

  /// Create a copy of NoticeFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NoticeStateCopyWith<_NoticeState> get copyWith =>
      __$NoticeStateCopyWithImpl<_NoticeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoticeState &&
            (identical(other.notice, notice) || other.notice == notice) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notice, editMode);

  @override
  String toString() {
    return 'NoticeFormState(notice: $notice, editMode: $editMode)';
  }
}

/// @nodoc
abstract mixin class _$NoticeStateCopyWith<$Res>
    implements $NoticeFormStateCopyWith<$Res> {
  factory _$NoticeStateCopyWith(
          _NoticeState value, $Res Function(_NoticeState) _then) =
      __$NoticeStateCopyWithImpl;
  @override
  @useResult
  $Res call({Notice notice, bool editMode});
}

/// @nodoc
class __$NoticeStateCopyWithImpl<$Res> implements _$NoticeStateCopyWith<$Res> {
  __$NoticeStateCopyWithImpl(this._self, this._then);

  final _NoticeState _self;
  final $Res Function(_NoticeState) _then;

  /// Create a copy of NoticeFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? notice = null,
    Object? editMode = null,
  }) {
    return _then(_NoticeState(
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
