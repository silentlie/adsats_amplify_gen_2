// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(FlightCrewRecordCategoriesFilter)
const flightCrewRecordCategoriesFilterProvider =
    FlightCrewRecordCategoriesFilterFamily._();

final class FlightCrewRecordCategoriesFilterProvider extends $NotifierProvider<
    FlightCrewRecordCategoriesFilter, FlightCrewRecordCategoriesFilterState> {
  const FlightCrewRecordCategoriesFilterProvider._(
      {required FlightCrewRecordCategoriesFilterFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'flightCrewRecordCategoriesFilterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$flightCrewRecordCategoriesFilterHash();

  @override
  String toString() {
    return r'flightCrewRecordCategoriesFilterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FlightCrewRecordCategoriesFilter create() =>
      FlightCrewRecordCategoriesFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlightCrewRecordCategoriesFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<FlightCrewRecordCategoriesFilterState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FlightCrewRecordCategoriesFilterProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$flightCrewRecordCategoriesFilterHash() =>
    r'4fa054735c5217f7e77c1127aa76092385d0f88a';

final class FlightCrewRecordCategoriesFilterFamily extends $Family
    with
        $ClassFamilyOverride<
            FlightCrewRecordCategoriesFilter,
            FlightCrewRecordCategoriesFilterState,
            FlightCrewRecordCategoriesFilterState,
            FlightCrewRecordCategoriesFilterState,
            String> {
  const FlightCrewRecordCategoriesFilterFamily._()
      : super(
          retry: null,
          name: r'flightCrewRecordCategoriesFilterProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FlightCrewRecordCategoriesFilterProvider call(
    String roleId,
  ) =>
      FlightCrewRecordCategoriesFilterProvider._(argument: roleId, from: this);

  @override
  String toString() => r'flightCrewRecordCategoriesFilterProvider';
}

abstract class _$FlightCrewRecordCategoriesFilter
    extends $Notifier<FlightCrewRecordCategoriesFilterState> {
  late final _$args = ref.$arg as String;
  String get roleId => _$args;

  FlightCrewRecordCategoriesFilterState build(
    String roleId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<FlightCrewRecordCategoriesFilterState,
        FlightCrewRecordCategoriesFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<FlightCrewRecordCategoriesFilterState,
            FlightCrewRecordCategoriesFilterState>,
        FlightCrewRecordCategoriesFilterState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
