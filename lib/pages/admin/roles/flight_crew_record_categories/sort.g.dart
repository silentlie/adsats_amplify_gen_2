// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(FlightCrewRecordsCategorySort)
const flightCrewRecordsCategorySortProvider =
    FlightCrewRecordsCategorySortProvider._();

final class FlightCrewRecordsCategorySortProvider extends $NotifierProvider<
    FlightCrewRecordsCategorySort, FlightCrewRecordsCategorySortState> {
  const FlightCrewRecordsCategorySortProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'flightCrewRecordsCategorySortProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$flightCrewRecordsCategorySortHash();

  @$internal
  @override
  FlightCrewRecordsCategorySort create() => FlightCrewRecordsCategorySort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlightCrewRecordsCategorySortState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<FlightCrewRecordsCategorySortState>(value),
    );
  }
}

String _$flightCrewRecordsCategorySortHash() =>
    r'7f316f7d8546089dc9a7ede3d7fe5c1646c820e6';

abstract class _$FlightCrewRecordsCategorySort
    extends $Notifier<FlightCrewRecordsCategorySortState> {
  FlightCrewRecordsCategorySortState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<FlightCrewRecordsCategorySortState,
        FlightCrewRecordsCategorySortState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<FlightCrewRecordsCategorySortState,
            FlightCrewRecordsCategorySortState>,
        FlightCrewRecordsCategorySortState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
