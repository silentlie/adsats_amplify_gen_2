// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(rolesService)
const rolesServiceProvider = RolesServiceProvider._();

final class RolesServiceProvider extends $FunctionalProvider<RolesRepository,
    RolesRepository, RolesRepository> with $Provider<RolesRepository> {
  const RolesServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'rolesServiceProvider',
          isAutoDispose: true,
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

String _$rolesServiceHash() => r'56541d4a07fa8f65efa96290b2bfe93ce442d6cd';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
