// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileRepoHash() => r'56f7295520a028c4e62e4b2d527d72deaba1386f';

/// See also [profileRepo].
@ProviderFor(profileRepo)
final profileRepoProvider = AutoDisposeFutureProvider<Iterable<Role>>.internal(
  profileRepo,
  name: r'profileRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$profileRepoHash,
  dependencies: <ProviderOrFamily>[userIdProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    userIdProvider,
    ...?userIdProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfileRepoRef = AutoDisposeFutureProviderRef<Iterable<Role>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
