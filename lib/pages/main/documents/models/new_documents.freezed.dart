// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_documents.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewDocumentsState {
  Staff? get uploader;
  Subcategory? get subcategory;
  List<Aircraft> get aircraft;
  bool get archived;
  TemporalDateTime? get issuedAt;
  TemporalDateTime? get expiredAt;
  NewDocumentsStage get stage;
  ReminderFormState get reminderState;

  /// Create a copy of NewDocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewDocumentsStateCopyWith<NewDocumentsState> get copyWith =>
      _$NewDocumentsStateCopyWithImpl<NewDocumentsState>(
          this as NewDocumentsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewDocumentsState &&
            (identical(other.uploader, uploader) ||
                other.uploader == uploader) &&
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory) &&
            const DeepCollectionEquality().equals(other.aircraft, aircraft) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.issuedAt, issuedAt) ||
                other.issuedAt == issuedAt) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.reminderState, reminderState) ||
                other.reminderState == reminderState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      uploader,
      subcategory,
      const DeepCollectionEquality().hash(aircraft),
      archived,
      issuedAt,
      expiredAt,
      stage,
      reminderState);

  @override
  String toString() {
    return 'NewDocumentsState(uploader: $uploader, subcategory: $subcategory, aircraft: $aircraft, archived: $archived, issuedAt: $issuedAt, expiredAt: $expiredAt, stage: $stage, reminderState: $reminderState)';
  }
}

/// @nodoc
abstract mixin class $NewDocumentsStateCopyWith<$Res> {
  factory $NewDocumentsStateCopyWith(
          NewDocumentsState value, $Res Function(NewDocumentsState) _then) =
      _$NewDocumentsStateCopyWithImpl;
  @useResult
  $Res call(
      {Staff? uploader,
      Subcategory? subcategory,
      List<Aircraft> aircraft,
      bool archived,
      TemporalDateTime? issuedAt,
      TemporalDateTime? expiredAt,
      NewDocumentsStage stage,
      ReminderFormState reminderState});

  $ReminderFormStateCopyWith<$Res> get reminderState;
}

