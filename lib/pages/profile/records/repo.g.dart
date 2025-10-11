// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
          dependencies: null,
          $allTransitiveDependencies: null,
        );

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

String _$profileRepoHash() => r'c452a859fad0b4a7c42995e6e9eaf042f2b063c5';
