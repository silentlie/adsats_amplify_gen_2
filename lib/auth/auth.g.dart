// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userIdHash() => r'2b1762f5114422db6a7aaca8a84656d84c75397a';

/// See also [userId].
@ProviderFor(userId)
final userIdProvider = AutoDisposeFutureProvider<String>.internal(
  userId,
  name: r'userIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userIdHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserIdRef = AutoDisposeFutureProviderRef<String>;
String _$userDetailsHash() => r'617c1a9b729b2a31e8876ff773bb18e8232f7932';

/// See also [userDetails].
@ProviderFor(userDetails)
final userDetailsProvider = AutoDisposeFutureProvider<Staff>.internal(
  userDetails,
  name: r'userDetailsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userDetailsHash,
  dependencies: <ProviderOrFamily>[userIdProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    userIdProvider,
    ...?userIdProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserDetailsRef = AutoDisposeFutureProviderRef<Staff>;
String _$isAdminHash() => r'96b4f4ec96cebc4d7a5cbe0327080f9cde2a7e5c';

/// See also [isAdmin].
@ProviderFor(isAdmin)
final isAdminProvider = AutoDisposeProvider<bool>.internal(
  isAdmin,
  name: r'isAdminProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isAdminHash,
  dependencies: <ProviderOrFamily>[userDetailsProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    userDetailsProvider,
    ...?userDetailsProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsAdminRef = AutoDisposeProviderRef<bool>;
String _$isSafetyOfficerHash() => r'a43178c78a2686af64559b3f401b46ec08feeb4f';

/// See also [isSafetyOfficer].
@ProviderFor(isSafetyOfficer)
final isSafetyOfficerProvider = AutoDisposeProvider<bool>.internal(
  isSafetyOfficer,
  name: r'isSafetyOfficerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isSafetyOfficerHash,
  dependencies: <ProviderOrFamily>[userDetailsProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    userDetailsProvider,
    ...?userDetailsProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsSafetyOfficerRef = AutoDisposeProviderRef<bool>;
String _$isComplianceManagerHash() =>
    r'b183cccda764ae6e183290791ed74f9c78b7d550';

/// See also [isComplianceManager].
@ProviderFor(isComplianceManager)
final isComplianceManagerProvider = AutoDisposeProvider<bool>.internal(
  isComplianceManager,
  name: r'isComplianceManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isComplianceManagerHash,
  dependencies: <ProviderOrFamily>[userDetailsProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    userDetailsProvider,
    ...?userDetailsProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsComplianceManagerRef = AutoDisposeProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
