// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listStaffHash() => r'f5bed1565d6be11bd43384babe67f0b357411c9b';

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
    QueryPredicate<Staff>? where,
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

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

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
    QueryPredicate<Staff>? where,
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

  final QueryPredicate<Staff>? where;

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
  QueryPredicate<Staff>? get where;
}

class _ListStaffProviderElement
    extends AutoDisposeFutureProviderElement<List<Staff>> with ListStaffRef {
  _ListStaffProviderElement(super.provider);

  @override
  QueryPredicate<Staff>? get where => (origin as ListStaffProvider).where;
}

String _$listDocumentsHash() => r'5ccfaf958a2f969087d44037a3614237684332c3';

/// See also [listDocuments].
@ProviderFor(listDocuments)
const listDocumentsProvider = ListDocumentsFamily();

/// See also [listDocuments].
class ListDocumentsFamily extends Family<AsyncValue<List<Document>>> {
  /// See also [listDocuments].
  const ListDocumentsFamily();

  /// See also [listDocuments].
  ListDocumentsProvider call([
    QueryPredicate<Document>? where,
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

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

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
    QueryPredicate<Document>? where,
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

  final QueryPredicate<Document>? where;

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
  QueryPredicate<Document>? get where;
}

class _ListDocumentsProviderElement
    extends AutoDisposeFutureProviderElement<List<Document>>
    with ListDocumentsRef {
  _ListDocumentsProviderElement(super.provider);

  @override
  QueryPredicate<Document>? get where =>
      (origin as ListDocumentsProvider).where;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
