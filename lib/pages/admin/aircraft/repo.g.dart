// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$aircraftRepoHash() => r'ffd5b5964bece8415ff0b56dbae0c923a5c0caf2';

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

/// See also [aircraftRepo].
@ProviderFor(aircraftRepo)
const aircraftRepoProvider = AircraftRepoFamily();

/// See also [aircraftRepo].
class AircraftRepoFamily extends Family<AsyncValue<List<Aircraft>>> {
  /// See also [aircraftRepo].
  const AircraftRepoFamily();

  /// See also [aircraftRepo].
  AircraftRepoProvider call(
    AircraftFilterState filter,
  ) {
    return AircraftRepoProvider(
      filter,
    );
  }

  @override
  AircraftRepoProvider getProviderOverride(
    covariant AircraftRepoProvider provider,
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
  String? get name => r'aircraftRepoProvider';
}

/// See also [aircraftRepo].
class AircraftRepoProvider extends AutoDisposeFutureProvider<List<Aircraft>> {
  /// See also [aircraftRepo].
  AircraftRepoProvider(
    AircraftFilterState filter,
  ) : this._internal(
          (ref) => aircraftRepo(
            ref as AircraftRepoRef,
            filter,
          ),
          from: aircraftRepoProvider,
          name: r'aircraftRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$aircraftRepoHash,
          dependencies: AircraftRepoFamily._dependencies,
          allTransitiveDependencies:
              AircraftRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  AircraftRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final AircraftFilterState filter;

  @override
  Override overrideWith(
    FutureOr<List<Aircraft>> Function(AircraftRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AircraftRepoProvider._internal(
        (ref) => create(ref as AircraftRepoRef),
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
  AutoDisposeFutureProviderElement<List<Aircraft>> createElement() {
    return _AircraftRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AircraftRepoProvider && other.filter == filter;
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
mixin AircraftRepoRef on AutoDisposeFutureProviderRef<List<Aircraft>> {
  /// The parameter `filter` of this provider.
  AircraftFilterState get filter;
}

class _AircraftRepoProviderElement
    extends AutoDisposeFutureProviderElement<List<Aircraft>>
    with AircraftRepoRef {
  _AircraftRepoProviderElement(super.provider);

  @override
  AircraftFilterState get filter => (origin as AircraftRepoProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
