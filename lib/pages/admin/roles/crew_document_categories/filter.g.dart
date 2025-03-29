// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flightCrewRecordsCategoryFilterHash() =>
    r'daff433fbb8dd85e89dac9d9d441fde5996e3f6a';

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

abstract class _$FlightCrewRecordsCategoryFilter
    extends BuildlessAutoDisposeNotifier<FlightCrewRecordsCategoryFilterState> {
  late final String roleId;

  FlightCrewRecordsCategoryFilterState build(
    String roleId,
  );
}

/// See also [FlightCrewRecordsCategoryFilter].
@ProviderFor(FlightCrewRecordsCategoryFilter)
const flightCrewRecordsCategoryFilterProvider =
    FlightCrewRecordsCategoryFilterFamily();

/// See also [FlightCrewRecordsCategoryFilter].
class FlightCrewRecordsCategoryFilterFamily
    extends Family<FlightCrewRecordsCategoryFilterState> {
  /// See also [FlightCrewRecordsCategoryFilter].
  const FlightCrewRecordsCategoryFilterFamily();

  /// See also [FlightCrewRecordsCategoryFilter].
  FlightCrewRecordsCategoryFilterProvider call(
    String roleId,
  ) {
    return FlightCrewRecordsCategoryFilterProvider(
      roleId,
    );
  }

  @override
  FlightCrewRecordsCategoryFilterProvider getProviderOverride(
    covariant FlightCrewRecordsCategoryFilterProvider provider,
  ) {
    return call(
      provider.roleId,
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
  String? get name => r'flightCrewRecordsCategoryFilterProvider';
}

/// See also [FlightCrewRecordsCategoryFilter].
class FlightCrewRecordsCategoryFilterProvider
    extends AutoDisposeNotifierProviderImpl<FlightCrewRecordsCategoryFilter,
        FlightCrewRecordsCategoryFilterState> {
  /// See also [FlightCrewRecordsCategoryFilter].
  FlightCrewRecordsCategoryFilterProvider(
    String roleId,
  ) : this._internal(
          () => FlightCrewRecordsCategoryFilter()..roleId = roleId,
          from: flightCrewRecordsCategoryFilterProvider,
          name: r'flightCrewRecordsCategoryFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$flightCrewRecordsCategoryFilterHash,
          dependencies: FlightCrewRecordsCategoryFilterFamily._dependencies,
          allTransitiveDependencies:
              FlightCrewRecordsCategoryFilterFamily._allTransitiveDependencies,
          roleId: roleId,
        );

  FlightCrewRecordsCategoryFilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roleId,
  }) : super.internal();

  final String roleId;

  @override
  FlightCrewRecordsCategoryFilterState runNotifierBuild(
    covariant FlightCrewRecordsCategoryFilter notifier,
  ) {
    return notifier.build(
      roleId,
    );
  }

  @override
  Override overrideWith(FlightCrewRecordsCategoryFilter Function() create) {
    return ProviderOverride(
      origin: this,
      override: FlightCrewRecordsCategoryFilterProvider._internal(
        () => create()..roleId = roleId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roleId: roleId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FlightCrewRecordsCategoryFilter,
      FlightCrewRecordsCategoryFilterState> createElement() {
    return _FlightCrewRecordsCategoryFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FlightCrewRecordsCategoryFilterProvider &&
        other.roleId == roleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FlightCrewRecordsCategoryFilterRef
    on AutoDisposeNotifierProviderRef<FlightCrewRecordsCategoryFilterState> {
  /// The parameter `roleId` of this provider.
  String get roleId;
}

class _FlightCrewRecordsCategoryFilterProviderElement
    extends AutoDisposeNotifierProviderElement<FlightCrewRecordsCategoryFilter,
        FlightCrewRecordsCategoryFilterState>
    with FlightCrewRecordsCategoryFilterRef {
  _FlightCrewRecordsCategoryFilterProviderElement(super.provider);

  @override
  String get roleId =>
      (origin as FlightCrewRecordsCategoryFilterProvider).roleId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
