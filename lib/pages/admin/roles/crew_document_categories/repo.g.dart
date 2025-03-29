// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flightCrewRecordsCategoriesRepoHash() =>
    r'4a601dcc4eacde134eeeb265b0bc4284fff0dcda';

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

/// See also [flightCrewRecordsCategoriesRepo].
@ProviderFor(flightCrewRecordsCategoriesRepo)
const flightCrewRecordsCategoriesRepoProvider =
    FlightCrewRecordsCategoriesRepoFamily();

/// See also [flightCrewRecordsCategoriesRepo].
class FlightCrewRecordsCategoriesRepoFamily extends Family<AsyncValue<Role>> {
  /// See also [flightCrewRecordsCategoriesRepo].
  const FlightCrewRecordsCategoriesRepoFamily();

  /// See also [flightCrewRecordsCategoriesRepo].
  FlightCrewRecordsCategoriesRepoProvider call(
    FlightCrewRecordsCategoryFilterState filter,
  ) {
    return FlightCrewRecordsCategoriesRepoProvider(
      filter,
    );
  }

  @override
  FlightCrewRecordsCategoriesRepoProvider getProviderOverride(
    covariant FlightCrewRecordsCategoriesRepoProvider provider,
  ) {
    return call(
      provider.filter,
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
  String? get name => r'flightCrewRecordsCategoriesRepoProvider';
}

/// See also [flightCrewRecordsCategoriesRepo].
class FlightCrewRecordsCategoriesRepoProvider
    extends AutoDisposeFutureProvider<Role> {
  /// See also [flightCrewRecordsCategoriesRepo].
  FlightCrewRecordsCategoriesRepoProvider(
    FlightCrewRecordsCategoryFilterState filter,
  ) : this._internal(
          (ref) => flightCrewRecordsCategoriesRepo(
            ref as FlightCrewRecordsCategoriesRepoRef,
            filter,
          ),
          from: flightCrewRecordsCategoriesRepoProvider,
          name: r'flightCrewRecordsCategoriesRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$flightCrewRecordsCategoriesRepoHash,
          dependencies: FlightCrewRecordsCategoriesRepoFamily._dependencies,
          allTransitiveDependencies:
              FlightCrewRecordsCategoriesRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  FlightCrewRecordsCategoriesRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final FlightCrewRecordsCategoryFilterState filter;

  @override
  Override overrideWith(
    FutureOr<Role> Function(FlightCrewRecordsCategoriesRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FlightCrewRecordsCategoriesRepoProvider._internal(
        (ref) => create(ref as FlightCrewRecordsCategoriesRepoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Role> createElement() {
    return _FlightCrewRecordsCategoriesRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FlightCrewRecordsCategoriesRepoProvider &&
        other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FlightCrewRecordsCategoriesRepoRef on AutoDisposeFutureProviderRef<Role> {
  /// The parameter `filter` of this provider.
  FlightCrewRecordsCategoryFilterState get filter;
}

class _FlightCrewRecordsCategoriesRepoProviderElement
    extends AutoDisposeFutureProviderElement<Role>
    with FlightCrewRecordsCategoriesRepoRef {
  _FlightCrewRecordsCategoriesRepoProviderElement(super.provider);

  @override
  FlightCrewRecordsCategoryFilterState get filter =>
      (origin as FlightCrewRecordsCategoriesRepoProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
