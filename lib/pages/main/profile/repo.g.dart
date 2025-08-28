// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(profileRepo)
const profileRepoProvider = ProfileRepoProvider._();

final class ProfileRepoProvider extends $FunctionalProvider<
        AsyncValue<Iterable<Role>>, Iterable<Role>, FutureOr<Iterable<Role>>>
    with $FutureModifier<Iterable<Role>>, $FutureProvider<Iterable<Role>> {
  const ProfileRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'profileRepoProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[userIdProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            ProfileRepoProvider.$allTransitiveDependencies0,
          ],
        );

  static const $allTransitiveDependencies0 = userIdProvider;

  @override
  String debugGetCreateSourceHash() => _$profileRepoHash();

  @$internal
  @override
  $FutureProviderElement<Iterable<Role>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Iterable<Role>> create(Ref ref) {
    return profileRepo(ref);
  }
}

String _$profileRepoHash() => r'26d01984f7f49bd6056ded8b0a270a026c704fd5';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