/// @nodoc
class _$NewDocumentsStateCopyWithImpl<$Res>
    implements $NewDocumentsStateCopyWith<$Res> {
  _$NewDocumentsStateCopyWithImpl(this._self, this._then);

  final NewDocumentsState _self;
  final $Res Function(NewDocumentsState) _then;

  /// Create a copy of NewDocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uploader = freezed,
    Object? subcategory = freezed,
    Object? aircraft = null,
    Object? archived = null,
    Object? issuedAt = freezed,
    Object? expiredAt = freezed,
    Object? stage = null,
    Object? reminderState = null,
  }) {
    return _then(_self.copyWith(
      uploader: freezed == uploader
          ? _self.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as Staff?,
      subcategory: freezed == subcategory
          ? _self.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory?,
      aircraft: null == aircraft
          ? _self.aircraft
          : aircraft // ignore: cast_nullable_to_non_nullable
              as List<Aircraft>,
      archived: null == archived
          ? _self.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
      issuedAt: freezed == issuedAt
          ? _self.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as TemporalDateTime?,
      expiredAt: freezed == expiredAt
          ? _self.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as TemporalDateTime?,
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as NewDocumentsStage,
      reminderState: null == reminderState
          ? _self.reminderState
          : reminderState // ignore: cast_nullable_to_non_nullable
              as ReminderFormState,
    ));
  }

  /// Create a copy of NewDocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReminderFormStateCopyWith<$Res> get reminderState {
    return $ReminderFormStateCopyWith<$Res>(_self.reminderState, (value) {
      return _then(_self.copyWith(reminderState: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NewDocumentsState].
extension NewDocumentsStatePatterns on NewDocumentsState {
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
    TResult Function(_NewDocumentsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewDocumentsState() when $default != null:
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
    TResult Function(_NewDocumentsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewDocumentsState():
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
    TResult? Function(_NewDocumentsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewDocumentsState() when $default != null:
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
    TResult Function(
            Staff? uploader,
            Subcategory? subcategory,
            List<Aircraft> aircraft,
            bool archived,
            TemporalDateTime? issuedAt,
            TemporalDateTime? expiredAt,
            NewDocumentsStage stage,
            ReminderFormState reminderState)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewDocumentsState() when $default != null:
        return $default(
            _that.uploader,
            _that.subcategory,
            _that.aircraft,
            _that.archived,
            _that.issuedAt,
            _that.expiredAt,
            _that.stage,
            _that.reminderState);
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
    TResult Function(
            Staff? uploader,
            Subcategory? subcategory,
            List<Aircraft> aircraft,
            bool archived,
            TemporalDateTime? issuedAt,
            TemporalDateTime? expiredAt,
            NewDocumentsStage stage,
            ReminderFormState reminderState)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewDocumentsState():
        return $default(
            _that.uploader,
            _that.subcategory,
            _that.aircraft,
            _that.archived,
            _that.issuedAt,
            _that.expiredAt,
            _that.stage,
            _that.reminderState);
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
    TResult? Function(
            Staff? uploader,
            Subcategory? subcategory,
            List<Aircraft> aircraft,
            bool archived,
            TemporalDateTime? issuedAt,
            TemporalDateTime? expiredAt,
            NewDocumentsStage stage,
            ReminderFormState reminderState)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewDocumentsState() when $default != null:
        return $default(
            _that.uploader,
            _that.subcategory,
            _that.aircraft,
            _that.archived,
            _that.issuedAt,
            _that.expiredAt,
            _that.stage,
            _that.reminderState);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NewDocumentsState extends NewDocumentsState {
  const _NewDocumentsState(
      {this.uploader,
      this.subcategory,
      final List<Aircraft> aircraft = const [],
      this.archived = false,
      this.issuedAt,
      this.expiredAt,
      this.stage = NewDocumentsStage.details,
      this.reminderState = const ReminderFormState()})
      : _aircraft = aircraft,
        super._();

  @override
  final Staff? uploader;
  @override
  final Subcategory? subcategory;
  final List<Aircraft> _aircraft;
  @override
  @JsonKey()
  List<Aircraft> get aircraft {
    if (_aircraft is EqualUnmodifiableListView) return _aircraft;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aircraft);
  }

  @override
  @JsonKey()
  final bool archived;
  @override
  final TemporalDateTime? issuedAt;
  @override
  final TemporalDateTime? expiredAt;
  @override
  @JsonKey()
  final NewDocumentsStage stage;
  @override
  @JsonKey()
  final ReminderFormState reminderState;

  /// Create a copy of NewDocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewDocumentsStateCopyWith<_NewDocumentsState> get copyWith =>
      __$NewDocumentsStateCopyWithImpl<_NewDocumentsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewDocumentsState &&
            (identical(other.uploader, uploader) ||
                other.uploader == uploader) &&
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory) &&
            const DeepCollectionEquality().equals(other._aircraft, _aircraft) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.issuedAt, issuedAt) ||
                other.issuedAt == issuedAt) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.reminderState, reminderState) ||
                other.reminderState == reminderState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      uploader,
      subcategory,
      const DeepCollectionEquality().hash(_aircraft),
      archived,
      issuedAt,
      expiredAt,
      stage,
      reminderState);

  @override
  String toString() {
    return 'NewDocumentsState(uploader: $uploader, subcategory: $subcategory, aircraft: $aircraft, archived: $archived, issuedAt: $issuedAt, expiredAt: $expiredAt, stage: $stage, reminderState: $reminderState)';
  }
}

/// @nodoc
abstract mixin class _$NewDocumentsStateCopyWith<$Res>
    implements $NewDocumentsStateCopyWith<$Res> {
  factory _$NewDocumentsStateCopyWith(
          _NewDocumentsState value, $Res Function(_NewDocumentsState) _then) =
      __$NewDocumentsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Staff? uploader,
      Subcategory? subcategory,
      List<Aircraft> aircraft,
      bool archived,
      TemporalDateTime? issuedAt,
      TemporalDateTime? expiredAt,
      NewDocumentsStage stage,
      ReminderFormState reminderState});

  @override
  $ReminderFormStateCopyWith<$Res> get reminderState;
}

/// @nodoc
class __$NewDocumentsStateCopyWithImpl<$Res>
    implements _$NewDocumentsStateCopyWith<$Res> {
  __$NewDocumentsStateCopyWithImpl(this._self, this._then);

  final _NewDocumentsState _self;
  final $Res Function(_NewDocumentsState) _then;

  /// Create a copy of NewDocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uploader = freezed,
    Object? subcategory = freezed,
    Object? aircraft = null,
    Object? archived = null,
    Object? issuedAt = freezed,
    Object? expiredAt = freezed,
    Object? stage = null,
    Object? reminderState = null,
  }) {
    return _then(_NewDocumentsState(
      uploader: freezed == uploader
          ? _self.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as Staff?,
      subcategory: freezed == subcategory
          ? _self.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory?,
      aircraft: null == aircraft
          ? _self._aircraft
          : aircraft // ignore: cast_nullable_to_non_nullable
              as List<Aircraft>,
      archived: null == archived
          ? _self.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
      issuedAt: freezed == issuedAt
          ? _self.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as TemporalDateTime?,
      expiredAt: freezed == expiredAt
          ? _self.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as TemporalDateTime?,
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as NewDocumentsStage,
      reminderState: null == reminderState
          ? _self.reminderState
          : reminderState // ignore: cast_nullable_to_non_nullable
              as ReminderFormState,
    ));
  }

  /// Create a copy of NewDocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReminderFormStateCopyWith<$Res> get reminderState {
    return $ReminderFormStateCopyWith<$Res>(_self.reminderState, (value) {
      return _then(_self.copyWith(reminderState: value));
    });
  }
}

// dart format on
