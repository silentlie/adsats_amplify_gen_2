// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReminderFormState {
  TemporalDateTime? get expiredAt;
  bool get ninetyDaysBefore;
  bool get sixtyDaysBefore;
  bool get thirtyDaysBefore;
  TemporalDateTime? get reminderDate;
  List<Staff> get selectedStaff;
  bool get isSubmitting;
  String? get dateValidationError;

  /// Create a copy of ReminderFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReminderFormStateCopyWith<ReminderFormState> get copyWith =>
      _$ReminderFormStateCopyWithImpl<ReminderFormState>(
          this as ReminderFormState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReminderFormState &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt) &&
            (identical(other.ninetyDaysBefore, ninetyDaysBefore) ||
                other.ninetyDaysBefore == ninetyDaysBefore) &&
            (identical(other.sixtyDaysBefore, sixtyDaysBefore) ||
                other.sixtyDaysBefore == sixtyDaysBefore) &&
            (identical(other.thirtyDaysBefore, thirtyDaysBefore) ||
                other.thirtyDaysBefore == thirtyDaysBefore) &&
            (identical(other.reminderDate, reminderDate) ||
                other.reminderDate == reminderDate) &&
            const DeepCollectionEquality()
                .equals(other.selectedStaff, selectedStaff) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.dateValidationError, dateValidationError) ||
                other.dateValidationError == dateValidationError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      expiredAt,
      ninetyDaysBefore,
      sixtyDaysBefore,
      thirtyDaysBefore,
      reminderDate,
      const DeepCollectionEquality().hash(selectedStaff),
      isSubmitting,
      dateValidationError);

  @override
  String toString() {
    return 'ReminderFormState(expiredAt: $expiredAt, ninetyDaysBefore: $ninetyDaysBefore, sixtyDaysBefore: $sixtyDaysBefore, thirtyDaysBefore: $thirtyDaysBefore, reminderDate: $reminderDate, selectedStaff: $selectedStaff, isSubmitting: $isSubmitting, dateValidationError: $dateValidationError)';
  }
}

/// @nodoc
abstract mixin class $ReminderFormStateCopyWith<$Res> {
  factory $ReminderFormStateCopyWith(
          ReminderFormState value, $Res Function(ReminderFormState) _then) =
      _$ReminderFormStateCopyWithImpl;
  @useResult
  $Res call(
      {TemporalDateTime? expiredAt,
      bool ninetyDaysBefore,
      bool sixtyDaysBefore,
      bool thirtyDaysBefore,
      TemporalDateTime? reminderDate,
      List<Staff> selectedStaff,
      bool isSubmitting,
      String? dateValidationError});
}

