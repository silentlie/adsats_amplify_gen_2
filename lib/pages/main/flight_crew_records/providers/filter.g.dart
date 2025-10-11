// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FlightCrewRecordFilter)
const flightCrewRecordFilterProvider = FlightCrewRecordFilterFamily._();

final class FlightCrewRecordFilterProvider extends $NotifierProvider<
    FlightCrewRecordFilter, FlightCrewRecordFilterState> {
  const FlightCrewRecordFilterProvider._(
      {required FlightCrewRecordFilterFamily super.from,
      required (
        Staff,
        FlightCrewRecordCategory,
      )
          super.argument})
      : super(
          retry: null,
          name: r'flightCrewRecordFilterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$flightCrewRecordFilterHash();

  @override
  String toString() {
    return r'flightCrewRecordFilterProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  FlightCrewRecordFilter create() => FlightCrewRecordFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlightCrewRecordFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlightCrewRecordFilterState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FlightCrewRecordFilterProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$flightCrewRecordFilterHash() =>
    r'9e3af7e1a884f0a2e8541774d6bf63eef5c195f0';

final class FlightCrewRecordFilterFamily extends $Family
    with
        $ClassFamilyOverride<
            FlightCrewRecordFilter,
            FlightCrewRecordFilterState,
            FlightCrewRecordFilterState,
            FlightCrewRecordFilterState,
            (
              Staff,
              FlightCrewRecordCategory,
            )> {
  const FlightCrewRecordFilterFamily._()
      : super(
          retry: null,
          name: r'flightCrewRecordFilterProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FlightCrewRecordFilterProvider call(
    Staff staff,
    FlightCrewRecordCategory category,
  ) =>
      FlightCrewRecordFilterProvider._(argument: (
        staff,
        category,
      ), from: this);

  @override
  String toString() => r'flightCrewRecordFilterProvider';
}

abstract class _$FlightCrewRecordFilter
    extends $Notifier<FlightCrewRecordFilterState> {
  late final _$args = ref.$arg as (
    Staff,
    FlightCrewRecordCategory,
  );
  Staff get staff => _$args.$1;
  FlightCrewRecordCategory get category => _$args.$2;

  FlightCrewRecordFilterState build(
    Staff staff,
    FlightCrewRecordCategory category,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args.$1,
      _$args.$2,
    );
    final ref = this.ref
        as $Ref<FlightCrewRecordFilterState, FlightCrewRecordFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<FlightCrewRecordFilterState, FlightCrewRecordFilterState>,
        FlightCrewRecordFilterState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
