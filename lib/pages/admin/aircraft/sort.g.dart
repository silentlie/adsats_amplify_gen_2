// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AircraftSort)
const aircraftSortProvider = AircraftSortProvider._();

final class AircraftSortProvider
    extends $NotifierProvider<AircraftSort, AircraftSortState> {
  const AircraftSortProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'aircraftSortProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$aircraftSortHash();

  @$internal
  @override
  AircraftSort create() => AircraftSort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AircraftSortState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AircraftSortState>(value),
    );
  }
}

String _$aircraftSortHash() => r'a0e563216103714e363ac98802d95063f82acc0b';

abstract class _$AircraftSort extends $Notifier<AircraftSortState> {
  AircraftSortState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AircraftSortState, AircraftSortState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AircraftSortState, AircraftSortState>,
        AircraftSortState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
