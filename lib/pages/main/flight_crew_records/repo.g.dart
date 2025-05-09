// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flightCrewRecordsRepoHash() =>
    r'40c7d90b2cc7b664b829b91d17b8e95a5ac753d2';

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

/// See also [flightCrewRecordsRepo].
@ProviderFor(flightCrewRecordsRepo)
const flightCrewRecordsRepoProvider = FlightCrewRecordsRepoFamily();

/// See also [flightCrewRecordsRepo].
class FlightCrewRecordsRepoFamily
    extends Family<AsyncValue<List<FlightCrewRecord>>> {
  /// See also [flightCrewRecordsRepo].
  const FlightCrewRecordsRepoFamily();

  /// See also [flightCrewRecordsRepo].
  FlightCrewRecordsRepoProvider call(
    FlightCrewRecordFilterState filter,
  ) {
    return FlightCrewRecordsRepoProvider(
      filter,
    );
  }

  @override
  FlightCrewRecordsRepoProvider getProviderOverride(
    covariant FlightCrewRecordsRepoProvider provider,
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
  String? get name => r'flightCrewRecordsRepoProvider';
}

/// See also [flightCrewRecordsRepo].
class FlightCrewRecordsRepoProvider
    extends AutoDisposeFutureProvider<List<FlightCrewRecord>> {
  /// See also [flightCrewRecordsRepo].
  FlightCrewRecordsRepoProvider(
    FlightCrewRecordFilterState filter,
  ) : this._internal(
          (ref) => flightCrewRecordsRepo(
            ref as FlightCrewRecordsRepoRef,
            filter,
          ),
          from: flightCrewRecordsRepoProvider,
          name: r'flightCrewRecordsRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$flightCrewRecordsRepoHash,
          dependencies: FlightCrewRecordsRepoFamily._dependencies,
          allTransitiveDependencies:
              FlightCrewRecordsRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  FlightCrewRecordsRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final FlightCrewRecordFilterState filter;

  @override
  Override overrideWith(
    FutureOr<List<FlightCrewRecord>> Function(FlightCrewRecordsRepoRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FlightCrewRecordsRepoProvider._internal(
        (ref) => create(ref as FlightCrewRecordsRepoRef),
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
  AutoDisposeFutureProviderElement<List<FlightCrewRecord>> createElement() {
    return _FlightCrewRecordsRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FlightCrewRecordsRepoProvider && other.filter == filter;
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
mixin FlightCrewRecordsRepoRef
    on AutoDisposeFutureProviderRef<List<FlightCrewRecord>> {
  /// The parameter `filter` of this provider.
  FlightCrewRecordFilterState get filter;
}

class _FlightCrewRecordsRepoProviderElement
    extends AutoDisposeFutureProviderElement<List<FlightCrewRecord>>
    with FlightCrewRecordsRepoRef {
  _FlightCrewRecordsRepoProviderElement(super.provider);

  @override
  FlightCrewRecordFilterState get filter =>
      (origin as FlightCrewRecordsRepoProvider).filter;
}

String _$flightCrewRecordsMetaHash() =>
    r'e224d28dce8fea55195a821307c3115804e7c030';

/// See also [flightCrewRecordsMeta].
@ProviderFor(flightCrewRecordsMeta)
final flightCrewRecordsMetaProvider =
    AutoDisposeFutureProvider<(Iterable<Aircraft>, Iterable<Role>)>.internal(
  flightCrewRecordsMeta,
  name: r'flightCrewRecordsMetaProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flightCrewRecordsMetaHash,
  dependencies: <ProviderOrFamily>[userDetailsProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    userDetailsProvider,
    ...?userDetailsProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FlightCrewRecordsMetaRef
    = AutoDisposeFutureProviderRef<(Iterable<Aircraft>, Iterable<Role>)>;
String _$listJoinStaffHash() => r'c89875fef6688c520359c87a4e47fd7a603b85fa';

/// See also [listJoinStaff].
@ProviderFor(listJoinStaff)
const listJoinStaffProvider = ListJoinStaffFamily();

/// See also [listJoinStaff].
class ListJoinStaffFamily extends Family<AsyncValue<Iterable<Staff>>> {
  /// See also [listJoinStaff].
  const ListJoinStaffFamily();

  /// See also [listJoinStaff].
  ListJoinStaffProvider call(
    Aircraft aircraft,
    Role role,
  ) {
    return ListJoinStaffProvider(
      aircraft,
      role,
    );
  }

  @override
  ListJoinStaffProvider getProviderOverride(
    covariant ListJoinStaffProvider provider,
  ) {
    return call(
      provider.aircraft,
      provider.role,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'listJoinStaffProvider';
}

/// See also [listJoinStaff].
class ListJoinStaffProvider extends AutoDisposeFutureProvider<Iterable<Staff>> {
  /// See also [listJoinStaff].
  ListJoinStaffProvider(
    Aircraft aircraft,
    Role role,
  ) : this._internal(
          (ref) => listJoinStaff(
            ref as ListJoinStaffRef,
            aircraft,
            role,
          ),
          from: listJoinStaffProvider,
          name: r'listJoinStaffProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listJoinStaffHash,
          dependencies: ListJoinStaffFamily._dependencies,
          allTransitiveDependencies:
              ListJoinStaffFamily._allTransitiveDependencies,
          aircraft: aircraft,
          role: role,
        );

  ListJoinStaffProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.aircraft,
    required this.role,
  }) : super.internal();

  final Aircraft aircraft;
  final Role role;

  @override
  Override overrideWith(
    FutureOr<Iterable<Staff>> Function(ListJoinStaffRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListJoinStaffProvider._internal(
        (ref) => create(ref as ListJoinStaffRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        aircraft: aircraft,
        role: role,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Iterable<Staff>> createElement() {
    return _ListJoinStaffProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListJoinStaffProvider &&
        other.aircraft == aircraft &&
        other.role == role;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, aircraft.hashCode);
    hash = _SystemHash.combine(hash, role.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListJoinStaffRef on AutoDisposeFutureProviderRef<Iterable<Staff>> {
  /// The parameter `aircraft` of this provider.
  Aircraft get aircraft;

  /// The parameter `role` of this provider.
  Role get role;
}

class _ListJoinStaffProviderElement
    extends AutoDisposeFutureProviderElement<Iterable<Staff>>
    with ListJoinStaffRef {
  _ListJoinStaffProviderElement(super.provider);

  @override
  Aircraft get aircraft => (origin as ListJoinStaffProvider).aircraft;
  @override
  Role get role => (origin as ListJoinStaffProvider).role;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
