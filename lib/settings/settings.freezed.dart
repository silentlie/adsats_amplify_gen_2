// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Settings {
  ThemeMode get themeMode;
  bool get isNavigationRailExtended;
  Map<String, List<String>> get flightCrewRecordFavourites;

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsCopyWith<Settings> get copyWith =>
      _$SettingsCopyWithImpl<Settings>(this as Settings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Settings &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(
                    other.isNavigationRailExtended, isNavigationRailExtended) ||
                other.isNavigationRailExtended == isNavigationRailExtended) &&
            const DeepCollectionEquality().equals(
                other.flightCrewRecordFavourites, flightCrewRecordFavourites));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      themeMode,
      isNavigationRailExtended,
      const DeepCollectionEquality().hash(flightCrewRecordFavourites));

  @override
  String toString() {
    return 'Settings(themeMode: $themeMode, isNavigationRailExtended: $isNavigationRailExtended, flightCrewRecordFavourites: $flightCrewRecordFavourites)';
  }
}

/// @nodoc
abstract mixin class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) _then) =
      _$SettingsCopyWithImpl;
  @useResult
  $Res call(
      {ThemeMode themeMode,
      bool isNavigationRailExtended,
      Map<String, List<String>> flightCrewRecordFavourites});
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res> implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._self, this._then);

  final Settings _self;
  final $Res Function(Settings) _then;

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? isNavigationRailExtended = null,
    Object? flightCrewRecordFavourites = null,
  }) {
    return _then(_self.copyWith(
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      isNavigationRailExtended: null == isNavigationRailExtended
          ? _self.isNavigationRailExtended
          : isNavigationRailExtended // ignore: cast_nullable_to_non_nullable
              as bool,
      flightCrewRecordFavourites: null == flightCrewRecordFavourites
          ? _self.flightCrewRecordFavourites
          : flightCrewRecordFavourites // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Settings].
extension SettingsPatterns on Settings {
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
    TResult Function(_Settings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Settings() when $default != null:
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
    TResult Function(_Settings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Settings():
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
    TResult? Function(_Settings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Settings() when $default != null:
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
    TResult Function(ThemeMode themeMode, bool isNavigationRailExtended,
            Map<String, List<String>> flightCrewRecordFavourites)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Settings() when $default != null:
        return $default(_that.themeMode, _that.isNavigationRailExtended,
            _that.flightCrewRecordFavourites);
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
    TResult Function(ThemeMode themeMode, bool isNavigationRailExtended,
            Map<String, List<String>> flightCrewRecordFavourites)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Settings():
        return $default(_that.themeMode, _that.isNavigationRailExtended,
            _that.flightCrewRecordFavourites);
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
    TResult? Function(ThemeMode themeMode, bool isNavigationRailExtended,
            Map<String, List<String>> flightCrewRecordFavourites)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Settings() when $default != null:
        return $default(_that.themeMode, _that.isNavigationRailExtended,
            _that.flightCrewRecordFavourites);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Settings extends Settings {
  _Settings(
      {this.themeMode = ThemeMode.system,
      this.isNavigationRailExtended = true,
      final Map<String, List<String>> flightCrewRecordFavourites = const {}})
      : _flightCrewRecordFavourites = flightCrewRecordFavourites,
        super._();

  @override
  @JsonKey()
  final ThemeMode themeMode;
  @override
  @JsonKey()
  final bool isNavigationRailExtended;
  final Map<String, List<String>> _flightCrewRecordFavourites;
  @override
  @JsonKey()
  Map<String, List<String>> get flightCrewRecordFavourites {
    if (_flightCrewRecordFavourites is EqualUnmodifiableMapView)
      return _flightCrewRecordFavourites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_flightCrewRecordFavourites);
  }

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettingsCopyWith<_Settings> get copyWith =>
      __$SettingsCopyWithImpl<_Settings>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Settings &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(
                    other.isNavigationRailExtended, isNavigationRailExtended) ||
                other.isNavigationRailExtended == isNavigationRailExtended) &&
            const DeepCollectionEquality().equals(
                other._flightCrewRecordFavourites,
                _flightCrewRecordFavourites));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      themeMode,
      isNavigationRailExtended,
      const DeepCollectionEquality().hash(_flightCrewRecordFavourites));

  @override
  String toString() {
    return 'Settings(themeMode: $themeMode, isNavigationRailExtended: $isNavigationRailExtended, flightCrewRecordFavourites: $flightCrewRecordFavourites)';
  }
}

/// @nodoc
abstract mixin class _$SettingsCopyWith<$Res>
    implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) _then) =
      __$SettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ThemeMode themeMode,
      bool isNavigationRailExtended,
      Map<String, List<String>> flightCrewRecordFavourites});
}

/// @nodoc
class __$SettingsCopyWithImpl<$Res> implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(this._self, this._then);

  final _Settings _self;
  final $Res Function(_Settings) _then;

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? themeMode = null,
    Object? isNavigationRailExtended = null,
    Object? flightCrewRecordFavourites = null,
  }) {
    return _then(_Settings(
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      isNavigationRailExtended: null == isNavigationRailExtended
          ? _self.isNavigationRailExtended
          : isNavigationRailExtended // ignore: cast_nullable_to_non_nullable
              as bool,
      flightCrewRecordFavourites: null == flightCrewRecordFavourites
          ? _self._flightCrewRecordFavourites
          : flightCrewRecordFavourites // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ));
  }
}

// dart format on
