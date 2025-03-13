// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$crewDocumentsRepoHash() => r'82008cdac322326f137b3e137a4bc38b3d1ca36c';

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

/// See also [crewDocumentsRepo].
@ProviderFor(crewDocumentsRepo)
const crewDocumentsRepoProvider = CrewDocumentsRepoFamily();

/// See also [crewDocumentsRepo].
class CrewDocumentsRepoFamily extends Family<AsyncValue<List<CrewDocument>>> {
  /// See also [crewDocumentsRepo].
  const CrewDocumentsRepoFamily();

  /// See also [crewDocumentsRepo].
  CrewDocumentsRepoProvider call(
    CrewDocumentFilterState filter,
  ) {
    return CrewDocumentsRepoProvider(
      filter,
    );
  }

  @override
  CrewDocumentsRepoProvider getProviderOverride(
    covariant CrewDocumentsRepoProvider provider,
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
  String? get name => r'crewDocumentsRepoProvider';
}

/// See also [crewDocumentsRepo].
class CrewDocumentsRepoProvider
    extends AutoDisposeFutureProvider<List<CrewDocument>> {
  /// See also [crewDocumentsRepo].
  CrewDocumentsRepoProvider(
    CrewDocumentFilterState filter,
  ) : this._internal(
          (ref) => crewDocumentsRepo(
            ref as CrewDocumentsRepoRef,
            filter,
          ),
          from: crewDocumentsRepoProvider,
          name: r'crewDocumentsRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$crewDocumentsRepoHash,
          dependencies: CrewDocumentsRepoFamily._dependencies,
          allTransitiveDependencies:
              CrewDocumentsRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  CrewDocumentsRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final CrewDocumentFilterState filter;

  @override
  Override overrideWith(
    FutureOr<List<CrewDocument>> Function(CrewDocumentsRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CrewDocumentsRepoProvider._internal(
        (ref) => create(ref as CrewDocumentsRepoRef),
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
  AutoDisposeFutureProviderElement<List<CrewDocument>> createElement() {
    return _CrewDocumentsRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CrewDocumentsRepoProvider && other.filter == filter;
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
mixin CrewDocumentsRepoRef on AutoDisposeFutureProviderRef<List<CrewDocument>> {
  /// The parameter `filter` of this provider.
  CrewDocumentFilterState get filter;
}

class _CrewDocumentsRepoProviderElement
    extends AutoDisposeFutureProviderElement<List<CrewDocument>>
    with CrewDocumentsRepoRef {
  _CrewDocumentsRepoProviderElement(super.provider);

  @override
  CrewDocumentFilterState get filter =>
      (origin as CrewDocumentsRepoProvider).filter;
}

String _$crewDocumentsMetaHash() => r'6fa635b12ff588c2ab20d93bccd0419a93b48ce2';

/// See also [crewDocumentsMeta].
@ProviderFor(crewDocumentsMeta)
final crewDocumentsMetaProvider =
    AutoDisposeFutureProvider<(Iterable<Aircraft>, Iterable<Role>)>.internal(
  crewDocumentsMeta,
  name: r'crewDocumentsMetaProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$crewDocumentsMetaHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CrewDocumentsMetaRef
    = AutoDisposeFutureProviderRef<(Iterable<Aircraft>, Iterable<Role>)>;
String _$listJoinStaffHash() => r'09433bd6994bce048a46465d310211e762e33036';

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
