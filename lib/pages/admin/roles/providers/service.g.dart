// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(rolesService)
final rolesServiceProvider = RolesServiceProvider._();

final class RolesServiceProvider extends $FunctionalProvider<RolesRepository,
    RolesRepository, RolesRepository> with $Provider<RolesRepository> {
  RolesServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'rolesServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$rolesServiceHash();

  @$internal
  @override
  $ProviderElement<RolesRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RolesRepository create(Ref ref) {
    return rolesService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RolesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RolesRepository>(value),
    );
  }
}

String _$rolesServiceHash() => r'a7c45ea3b5eeb95542c71c1c753fb20234f60613';
