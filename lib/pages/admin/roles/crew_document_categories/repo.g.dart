// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$crewDocumentCategoriesRepoHash() =>
    r'd8403df3c66f983c7df55358244a62db464fce56';

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

/// See also [crewDocumentCategoriesRepo].
@ProviderFor(crewDocumentCategoriesRepo)
const crewDocumentCategoriesRepoProvider = CrewDocumentCategoriesRepoFamily();

/// See also [crewDocumentCategoriesRepo].
class CrewDocumentCategoriesRepoFamily extends Family<AsyncValue<Role>> {
  /// See also [crewDocumentCategoriesRepo].
  const CrewDocumentCategoriesRepoFamily();

  /// See also [crewDocumentCategoriesRepo].
  CrewDocumentCategoriesRepoProvider call(
    CrewDocumentCategoryFilterState filter,
  ) {
    return CrewDocumentCategoriesRepoProvider(
      filter,
    );
  }

  @override
  CrewDocumentCategoriesRepoProvider getProviderOverride(
    covariant CrewDocumentCategoriesRepoProvider provider,
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
  String? get name => r'crewDocumentCategoriesRepoProvider';
}

/// See also [crewDocumentCategoriesRepo].
class CrewDocumentCategoriesRepoProvider
    extends AutoDisposeFutureProvider<Role> {
  /// See also [crewDocumentCategoriesRepo].
  CrewDocumentCategoriesRepoProvider(
    CrewDocumentCategoryFilterState filter,
  ) : this._internal(
          (ref) => crewDocumentCategoriesRepo(
            ref as CrewDocumentCategoriesRepoRef,
            filter,
          ),
          from: crewDocumentCategoriesRepoProvider,
          name: r'crewDocumentCategoriesRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$crewDocumentCategoriesRepoHash,
          dependencies: CrewDocumentCategoriesRepoFamily._dependencies,
          allTransitiveDependencies:
              CrewDocumentCategoriesRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  CrewDocumentCategoriesRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final CrewDocumentCategoryFilterState filter;

  @override
  Override overrideWith(
    FutureOr<Role> Function(CrewDocumentCategoriesRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CrewDocumentCategoriesRepoProvider._internal(
        (ref) => create(ref as CrewDocumentCategoriesRepoRef),
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
    return _CrewDocumentCategoriesRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CrewDocumentCategoriesRepoProvider &&
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
mixin CrewDocumentCategoriesRepoRef on AutoDisposeFutureProviderRef<Role> {
  /// The parameter `filter` of this provider.
  CrewDocumentCategoryFilterState get filter;
}

class _CrewDocumentCategoriesRepoProviderElement
    extends AutoDisposeFutureProviderElement<Role>
    with CrewDocumentCategoriesRepoRef {
  _CrewDocumentCategoriesRepoProviderElement(super.provider);

  @override
  CrewDocumentCategoryFilterState get filter =>
      (origin as CrewDocumentCategoriesRepoProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
