// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userId)
const userIdProvider = UserIdProvider._();

final class UserIdProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  const UserIdProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userIdProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userIdHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return userId(ref);
  }
}

String _$userIdHash() => r'f7fb8e5548393f5e80b768e4bfd71dc7eb36b93f';

@ProviderFor(userDetails)
const userDetailsProvider = UserDetailsProvider._();

final class UserDetailsProvider
    extends $FunctionalProvider<AsyncValue<Staff>, Staff, FutureOr<Staff>>
    with $FutureModifier<Staff>, $FutureProvider<Staff> {
  const UserDetailsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userDetailsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userDetailsHash();

  @$internal
  @override
  $FutureProviderElement<Staff> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Staff> create(Ref ref) {
    return userDetails(ref);
  }
}

String _$userDetailsHash() => r'7ca7ed495d3886a33e9b5d4ea8951b1577732e71';

@ProviderFor(isAdmin)
const isAdminProvider = IsAdminProvider._();

final class IsAdminProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const IsAdminProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isAdminProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isAdminHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isAdmin(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAdminHash() => r'9d62708d04eeb867cead8bcf38595b96d003829e';

@ProviderFor(isSafetyOfficer)
const isSafetyOfficerProvider = IsSafetyOfficerProvider._();

final class IsSafetyOfficerProvider
    extends $FunctionalProvider<bool, bool, bool> with $Provider<bool> {
  const IsSafetyOfficerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isSafetyOfficerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isSafetyOfficerHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isSafetyOfficer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isSafetyOfficerHash() => r'74863d8356890c93f76c1abd45e4f80ae01eb534';

@ProviderFor(isComplianceManager)
const isComplianceManagerProvider = IsComplianceManagerProvider._();

final class IsComplianceManagerProvider
    extends $FunctionalProvider<bool, bool, bool> with $Provider<bool> {
  const IsComplianceManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isComplianceManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isComplianceManagerHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isComplianceManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isComplianceManagerHash() =>
    r'b0a2468897f5eb767237eaefa6ecd9e454769040';
