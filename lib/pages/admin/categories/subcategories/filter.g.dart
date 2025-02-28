// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subcategoryFilterHash() => r'e9116be248e7405ffa2946dca4c7cfa236ffb0de';

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

abstract class _$SubcategoryFilter
    extends BuildlessAutoDisposeNotifier<SubcategoryFilterState> {
  late final String categoryId;

  SubcategoryFilterState build(
    String categoryId,
  );
}

/// See also [SubcategoryFilter].
@ProviderFor(SubcategoryFilter)
const subcategoryFilterProvider = SubcategoryFilterFamily();

/// See also [SubcategoryFilter].
class SubcategoryFilterFamily extends Family<SubcategoryFilterState> {
  /// See also [SubcategoryFilter].
  const SubcategoryFilterFamily();

  /// See also [SubcategoryFilter].
  SubcategoryFilterProvider call(
    String categoryId,
  ) {
    return SubcategoryFilterProvider(
      categoryId,
    );
  }

  @override
  SubcategoryFilterProvider getProviderOverride(
    covariant SubcategoryFilterProvider provider,
  ) {
    return call(
      provider.categoryId,
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
  String? get name => r'subcategoryFilterProvider';
}

/// See also [SubcategoryFilter].
class SubcategoryFilterProvider extends AutoDisposeNotifierProviderImpl<
    SubcategoryFilter, SubcategoryFilterState> {
  /// See also [SubcategoryFilter].
  SubcategoryFilterProvider(
    String categoryId,
  ) : this._internal(
          () => SubcategoryFilter()..categoryId = categoryId,
          from: subcategoryFilterProvider,
          name: r'subcategoryFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$subcategoryFilterHash,
          dependencies: SubcategoryFilterFamily._dependencies,
          allTransitiveDependencies:
              SubcategoryFilterFamily._allTransitiveDependencies,
          categoryId: categoryId,
        );

  SubcategoryFilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final String categoryId;

  @override
  SubcategoryFilterState runNotifierBuild(
    covariant SubcategoryFilter notifier,
  ) {
    return notifier.build(
      categoryId,
    );
  }

  @override
  Override overrideWith(SubcategoryFilter Function() create) {
    return ProviderOverride(
      origin: this,
      override: SubcategoryFilterProvider._internal(
        () => create()..categoryId = categoryId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SubcategoryFilter, SubcategoryFilterState>
      createElement() {
    return _SubcategoryFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubcategoryFilterProvider && other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SubcategoryFilterRef
    on AutoDisposeNotifierProviderRef<SubcategoryFilterState> {
  /// The parameter `categoryId` of this provider.
  String get categoryId;
}

class _SubcategoryFilterProviderElement
    extends AutoDisposeNotifierProviderElement<SubcategoryFilter,
        SubcategoryFilterState> with SubcategoryFilterRef {
  _SubcategoryFilterProviderElement(super.provider);

  @override
  String get categoryId => (origin as SubcategoryFilterProvider).categoryId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
