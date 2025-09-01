// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(aircraftService)
const aircraftServiceProvider = AircraftServiceProvider._();

final class AircraftServiceProvider extends $FunctionalProvider<
    AircraftRepository,
    AircraftRepository,
    AircraftRepository> with $Provider<AircraftRepository> {
  const AircraftServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'aircraftServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$aircraftServiceHash();

  @$internal
  @override
  $ProviderElement<AircraftRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AircraftRepository create(Ref ref) {
    return aircraftService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AircraftRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AircraftRepository>(value),
    );
  }
}

String _$aircraftServiceHash() => r'97dbfebd24aef9a37f3894f2be71fa8839378a8f';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
