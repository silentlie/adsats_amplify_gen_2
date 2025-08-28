// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(databaseAPI)
const databaseAPIProvider = DatabaseAPIProvider._();

final class DatabaseAPIProvider extends $FunctionalProvider<AmplifyAppSyncAPI,
    AmplifyAppSyncAPI, AmplifyAppSyncAPI> with $Provider<AmplifyAppSyncAPI> {
  const DatabaseAPIProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'databaseAPIProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$databaseAPIHash();

  @$internal
  @override
  $ProviderElement<AmplifyAppSyncAPI> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AmplifyAppSyncAPI create(Ref ref) {
    return databaseAPI(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AmplifyAppSyncAPI value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AmplifyAppSyncAPI>(value),
    );
  }
}

String _$databaseAPIHash() => r'65bf8be47dfb8efc4cbdfe1f2c847b8a8d6a7980';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