/// @nodoc
class _$ReminderFormStateCopyWithImpl<$Res>
    implements $ReminderFormStateCopyWith<$Res> {
  _$ReminderFormStateCopyWithImpl(this._self, this._then);

  final ReminderFormState _self;
  final $Res Function(ReminderFormState) _then;

  /// Create a copy of ReminderFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expiredAt = freezed,
    Object? ninetyDaysBefore = null,
    Object? sixtyDaysBefore = null,
    Object? thirtyDaysBefore = null,
    Object? reminderDate = freezed,
    Object? selectedStaff = null,
    Object? isSubmitting = null,
    Object? dateValidationError = freezed,
  }) {
    return _then(_self.copyWith(
      expiredAt: freezed == expiredAt
          ? _self.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as TemporalDateTime?,
      ninetyDaysBefore: null == ninetyDaysBefore
          ? _self.ninetyDaysBefore
          : ninetyDaysBefore // ignore: cast_nullable_to_non_nullable
              as bool,
      sixtyDaysBefore: null == sixtyDaysBefore
          ? _self.sixtyDaysBefore
          : sixtyDaysBefore // ignore: cast_nullable_to_non_nullable
              as bool,
      thirtyDaysBefore: null == thirtyDaysBefore
          ? _self.thirtyDaysBefore
          : thirtyDaysBefore // ignore: cast_nullable_to_non_nullable
              as bool,
      reminderDate: freezed == reminderDate
          ? _self.reminderDate
          : reminderDate // ignore: cast_nullable_to_non_nullable
              as TemporalDateTime?,
      selectedStaff: null == selectedStaff
          ? _self.selectedStaff
          : selectedStaff // ignore: cast_nullable_to_non_nullable
              as List<Staff>,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      dateValidationError: freezed == dateValidationError
          ? _self.dateValidationError
          : dateValidationError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReminderFormState].
extension ReminderFormStatePatterns on ReminderFormState {
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
    TResult Function(_ReminderFormState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReminderFormState() when $default != null:
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
    TResult Function(_ReminderFormState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReminderFormState():
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
    TResult? Function(_ReminderFormState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReminderFormState() when $default != null:
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
            TemporalDateTime? expiredAt,
            bool ninetyDaysBefore,
            bool sixtyDaysBefore,
            bool thirtyDaysBefore,
            TemporalDateTime? reminderDate,
            List<Staff> selectedStaff,
            bool isSubmitting,
            String? dateValidationError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReminderFormState() when $default != null:
        return $default(
            _that.expiredAt,
            _that.ninetyDaysBefore,
            _that.sixtyDaysBefore,
            _that.thirtyDaysBefore,
            _that.reminderDate,
            _that.selectedStaff,
            _that.isSubmitting,
            _that.dateValidationError);
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
            TemporalDateTime? expiredAt,
            bool ninetyDaysBefore,
            bool sixtyDaysBefore,
            bool thirtyDaysBefore,
            TemporalDateTime? reminderDate,
            List<Staff> selectedStaff,
            bool isSubmitting,
            String? dateValidationError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReminderFormState():
        return $default(
            _that.expiredAt,
            _that.ninetyDaysBefore,
            _that.sixtyDaysBefore,
            _that.thirtyDaysBefore,
            _that.reminderDate,
            _that.selectedStaff,
            _that.isSubmitting,
            _that.dateValidationError);
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
            TemporalDateTime? expiredAt,
            bool ninetyDaysBefore,
            bool sixtyDaysBefore,
            bool thirtyDaysBefore,
            TemporalDateTime? reminderDate,
            List<Staff> selectedStaff,
            bool isSubmitting,
            String? dateValidationError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReminderFormState() when $default != null:
        return $default(
            _that.expiredAt,
            _that.ninetyDaysBefore,
            _that.sixtyDaysBefore,
            _that.thirtyDaysBefore,
            _that.reminderDate,
            _that.selectedStaff,
            _that.isSubmitting,
            _that.dateValidationError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReminderFormState extends ReminderFormState {
  const _ReminderFormState(
      {this.expiredAt,
      this.ninetyDaysBefore = false,
      this.sixtyDaysBefore = false,
      this.thirtyDaysBefore = false,
      this.reminderDate,
      final List<Staff> selectedStaff = const [],
      this.isSubmitting = false,
      this.dateValidationError})
      : _selectedStaff = selectedStaff,
        super._();

  @override
  final TemporalDateTime? expiredAt;
  @override
  @JsonKey()
  final bool ninetyDaysBefore;
  @override
  @JsonKey()
  final bool sixtyDaysBefore;
  @override
  @JsonKey()
  final bool thirtyDaysBefore;
  @override
  final TemporalDateTime? reminderDate;
  final List<Staff> _selectedStaff;
  @override
  @JsonKey()
  List<Staff> get selectedStaff {
    if (_selectedStaff is EqualUnmodifiableListView) return _selectedStaff;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedStaff);
  }

  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  final String? dateValidationError;

  /// Create a copy of ReminderFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReminderFormStateCopyWith<_ReminderFormState> get copyWith =>
      __$ReminderFormStateCopyWithImpl<_ReminderFormState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReminderFormState &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt) &&
            (identical(other.ninetyDaysBefore, ninetyDaysBefore) ||
                other.ninetyDaysBefore == ninetyDaysBefore) &&
            (identical(other.sixtyDaysBefore, sixtyDaysBefore) ||
                other.sixtyDaysBefore == sixtyDaysBefore) &&
            (identical(other.thirtyDaysBefore, thirtyDaysBefore) ||
                other.thirtyDaysBefore == thirtyDaysBefore) &&
            (identical(other.reminderDate, reminderDate) ||
                other.reminderDate == reminderDate) &&
            const DeepCollectionEquality()
                .equals(other._selectedStaff, _selectedStaff) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.dateValidationError, dateValidationError) ||
                other.dateValidationError == dateValidationError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      expiredAt,
      ninetyDaysBefore,
      sixtyDaysBefore,
      thirtyDaysBefore,
      reminderDate,
      const DeepCollectionEquality().hash(_selectedStaff),
      isSubmitting,
      dateValidationError);

  @override
  String toString() {
    return 'ReminderFormState(expiredAt: $expiredAt, ninetyDaysBefore: $ninetyDaysBefore, sixtyDaysBefore: $sixtyDaysBefore, thirtyDaysBefore: $thirtyDaysBefore, reminderDate: $reminderDate, selectedStaff: $selectedStaff, isSubmitting: $isSubmitting, dateValidationError: $dateValidationError)';
  }
}

/// @nodoc
abstract mixin class _$ReminderFormStateCopyWith<$Res>
    implements $ReminderFormStateCopyWith<$Res> {
  factory _$ReminderFormStateCopyWith(
          _ReminderFormState value, $Res Function(_ReminderFormState) _then) =
      __$ReminderFormStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {TemporalDateTime? expiredAt,
      bool ninetyDaysBefore,
      bool sixtyDaysBefore,
      bool thirtyDaysBefore,
      TemporalDateTime? reminderDate,
      List<Staff> selectedStaff,
      bool isSubmitting,
      String? dateValidationError});
}

/// @nodoc
class __$ReminderFormStateCopyWithImpl<$Res>
    implements _$ReminderFormStateCopyWith<$Res> {
  __$ReminderFormStateCopyWithImpl(this._self, this._then);

  final _ReminderFormState _self;
  final $Res Function(_ReminderFormState) _then;

  /// Create a copy of ReminderFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? expiredAt = freezed,
    Object? ninetyDaysBefore = null,
    Object? sixtyDaysBefore = null,
    Object? thirtyDaysBefore = null,
    Object? reminderDate = freezed,
    Object? selectedStaff = null,
    Object? isSubmitting = null,
    Object? dateValidationError = freezed,
  }) {
    return _then(_ReminderFormState(
      expiredAt: freezed == expiredAt
          ? _self.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as TemporalDateTime?,
      ninetyDaysBefore: null == ninetyDaysBefore
          ? _self.ninetyDaysBefore
          : ninetyDaysBefore // ignore: cast_nullable_to_non_nullable
              as bool,
      sixtyDaysBefore: null == sixtyDaysBefore
          ? _self.sixtyDaysBefore
          : sixtyDaysBefore // ignore: cast_nullable_to_non_nullable
              as bool,
      thirtyDaysBefore: null == thirtyDaysBefore
          ? _self.thirtyDaysBefore
          : thirtyDaysBefore // ignore: cast_nullable_to_non_nullable
              as bool,
      reminderDate: freezed == reminderDate
          ? _self.reminderDate
          : reminderDate // ignore: cast_nullable_to_non_nullable
              as TemporalDateTime?,
      selectedStaff: null == selectedStaff
          ? _self._selectedStaff
          : selectedStaff // ignore: cast_nullable_to_non_nullable
              as List<Staff>,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      dateValidationError: freezed == dateValidationError
          ? _self.dateValidationError
          : dateValidationError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ReminderFormResult {
  List<TemporalDateTime> get dates;
  List<Staff> get staff;

  /// Create a copy of ReminderFormResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReminderFormResultCopyWith<ReminderFormResult> get copyWith =>
      _$ReminderFormResultCopyWithImpl<ReminderFormResult>(
          this as ReminderFormResult, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReminderFormResult &&
            const DeepCollectionEquality().equals(other.dates, dates) &&
            const DeepCollectionEquality().equals(other.staff, staff));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dates),
      const DeepCollectionEquality().hash(staff));

  @override
  String toString() {
    return 'ReminderFormResult(dates: $dates, staff: $staff)';
  }
}

/// @nodoc
abstract mixin class $ReminderFormResultCopyWith<$Res> {
  factory $ReminderFormResultCopyWith(
          ReminderFormResult value, $Res Function(ReminderFormResult) _then) =
      _$ReminderFormResultCopyWithImpl;
  @useResult
  $Res call({List<TemporalDateTime> dates, List<Staff> staff});
}

/// @nodoc
class _$ReminderFormResultCopyWithImpl<$Res>
    implements $ReminderFormResultCopyWith<$Res> {
  _$ReminderFormResultCopyWithImpl(this._self, this._then);

  final ReminderFormResult _self;
  final $Res Function(ReminderFormResult) _then;

  /// Create a copy of ReminderFormResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dates = null,
    Object? staff = null,
  }) {
    return _then(_self.copyWith(
      dates: null == dates
          ? _self.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<TemporalDateTime>,
      staff: null == staff
          ? _self.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as List<Staff>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReminderFormResult].
extension ReminderFormResultPatterns on ReminderFormResult {
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
    TResult Function(_ReminderFormResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReminderFormResult() when $default != null:
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
    TResult Function(_ReminderFormResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReminderFormResult():
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
    TResult? Function(_ReminderFormResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReminderFormResult() when $default != null:
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
    TResult Function(List<TemporalDateTime> dates, List<Staff> staff)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReminderFormResult() when $default != null:
        return $default(_that.dates, _that.staff);
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
    TResult Function(List<TemporalDateTime> dates, List<Staff> staff) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReminderFormResult():
        return $default(_that.dates, _that.staff);
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
    TResult? Function(List<TemporalDateTime> dates, List<Staff> staff)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReminderFormResult() when $default != null:
        return $default(_that.dates, _that.staff);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReminderFormResult implements ReminderFormResult {
  const _ReminderFormResult(
      {required final List<TemporalDateTime> dates,
      final List<Staff> staff = const []})
      : _dates = dates,
        _staff = staff;

  final List<TemporalDateTime> _dates;
  @override
  List<TemporalDateTime> get dates {
    if (_dates is EqualUnmodifiableListView) return _dates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dates);
  }

  final List<Staff> _staff;
  @override
  @JsonKey()
  List<Staff> get staff {
    if (_staff is EqualUnmodifiableListView) return _staff;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_staff);
  }

  /// Create a copy of ReminderFormResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReminderFormResultCopyWith<_ReminderFormResult> get copyWith =>
      __$ReminderFormResultCopyWithImpl<_ReminderFormResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReminderFormResult &&
            const DeepCollectionEquality().equals(other._dates, _dates) &&
            const DeepCollectionEquality().equals(other._staff, _staff));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dates),
      const DeepCollectionEquality().hash(_staff));

  @override
  String toString() {
    return 'ReminderFormResult(dates: $dates, staff: $staff)';
  }
}

/// @nodoc
abstract mixin class _$ReminderFormResultCopyWith<$Res>
    implements $ReminderFormResultCopyWith<$Res> {
  factory _$ReminderFormResultCopyWith(
          _ReminderFormResult value, $Res Function(_ReminderFormResult) _then) =
      __$ReminderFormResultCopyWithImpl;
  @override
  @useResult
  $Res call({List<TemporalDateTime> dates, List<Staff> staff});
}

/// @nodoc
class __$ReminderFormResultCopyWithImpl<$Res>
    implements _$ReminderFormResultCopyWith<$Res> {
  __$ReminderFormResultCopyWithImpl(this._self, this._then);

  final _ReminderFormResult _self;
  final $Res Function(_ReminderFormResult) _then;

  /// Create a copy of ReminderFormResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dates = null,
    Object? staff = null,
  }) {
    return _then(_ReminderFormResult(
      dates: null == dates
          ? _self._dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<TemporalDateTime>,
      staff: null == staff
          ? _self._staff
          : staff // ignore: cast_nullable_to_non_nullable
              as List<Staff>,
    ));
  }
}

// dart format on
