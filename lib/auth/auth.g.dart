// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
          dependencies: const <ProviderOrFamily>[userIdProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            UserDetailsProvider.$allTransitiveDependencies0,
          ],
        );

  static const $allTransitiveDependencies0 = userIdProvider;

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

String _$userDetailsHash() => r'892107c5553b2553d6a6f1ebfafaab58adda385c';

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
          dependencies: const <ProviderOrFamily>[userDetailsProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            IsAdminProvider.$allTransitiveDependencies0,
            IsAdminProvider.$allTransitiveDependencies1,
          ],
        );

  static const $allTransitiveDependencies0 = userDetailsProvider;
  static const $allTransitiveDependencies1 =
      UserDetailsProvider.$allTransitiveDependencies0;

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

String _$isAdminHash() => r'8e9a54d279ee4bfced5e6dadf7f1763a0cdee342';

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
          dependencies: const <ProviderOrFamily>[userDetailsProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            IsSafetyOfficerProvider.$allTransitiveDependencies0,
            IsSafetyOfficerProvider.$allTransitiveDependencies1,
          ],
        );

  static const $allTransitiveDependencies0 = userDetailsProvider;
  static const $allTransitiveDependencies1 =
      UserDetailsProvider.$allTransitiveDependencies0;

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

String _$isSafetyOfficerHash() => r'2761fdea39d720021b89079144c46ee7a17cf163';

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
          dependencies: const <ProviderOrFamily>[userDetailsProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            IsComplianceManagerProvider.$allTransitiveDependencies0,
            IsComplianceManagerProvider.$allTransitiveDependencies1,
          ],
        );

  static const $allTransitiveDependencies0 = userDetailsProvider;
  static const $allTransitiveDependencies1 =
      UserDetailsProvider.$allTransitiveDependencies0;

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
    r'19213fa50b5dd94cd5ad9b86f00118ac6524cd73';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
