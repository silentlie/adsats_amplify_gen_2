// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flightCrewRecordFilterHash() =>
    r'c8c130209ab95724f9c52068053f3427de57dcaa';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FlightCrewRecordFilter
    extends BuildlessAutoDisposeNotifier<FlightCrewRecordFilterState> {
  late final Staff staff;
  late final FlightCrewRecordCategory category;

  FlightCrewRecordFilterState build(
    Staff staff,
    FlightCrewRecordCategory category,
  );
}

/// See also [FlightCrewRecordFilter].
@ProviderFor(FlightCrewRecordFilter)
const flightCrewRecordFilterProvider = FlightCrewRecordFilterFamily();

/// See also [FlightCrewRecordFilter].
class FlightCrewRecordFilterFamily extends Family<FlightCrewRecordFilterState> {
  /// See also [FlightCrewRecordFilter].
  const FlightCrewRecordFilterFamily();

  /// See also [FlightCrewRecordFilter].
  FlightCrewRecordFilterProvider call(
    Staff staff,
    FlightCrewRecordCategory category,
  ) {
    return FlightCrewRecordFilterProvider(
      staff,
      category,
    );
  }

  @override
  FlightCrewRecordFilterProvider getProviderOverride(
    covariant FlightCrewRecordFilterProvider provider,
  ) {
    return call(
      provider.staff,
      provider.category,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies =
      const <ProviderOrFamily>[];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      const <ProviderOrFamily>{};

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'flightCrewRecordFilterProvider';
}

/// See also [FlightCrewRecordFilter].
class FlightCrewRecordFilterProvider extends AutoDisposeNotifierProviderImpl<
    FlightCrewRecordFilter, FlightCrewRecordFilterState> {
  /// See also [FlightCrewRecordFilter].
  FlightCrewRecordFilterProvider(
    Staff staff,
    FlightCrewRecordCategory category,
  ) : this._internal(
          () => FlightCrewRecordFilter()
            ..staff = staff
            ..category = category,
          from: flightCrewRecordFilterProvider,
          name: r'flightCrewRecordFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$flightCrewRecordFilterHash,
          dependencies: FlightCrewRecordFilterFamily._dependencies,
          allTransitiveDependencies:
              FlightCrewRecordFilterFamily._allTransitiveDependencies,
          staff: staff,
          category: category,
        );

  FlightCrewRecordFilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.staff,
    required this.category,
  }) : super.internal();

  final Staff staff;
  final FlightCrewRecordCategory category;

  @override
  FlightCrewRecordFilterState runNotifierBuild(
    covariant FlightCrewRecordFilter notifier,
  ) {
    return notifier.build(
      staff,
      category,
    );
  }

  @override
  Override overrideWith(FlightCrewRecordFilter Function() create) {
    return ProviderOverride(
      origin: this,
      override: FlightCrewRecordFilterProvider._internal(
        () => create()
          ..staff = staff
          ..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        staff: staff,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FlightCrewRecordFilter,
      FlightCrewRecordFilterState> createElement() {
    return _FlightCrewRecordFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FlightCrewRecordFilterProvider &&
        other.staff == staff &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, staff.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FlightCrewRecordFilterRef
    on AutoDisposeNotifierProviderRef<FlightCrewRecordFilterState> {
  /// The parameter `staff` of this provider.
  Staff get staff;

  /// The parameter `category` of this provider.
  FlightCrewRecordCategory get category;
}

class _FlightCrewRecordFilterProviderElement
    extends AutoDisposeNotifierProviderElement<FlightCrewRecordFilter,
        FlightCrewRecordFilterState> with FlightCrewRecordFilterRef {
  _FlightCrewRecordFilterProviderElement(super.provider);

  @override
  Staff get staff => (origin as FlightCrewRecordFilterProvider).staff;
  @override
  FlightCrewRecordCategory get category =>
      (origin as FlightCrewRecordFilterProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
