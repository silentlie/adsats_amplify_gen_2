// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aircraft.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
          dependencies: const <ProviderOrFamily>[adminFilterProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            AircraftProvider.$allTransitiveDependencies0,
          ],
        );

  static const $allTransitiveDependencies0 = adminFilterProvider;

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

String _$aircraftHash() => r'5ce6d1458e4cb1dd239f82b69e88eb867a73ede0';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
