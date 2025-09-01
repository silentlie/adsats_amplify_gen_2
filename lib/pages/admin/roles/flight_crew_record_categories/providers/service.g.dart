// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(flightCrewRecordCategoriesService)
const flightCrewRecordCategoriesServiceProvider =
    FlightCrewRecordCategoriesServiceProvider._();

final class FlightCrewRecordCategoriesServiceProvider
    extends $FunctionalProvider<
        FlightCrewRecordCategoriesRepository,
        FlightCrewRecordCategoriesRepository,
        FlightCrewRecordCategoriesRepository>
    with $Provider<FlightCrewRecordCategoriesRepository> {
  const FlightCrewRecordCategoriesServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'flightCrewRecordCategoriesServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() =>
      _$flightCrewRecordCategoriesServiceHash();

  @$internal
  @override
  $ProviderElement<FlightCrewRecordCategoriesRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FlightCrewRecordCategoriesRepository create(Ref ref) {
    return flightCrewRecordCategoriesService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlightCrewRecordCategoriesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<FlightCrewRecordCategoriesRepository>(value),
    );
  }
}

String _$flightCrewRecordCategoriesServiceHash() =>
    r'bcfd11c4b1eb4b55c0ee4a28f74cf29d9fc6405c';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
