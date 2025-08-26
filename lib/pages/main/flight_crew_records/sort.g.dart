// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(FlightCrewRecordSort)
const flightCrewRecordSortProvider = FlightCrewRecordSortProvider._();

final class FlightCrewRecordSortProvider
    extends $NotifierProvider<FlightCrewRecordSort, FlightCrewRecordSortState> {
  const FlightCrewRecordSortProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'flightCrewRecordSortProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$flightCrewRecordSortHash();

  @$internal
  @override
  FlightCrewRecordSort create() => FlightCrewRecordSort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlightCrewRecordSortState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlightCrewRecordSortState>(value),
    );
  }
}

String _$flightCrewRecordSortHash() =>
    r'58d94140fd846080e84828359f4dfbaa1817fbd8';

abstract class _$FlightCrewRecordSort
    extends $Notifier<FlightCrewRecordSortState> {
  FlightCrewRecordSortState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<FlightCrewRecordSortState, FlightCrewRecordSortState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<FlightCrewRecordSortState, FlightCrewRecordSortState>,
        FlightCrewRecordSortState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
