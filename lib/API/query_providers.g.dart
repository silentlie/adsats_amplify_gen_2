// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listStaffHash() => r'6269ce3e05ac16293962bdc8302f8d5f2e8f6a9a';

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

/// See also [listStaff].
@ProviderFor(listStaff)
const listStaffProvider = ListStaffFamily();

/// See also [listStaff].
class ListStaffFamily extends Family<AsyncValue<List<Staff>>> {
  /// See also [listStaff].
  const ListStaffFamily();

  /// See also [listStaff].
  ListStaffProvider call([
    QueryPredicate<Model>? where,
  ]) {
    return ListStaffProvider(
      where,
    );
  }

  @override
  ListStaffProvider getProviderOverride(
    covariant ListStaffProvider provider,
  ) {
    return call(
      provider.where,
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
  String? get name => r'listStaffProvider';
}

/// See also [listStaff].
class ListStaffProvider extends AutoDisposeFutureProvider<List<Staff>> {
  /// See also [listStaff].
  ListStaffProvider([
    QueryPredicate<Model>? where,
  ]) : this._internal(
          (ref) => listStaff(
            ref as ListStaffRef,
            where,
          ),
          from: listStaffProvider,
          name: r'listStaffProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listStaffHash,
          dependencies: ListStaffFamily._dependencies,
          allTransitiveDependencies: ListStaffFamily._allTransitiveDependencies,
          where: where,
        );

  ListStaffProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.where,
  }) : super.internal();

  final QueryPredicate<Model>? where;

