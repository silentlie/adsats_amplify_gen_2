// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aircraft.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(aircraft)
const aircraftProvider = AircraftProvider._();

final class AircraftProvider extends $FunctionalProvider<
        AsyncValue<List<Aircraft>>, List<Aircraft>, FutureOr<List<Aircraft>>>
    with $FutureModifier<List<Aircraft>>, $FutureProvider<List<Aircraft>> {
  const AircraftProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'aircraftProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$aircraftHash();

  @$internal
  @override
  $FutureProviderElement<List<Aircraft>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Aircraft>> create(Ref ref) {
    return aircraft(ref);
  }
}

String _$aircraftHash() => r'05cf4ccf69cf1f6a10adee85f80e6735033145e2';
