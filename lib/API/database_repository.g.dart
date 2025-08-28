// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(databaseRepository)
const databaseRepositoryProvider = DatabaseRepositoryProvider._();

final class DatabaseRepositoryProvider extends $FunctionalProvider<
    AmplifyAppSyncAPI,
    AmplifyAppSyncAPI,
    AmplifyAppSyncAPI> with $Provider<AmplifyAppSyncAPI> {
  const DatabaseRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'databaseRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$databaseRepositoryHash();

  @$internal
  @override
  $ProviderElement<AmplifyAppSyncAPI> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AmplifyAppSyncAPI create(Ref ref) {
    return databaseRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AmplifyAppSyncAPI value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AmplifyAppSyncAPI>(value),
    );
  }
}

String _$databaseRepositoryHash() =>
    r'3e05116229435339d0acf0c7005119f88d98f862';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
