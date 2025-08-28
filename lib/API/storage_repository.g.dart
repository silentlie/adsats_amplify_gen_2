// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(storageRepository)
const storageRepositoryProvider = StorageRepositoryProvider._();

final class StorageRepositoryProvider
    extends $FunctionalProvider<AmplifyS3API, AmplifyS3API, AmplifyS3API>
    with $Provider<AmplifyS3API> {
  const StorageRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'storageRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$storageRepositoryHash();

  @$internal
  @override
  $ProviderElement<AmplifyS3API> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AmplifyS3API create(Ref ref) {
    return storageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AmplifyS3API value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AmplifyS3API>(value),
    );
  }
}

String _$storageRepositoryHash() => r'cd5cfcf7c46495105fa16cbfe96a8e491552b084';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
