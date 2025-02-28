// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesRepoHash() => r'bbc0016a626fbb6741e04dae6615ccecb2601a84';

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

/// See also [categoriesRepo].
@ProviderFor(categoriesRepo)
const categoriesRepoProvider = CategoriesRepoFamily();

/// See also [categoriesRepo].
class CategoriesRepoFamily extends Family<AsyncValue<List<Category>>> {
  /// See also [categoriesRepo].
  const CategoriesRepoFamily();

  /// See also [categoriesRepo].
  CategoriesRepoProvider call(
    AdminFilterState filter,
  ) {
    return CategoriesRepoProvider(
      filter,
    );
  }

  @override
  CategoriesRepoProvider getProviderOverride(
    covariant CategoriesRepoProvider provider,
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
  String? get name => r'categoriesRepoProvider';
}

/// See also [categoriesRepo].
class CategoriesRepoProvider extends AutoDisposeFutureProvider<List<Category>> {
  /// See also [categoriesRepo].
  CategoriesRepoProvider(
    AdminFilterState filter,
  ) : this._internal(
          (ref) => categoriesRepo(
            ref as CategoriesRepoRef,
            filter,
          ),
          from: categoriesRepoProvider,
          name: r'categoriesRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoriesRepoHash,
          dependencies: CategoriesRepoFamily._dependencies,
          allTransitiveDependencies:
              CategoriesRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  CategoriesRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final AdminFilterState filter;

  @override
  Override overrideWith(
    FutureOr<List<Category>> Function(CategoriesRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoriesRepoProvider._internal(
        (ref) => create(ref as CategoriesRepoRef),
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
  AutoDisposeFutureProviderElement<List<Category>> createElement() {
    return _CategoriesRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoriesRepoProvider && other.filter == filter;
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
mixin CategoriesRepoRef on AutoDisposeFutureProviderRef<List<Category>> {
  /// The parameter `filter` of this provider.
  AdminFilterState get filter;
}

class _CategoriesRepoProviderElement
    extends AutoDisposeFutureProviderElement<List<Category>>
    with CategoriesRepoRef {
  _CategoriesRepoProviderElement(super.provider);

  @override
  AdminFilterState get filter => (origin as CategoriesRepoProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
