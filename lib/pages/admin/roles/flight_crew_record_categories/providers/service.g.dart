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
          isAutoDispose: true,
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
    r'82e3d3306db8f31134c5638d93520051f97ece84';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
