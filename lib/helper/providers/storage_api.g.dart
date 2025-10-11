// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageAPI)
const storageAPIProvider = StorageAPIProvider._();

final class StorageAPIProvider
    extends $FunctionalProvider<AmplifyS3API, AmplifyS3API, AmplifyS3API>
    with $Provider<AmplifyS3API> {
  const StorageAPIProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'storageAPIProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$storageAPIHash();

  @$internal
  @override
  $ProviderElement<AmplifyS3API> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AmplifyS3API create(Ref ref) {
    return storageAPI(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AmplifyS3API value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AmplifyS3API>(value),
    );
  }
}

String _$storageAPIHash() => r'0477693af5a315ebfe1dd49fa731c91f860f32f9';
