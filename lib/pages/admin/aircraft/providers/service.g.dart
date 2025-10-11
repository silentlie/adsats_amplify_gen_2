// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
