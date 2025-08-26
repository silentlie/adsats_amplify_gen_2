// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(FlightCrewRecordsCategoryFilter)
const flightCrewRecordsCategoryFilterProvider =
    FlightCrewRecordsCategoryFilterFamily._();

final class FlightCrewRecordsCategoryFilterProvider extends $NotifierProvider<
    FlightCrewRecordsCategoryFilter, FlightCrewRecordsCategoryFilterState> {
  const FlightCrewRecordsCategoryFilterProvider._(
      {required FlightCrewRecordsCategoryFilterFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'flightCrewRecordsCategoryFilterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$flightCrewRecordsCategoryFilterHash();

  @override
  String toString() {
    return r'flightCrewRecordsCategoryFilterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FlightCrewRecordsCategoryFilter create() => FlightCrewRecordsCategoryFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlightCrewRecordsCategoryFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<FlightCrewRecordsCategoryFilterState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FlightCrewRecordsCategoryFilterProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$flightCrewRecordsCategoryFilterHash() =>
    r'daff433fbb8dd85e89dac9d9d441fde5996e3f6a';

final class FlightCrewRecordsCategoryFilterFamily extends $Family
    with
        $ClassFamilyOverride<
            FlightCrewRecordsCategoryFilter,
            FlightCrewRecordsCategoryFilterState,
            FlightCrewRecordsCategoryFilterState,
            FlightCrewRecordsCategoryFilterState,
            String> {
  const FlightCrewRecordsCategoryFilterFamily._()
      : super(
          retry: null,
          name: r'flightCrewRecordsCategoryFilterProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  FlightCrewRecordsCategoryFilterProvider call(
    String roleId,
  ) =>
      FlightCrewRecordsCategoryFilterProvider._(argument: roleId, from: this);

  @override
  String toString() => r'flightCrewRecordsCategoryFilterProvider';
}

abstract class _$FlightCrewRecordsCategoryFilter
    extends $Notifier<FlightCrewRecordsCategoryFilterState> {
  late final _$args = ref.$arg as String;
  String get roleId => _$args;

  FlightCrewRecordsCategoryFilterState build(
    String roleId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<FlightCrewRecordsCategoryFilterState,
        FlightCrewRecordsCategoryFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<FlightCrewRecordsCategoryFilterState,
            FlightCrewRecordsCategoryFilterState>,
        FlightCrewRecordsCategoryFilterState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
