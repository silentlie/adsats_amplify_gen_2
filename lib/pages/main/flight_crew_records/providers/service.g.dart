// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(recordsService)
const recordsServiceProvider = RecordsServiceProvider._();

final class RecordsServiceProvider extends $FunctionalProvider<
    FlightCrewRecordsRepository,
    FlightCrewRecordsRepository,
    FlightCrewRecordsRepository> with $Provider<FlightCrewRecordsRepository> {
  const RecordsServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'recordsServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$recordsServiceHash();

  @$internal
  @override
  $ProviderElement<FlightCrewRecordsRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FlightCrewRecordsRepository create(Ref ref) {
    return recordsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlightCrewRecordsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlightCrewRecordsRepository>(value),
    );
  }
}

String _$recordsServiceHash() => r'eba41129697e5fb7bdb84588b741457db0f54468';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
