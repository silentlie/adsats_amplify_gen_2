// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportFilterState {
  Staff get user;
  String get search;
  ReportType? get type;
  ReportStatus? get status;
  bool? get discrepanciesFound;
  bool? get archived;
  DateTimeRange? get reportedAt;

  /// Create a copy of ReportFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportFilterStateCopyWith<ReportFilterState> get copyWith =>
      _$ReportFilterStateCopyWithImpl<ReportFilterState>(
          this as ReportFilterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportFilterState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.discrepanciesFound, discrepanciesFound) ||
                other.discrepanciesFound == discrepanciesFound) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.reportedAt, reportedAt) ||
                other.reportedAt == reportedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, search, type, status,
      discrepanciesFound, archived, reportedAt);

  @override
  String toString() {
    return 'ReportFilterState(user: $user, search: $search, type: $type, status: $status, discrepanciesFound: $discrepanciesFound, archived: $archived, reportedAt: $reportedAt)';
  }
}

/// @nodoc
abstract mixin class $ReportFilterStateCopyWith<$Res> {
  factory $ReportFilterStateCopyWith(
          ReportFilterState value, $Res Function(ReportFilterState) _then) =
      _$ReportFilterStateCopyWithImpl;
  @useResult
  $Res call(
      {Staff user,
      String search,
      ReportType? type,
      ReportStatus? status,
      bool? discrepanciesFound,
      bool? archived,
      DateTimeRange? reportedAt});
}

/// @nodoc
class _$ReportFilterStateCopyWithImpl<$Res>
    implements $ReportFilterStateCopyWith<$Res> {
  _$ReportFilterStateCopyWithImpl(this._self, this._then);

  final ReportFilterState _self;
  final $Res Function(ReportFilterState) _then;

  /// Create a copy of ReportFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? search = null,
    Object? type = freezed,
    Object? status = freezed,
    Object? discrepanciesFound = freezed,
    Object? archived = freezed,
    Object? reportedAt = freezed,
  }) {
    return _then(_self.copyWith(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as Staff,
      search: null == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReportType?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus?,
      discrepanciesFound: freezed == discrepanciesFound
          ? _self.discrepanciesFound
          : discrepanciesFound // ignore: cast_nullable_to_non_nullable
              as bool?,
      archived: freezed == archived
          ? _self.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      reportedAt: freezed == reportedAt
          ? _self.reportedAt
          : reportedAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReportFilterState].
extension ReportFilterStatePatterns on ReportFilterState {
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
    TResult Function(_ReportFilterState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportFilterState() when $default != null:
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
    TResult Function(_ReportFilterState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFilterState():
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
    TResult? Function(_ReportFilterState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFilterState() when $default != null:
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
            Staff user,
            String search,
            ReportType? type,
            ReportStatus? status,
            bool? discrepanciesFound,
            bool? archived,
            DateTimeRange? reportedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportFilterState() when $default != null:
        return $default(_that.user, _that.search, _that.type, _that.status,
            _that.discrepanciesFound, _that.archived, _that.reportedAt);
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
            Staff user,
            String search,
            ReportType? type,
            ReportStatus? status,
            bool? discrepanciesFound,
            bool? archived,
            DateTimeRange? reportedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFilterState():
        return $default(_that.user, _that.search, _that.type, _that.status,
            _that.discrepanciesFound, _that.archived, _that.reportedAt);
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
            Staff user,
            String search,
            ReportType? type,
            ReportStatus? status,
            bool? discrepanciesFound,
            bool? archived,
            DateTimeRange? reportedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFilterState() when $default != null:
        return $default(_that.user, _that.search, _that.type, _that.status,
            _that.discrepanciesFound, _that.archived, _that.reportedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReportFilterState extends ReportFilterState {
  _ReportFilterState(
      {required this.user,
      this.search = "",
      this.type,
      this.status,
      this.discrepanciesFound,
      this.archived,
      this.reportedAt})
      : super._();

  @override
  final Staff user;
  @override
  @JsonKey()
  final String search;
  @override
  final ReportType? type;
  @override
  final ReportStatus? status;
  @override
  final bool? discrepanciesFound;
  @override
  final bool? archived;
  @override
  final DateTimeRange? reportedAt;

  /// Create a copy of ReportFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportFilterStateCopyWith<_ReportFilterState> get copyWith =>
      __$ReportFilterStateCopyWithImpl<_ReportFilterState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportFilterState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.discrepanciesFound, discrepanciesFound) ||
                other.discrepanciesFound == discrepanciesFound) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.reportedAt, reportedAt) ||
                other.reportedAt == reportedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, search, type, status,
      discrepanciesFound, archived, reportedAt);

  @override
  String toString() {
    return 'ReportFilterState(user: $user, search: $search, type: $type, status: $status, discrepanciesFound: $discrepanciesFound, archived: $archived, reportedAt: $reportedAt)';
  }
}

/// @nodoc
abstract mixin class _$ReportFilterStateCopyWith<$Res>
    implements $ReportFilterStateCopyWith<$Res> {
  factory _$ReportFilterStateCopyWith(
          _ReportFilterState value, $Res Function(_ReportFilterState) _then) =
      __$ReportFilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Staff user,
      String search,
      ReportType? type,
      ReportStatus? status,
      bool? discrepanciesFound,
      bool? archived,
      DateTimeRange? reportedAt});
}

/// @nodoc
class __$ReportFilterStateCopyWithImpl<$Res>
    implements _$ReportFilterStateCopyWith<$Res> {
  __$ReportFilterStateCopyWithImpl(this._self, this._then);

  final _ReportFilterState _self;
  final $Res Function(_ReportFilterState) _then;

  /// Create a copy of ReportFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
    Object? search = null,
    Object? type = freezed,
    Object? status = freezed,
    Object? discrepanciesFound = freezed,
    Object? archived = freezed,
    Object? reportedAt = freezed,
  }) {
    return _then(_ReportFilterState(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as Staff,
      search: null == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReportType?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus?,
      discrepanciesFound: freezed == discrepanciesFound
          ? _self.discrepanciesFound
          : discrepanciesFound // ignore: cast_nullable_to_non_nullable
              as bool?,
      archived: freezed == archived
          ? _self.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      reportedAt: freezed == reportedAt
          ? _self.reportedAt
          : reportedAt // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ));
  }
}

// dart format on