  @override
  Override overrideWith(
    FutureOr<List<Staff>> Function(ListStaffRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListStaffProvider._internal(
        (ref) => create(ref as ListStaffRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        where: where,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Staff>> createElement() {
    return _ListStaffProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListStaffProvider && other.where == where;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, where.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListStaffRef on AutoDisposeFutureProviderRef<List<Staff>> {
  /// The parameter `where` of this provider.
  QueryPredicate<Model>? get where;
}

class _ListStaffProviderElement
    extends AutoDisposeFutureProviderElement<List<Staff>> with ListStaffRef {
  _ListStaffProviderElement(super.provider);

  @override
  QueryPredicate<Model>? get where => (origin as ListStaffProvider).where;
}

String _$listNoticesHash() => r'4b44b92433835e58547a0572a9082542a11de0b8';

/// See also [listNotices].
@ProviderFor(listNotices)
const listNoticesProvider = ListNoticesFamily();

/// See also [listNotices].
class ListNoticesFamily extends Family<AsyncValue<List<Notice>>> {
  /// See also [listNotices].
  const ListNoticesFamily();

  /// See also [listNotices].
  ListNoticesProvider call([
    QueryPredicate<Model>? where,
  ]) {
    return ListNoticesProvider(
      where,
    );
  }

  @override
  ListNoticesProvider getProviderOverride(
    covariant ListNoticesProvider provider,
  ) {
    return call(
      provider.where,
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
  String? get name => r'listNoticesProvider';
}

/// See also [listNotices].
class ListNoticesProvider extends AutoDisposeFutureProvider<List<Notice>> {
  /// See also [listNotices].
  ListNoticesProvider([
    QueryPredicate<Model>? where,
  ]) : this._internal(
          (ref) => listNotices(
            ref as ListNoticesRef,
            where,
          ),
          from: listNoticesProvider,
          name: r'listNoticesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listNoticesHash,
          dependencies: ListNoticesFamily._dependencies,
          allTransitiveDependencies:
              ListNoticesFamily._allTransitiveDependencies,
          where: where,
        );

  ListNoticesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.where,
  }) : super.internal();

  final QueryPredicate<Model>? where;

  @override
  Override overrideWith(
    FutureOr<List<Notice>> Function(ListNoticesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListNoticesProvider._internal(
        (ref) => create(ref as ListNoticesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        where: where,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Notice>> createElement() {
    return _ListNoticesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListNoticesProvider && other.where == where;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, where.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListNoticesRef on AutoDisposeFutureProviderRef<List<Notice>> {
  /// The parameter `where` of this provider.
  QueryPredicate<Model>? get where;
}

class _ListNoticesProviderElement
    extends AutoDisposeFutureProviderElement<List<Notice>> with ListNoticesRef {
  _ListNoticesProviderElement(super.provider);

  @override
  QueryPredicate<Model>? get where => (origin as ListNoticesProvider).where;
}

String _$listAircraftHash() => r'e9e2a962b7c0b316834b5cb3c0e9b5e45cb56e7e';

/// See also [listAircraft].
@ProviderFor(listAircraft)
const listAircraftProvider = ListAircraftFamily();

/// See also [listAircraft].
class ListAircraftFamily extends Family<AsyncValue<List<Aircraft>>> {
  /// See also [listAircraft].
  const ListAircraftFamily();

  /// See also [listAircraft].
  ListAircraftProvider call([
    QueryPredicate<Model>? where,
  ]) {
    return ListAircraftProvider(
      where,
    );
  }

  @override
  ListAircraftProvider getProviderOverride(
    covariant ListAircraftProvider provider,
  ) {
    return call(
      provider.where,
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
  String? get name => r'listAircraftProvider';
}

/// See also [listAircraft].
class ListAircraftProvider extends AutoDisposeFutureProvider<List<Aircraft>> {
  /// See also [listAircraft].
  ListAircraftProvider([
    QueryPredicate<Model>? where,
  ]) : this._internal(
          (ref) => listAircraft(
            ref as ListAircraftRef,
            where,
          ),
          from: listAircraftProvider,
          name: r'listAircraftProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listAircraftHash,
          dependencies: ListAircraftFamily._dependencies,
          allTransitiveDependencies:
              ListAircraftFamily._allTransitiveDependencies,
          where: where,
        );

  ListAircraftProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.where,
  }) : super.internal();

  final QueryPredicate<Model>? where;

  @override
  Override overrideWith(
    FutureOr<List<Aircraft>> Function(ListAircraftRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListAircraftProvider._internal(
        (ref) => create(ref as ListAircraftRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        where: where,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Aircraft>> createElement() {
    return _ListAircraftProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListAircraftProvider && other.where == where;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, where.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListAircraftRef on AutoDisposeFutureProviderRef<List<Aircraft>> {
  /// The parameter `where` of this provider.
  QueryPredicate<Model>? get where;
}

class _ListAircraftProviderElement
    extends AutoDisposeFutureProviderElement<List<Aircraft>>
    with ListAircraftRef {
  _ListAircraftProviderElement(super.provider);

  @override
  QueryPredicate<Model>? get where => (origin as ListAircraftProvider).where;
}

String _$listRolesHash() => r'61544f5ded5fbb6d8e0affac00c36b5909b969ac';

/// See also [listRoles].
@ProviderFor(listRoles)
const listRolesProvider = ListRolesFamily();

/// See also [listRoles].
class ListRolesFamily extends Family<AsyncValue<List<Role>>> {
  /// See also [listRoles].
  const ListRolesFamily();

  /// See also [listRoles].
  ListRolesProvider call([
    QueryPredicate<Model>? where,
  ]) {
    return ListRolesProvider(
      where,
    );
  }

  @override
  ListRolesProvider getProviderOverride(
    covariant ListRolesProvider provider,
  ) {
    return call(
      provider.where,
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
  String? get name => r'listRolesProvider';
}

/// See also [listRoles].
class ListRolesProvider extends AutoDisposeFutureProvider<List<Role>> {
  /// See also [listRoles].
  ListRolesProvider([
    QueryPredicate<Model>? where,
  ]) : this._internal(
          (ref) => listRoles(
            ref as ListRolesRef,
            where,
          ),
          from: listRolesProvider,
          name: r'listRolesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listRolesHash,
          dependencies: ListRolesFamily._dependencies,
          allTransitiveDependencies: ListRolesFamily._allTransitiveDependencies,
          where: where,
        );

  ListRolesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.where,
  }) : super.internal();

  final QueryPredicate<Model>? where;

  @override
  Override overrideWith(
    FutureOr<List<Role>> Function(ListRolesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListRolesProvider._internal(
        (ref) => create(ref as ListRolesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        where: where,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Role>> createElement() {
    return _ListRolesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListRolesProvider && other.where == where;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, where.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListRolesRef on AutoDisposeFutureProviderRef<List<Role>> {
  /// The parameter `where` of this provider.
  QueryPredicate<Model>? get where;
}

class _ListRolesProviderElement
    extends AutoDisposeFutureProviderElement<List<Role>> with ListRolesRef {
  _ListRolesProviderElement(super.provider);

  @override
  QueryPredicate<Model>? get where => (origin as ListRolesProvider).where;
}

String _$listSubcategoriesHash() => r'47c1dcfeb0e4f0836010d5bacf2b9164c46d324b';

/// See also [listSubcategories].
@ProviderFor(listSubcategories)
const listSubcategoriesProvider = ListSubcategoriesFamily();

/// See also [listSubcategories].
class ListSubcategoriesFamily extends Family<AsyncValue<List<Subcategory>>> {
  /// See also [listSubcategories].
  const ListSubcategoriesFamily();

  /// See also [listSubcategories].
  ListSubcategoriesProvider call([
    QueryPredicate<Model>? where,
  ]) {
    return ListSubcategoriesProvider(
      where,
    );
  }

  @override
  ListSubcategoriesProvider getProviderOverride(
    covariant ListSubcategoriesProvider provider,
  ) {
    return call(
      provider.where,
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
  String? get name => r'listSubcategoriesProvider';
}

/// See also [listSubcategories].
class ListSubcategoriesProvider
    extends AutoDisposeFutureProvider<List<Subcategory>> {
  /// See also [listSubcategories].
  ListSubcategoriesProvider([
    QueryPredicate<Model>? where,
  ]) : this._internal(
          (ref) => listSubcategories(
            ref as ListSubcategoriesRef,
            where,
          ),
          from: listSubcategoriesProvider,
          name: r'listSubcategoriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listSubcategoriesHash,
          dependencies: ListSubcategoriesFamily._dependencies,
          allTransitiveDependencies:
              ListSubcategoriesFamily._allTransitiveDependencies,
          where: where,
        );

  ListSubcategoriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.where,
  }) : super.internal();

  final QueryPredicate<Model>? where;

  @override
  Override overrideWith(
    FutureOr<List<Subcategory>> Function(ListSubcategoriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListSubcategoriesProvider._internal(
        (ref) => create(ref as ListSubcategoriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        where: where,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Subcategory>> createElement() {
    return _ListSubcategoriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListSubcategoriesProvider && other.where == where;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, where.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListSubcategoriesRef on AutoDisposeFutureProviderRef<List<Subcategory>> {
  /// The parameter `where` of this provider.
  QueryPredicate<Model>? get where;
}

class _ListSubcategoriesProviderElement
    extends AutoDisposeFutureProviderElement<List<Subcategory>>
    with ListSubcategoriesRef {
  _ListSubcategoriesProviderElement(super.provider);

  @override
  QueryPredicate<Model>? get where =>
      (origin as ListSubcategoriesProvider).where;
}

String _$listNoticeStaffHash() => r'a02e5240c4f7bac5e556248d137a3be5e5747877';

/// See also [listNoticeStaff].
@ProviderFor(listNoticeStaff)
const listNoticeStaffProvider = ListNoticeStaffFamily();

/// See also [listNoticeStaff].
class ListNoticeStaffFamily extends Family<AsyncValue<List<NoticeStaff>>> {
  /// See also [listNoticeStaff].
  const ListNoticeStaffFamily();

  /// See also [listNoticeStaff].
  ListNoticeStaffProvider call([
    QueryPredicate<Model>? where,
  ]) {
    return ListNoticeStaffProvider(
      where,
    );
  }

  @override
  ListNoticeStaffProvider getProviderOverride(
    covariant ListNoticeStaffProvider provider,
  ) {
    return call(
      provider.where,
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
  String? get name => r'listNoticeStaffProvider';
}

/// See also [listNoticeStaff].
class ListNoticeStaffProvider
    extends AutoDisposeFutureProvider<List<NoticeStaff>> {
  /// See also [listNoticeStaff].
  ListNoticeStaffProvider([
    QueryPredicate<Model>? where,
  ]) : this._internal(
          (ref) => listNoticeStaff(
            ref as ListNoticeStaffRef,
            where,
          ),
          from: listNoticeStaffProvider,
          name: r'listNoticeStaffProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listNoticeStaffHash,
          dependencies: ListNoticeStaffFamily._dependencies,
          allTransitiveDependencies:
              ListNoticeStaffFamily._allTransitiveDependencies,
          where: where,
        );

  ListNoticeStaffProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.where,
  }) : super.internal();

  final QueryPredicate<Model>? where;

  @override
  Override overrideWith(
    FutureOr<List<NoticeStaff>> Function(ListNoticeStaffRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListNoticeStaffProvider._internal(
        (ref) => create(ref as ListNoticeStaffRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        where: where,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<NoticeStaff>> createElement() {
    return _ListNoticeStaffProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListNoticeStaffProvider && other.where == where;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, where.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListNoticeStaffRef on AutoDisposeFutureProviderRef<List<NoticeStaff>> {
  /// The parameter `where` of this provider.
  QueryPredicate<Model>? get where;
}

class _ListNoticeStaffProviderElement
    extends AutoDisposeFutureProviderElement<List<NoticeStaff>>
    with ListNoticeStaffRef {
  _ListNoticeStaffProviderElement(super.provider);

  @override
  QueryPredicate<Model>? get where => (origin as ListNoticeStaffProvider).where;
}

String _$listDocumentsHash() => r'91cd9ce0a6491dbe49a50e68f028c1ae75d135fc';

/// See also [listDocuments].
@ProviderFor(listDocuments)
const listDocumentsProvider = ListDocumentsFamily();

/// See also [listDocuments].
class ListDocumentsFamily extends Family<AsyncValue<List<Document>>> {
  /// See also [listDocuments].
  const ListDocumentsFamily();

  /// See also [listDocuments].
  ListDocumentsProvider call([
    QueryPredicate<Model>? where,
  ]) {
    return ListDocumentsProvider(
      where,
    );
  }

  @override
  ListDocumentsProvider getProviderOverride(
    covariant ListDocumentsProvider provider,
  ) {
    return call(
      provider.where,
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
  String? get name => r'listDocumentsProvider';
}

/// See also [listDocuments].
class ListDocumentsProvider extends AutoDisposeFutureProvider<List<Document>> {
  /// See also [listDocuments].
  ListDocumentsProvider([
    QueryPredicate<Model>? where,
  ]) : this._internal(
          (ref) => listDocuments(
            ref as ListDocumentsRef,
            where,
          ),
          from: listDocumentsProvider,
          name: r'listDocumentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listDocumentsHash,
          dependencies: ListDocumentsFamily._dependencies,
          allTransitiveDependencies:
              ListDocumentsFamily._allTransitiveDependencies,
          where: where,
        );

  ListDocumentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.where,
  }) : super.internal();

  final QueryPredicate<Model>? where;

  @override
  Override overrideWith(
    FutureOr<List<Document>> Function(ListDocumentsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListDocumentsProvider._internal(
        (ref) => create(ref as ListDocumentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        where: where,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Document>> createElement() {
    return _ListDocumentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListDocumentsProvider && other.where == where;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, where.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListDocumentsRef on AutoDisposeFutureProviderRef<List<Document>> {
  /// The parameter `where` of this provider.
  QueryPredicate<Model>? get where;
}

class _ListDocumentsProviderElement
    extends AutoDisposeFutureProviderElement<List<Document>>
    with ListDocumentsRef {
  _ListDocumentsProviderElement(super.provider);

  @override
  QueryPredicate<Model>? get where => (origin as ListDocumentsProvider).where;
}

String _$getNoticeHash() => r'4bb57efeda25eab8b39bc41f7b18f0e29918312f';

/// See also [getNotice].
@ProviderFor(getNotice)
const getNoticeProvider = GetNoticeFamily();

/// See also [getNotice].
class GetNoticeFamily extends Family<AsyncValue<Notice>> {
  /// See also [getNotice].
  const GetNoticeFamily();

  /// See also [getNotice].
  GetNoticeProvider call(
    ModelIdentifier<Notice> modelIdentifier,
  ) {
    return GetNoticeProvider(
      modelIdentifier,
    );
  }

  @override
  GetNoticeProvider getProviderOverride(
    covariant GetNoticeProvider provider,
  ) {
    return call(
      provider.modelIdentifier,
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
  String? get name => r'getNoticeProvider';
}

/// See also [getNotice].
class GetNoticeProvider extends AutoDisposeFutureProvider<Notice> {
  /// See also [getNotice].
  GetNoticeProvider(
    ModelIdentifier<Notice> modelIdentifier,
  ) : this._internal(
          (ref) => getNotice(
            ref as GetNoticeRef,
            modelIdentifier,
          ),
          from: getNoticeProvider,
          name: r'getNoticeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNoticeHash,
          dependencies: GetNoticeFamily._dependencies,
          allTransitiveDependencies: GetNoticeFamily._allTransitiveDependencies,
          modelIdentifier: modelIdentifier,
        );

  GetNoticeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.modelIdentifier,
  }) : super.internal();

  final ModelIdentifier<Notice> modelIdentifier;

  @override
  Override overrideWith(
    FutureOr<Notice> Function(GetNoticeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetNoticeProvider._internal(
        (ref) => create(ref as GetNoticeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        modelIdentifier: modelIdentifier,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Notice> createElement() {
    return _GetNoticeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetNoticeProvider &&
        other.modelIdentifier == modelIdentifier;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, modelIdentifier.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetNoticeRef on AutoDisposeFutureProviderRef<Notice> {
  /// The parameter `modelIdentifier` of this provider.
  ModelIdentifier<Notice> get modelIdentifier;
}

class _GetNoticeProviderElement extends AutoDisposeFutureProviderElement<Notice>
    with GetNoticeRef {
  _GetNoticeProviderElement(super.provider);

  @override
  ModelIdentifier<Notice> get modelIdentifier =>
      (origin as GetNoticeProvider).modelIdentifier;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
