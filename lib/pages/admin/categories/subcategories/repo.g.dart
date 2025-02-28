// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subcategoriesRepoHash() => r'3c044fc9e199e1ae65863a20d0dd85e1e9ca5aca';

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

/// See also [subcategoriesRepo].
@ProviderFor(subcategoriesRepo)
const subcategoriesRepoProvider = SubcategoriesRepoFamily();

/// See also [subcategoriesRepo].
class SubcategoriesRepoFamily extends Family<AsyncValue<Category>> {
  /// See also [subcategoriesRepo].
  const SubcategoriesRepoFamily();

  /// See also [subcategoriesRepo].
  SubcategoriesRepoProvider call(
    SubcategoryFilterState filter,
  ) {
    return SubcategoriesRepoProvider(
      filter,
    );
  }

  @override
  SubcategoriesRepoProvider getProviderOverride(
    covariant SubcategoriesRepoProvider provider,
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
  String? get name => r'subcategoriesRepoProvider';
}

/// See also [subcategoriesRepo].
class SubcategoriesRepoProvider extends AutoDisposeFutureProvider<Category> {
  /// See also [subcategoriesRepo].
  SubcategoriesRepoProvider(
    SubcategoryFilterState filter,
  ) : this._internal(
          (ref) => subcategoriesRepo(
            ref as SubcategoriesRepoRef,
            filter,
          ),
          from: subcategoriesRepoProvider,
          name: r'subcategoriesRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$subcategoriesRepoHash,
          dependencies: SubcategoriesRepoFamily._dependencies,
          allTransitiveDependencies:
              SubcategoriesRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  SubcategoriesRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final SubcategoryFilterState filter;

  @override
  Override overrideWith(
    FutureOr<Category> Function(SubcategoriesRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubcategoriesRepoProvider._internal(
        (ref) => create(ref as SubcategoriesRepoRef),
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
  AutoDisposeFutureProviderElement<Category> createElement() {
    return _SubcategoriesRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubcategoriesRepoProvider && other.filter == filter;
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
mixin SubcategoriesRepoRef on AutoDisposeFutureProviderRef<Category> {
  /// The parameter `filter` of this provider.
  SubcategoryFilterState get filter;
}

class _SubcategoriesRepoProviderElement
    extends AutoDisposeFutureProviderElement<Category>
    with SubcategoriesRepoRef {
  _SubcategoriesRepoProviderElement(super.provider);

  @override
  SubcategoryFilterState get filter =>
      (origin as SubcategoriesRepoProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
