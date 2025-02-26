// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filterHash() => r'5573d79f3a3ecb9c23c53b42a2ec9c82227ccbcf';

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

abstract class _$Filter extends BuildlessAutoDisposeNotifier<FilterState> {
  late final Subcategory subcategory;

  FilterState build(
    Subcategory subcategory,
  );
}

/// See also [Filter].
@ProviderFor(Filter)
const filterProvider = FilterFamily();

/// See also [Filter].
class FilterFamily extends Family<FilterState> {
  /// See also [Filter].
  const FilterFamily();

  /// See also [Filter].
  FilterProvider call(
    Subcategory subcategory,
  ) {
    return FilterProvider(
      subcategory,
    );
  }

  @override
  FilterProvider getProviderOverride(
    covariant FilterProvider provider,
  ) {
    return call(
      provider.subcategory,
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
  String? get name => r'filterProvider';
}

/// See also [Filter].
class FilterProvider
    extends AutoDisposeNotifierProviderImpl<Filter, FilterState> {
  /// See also [Filter].
  FilterProvider(
    Subcategory subcategory,
  ) : this._internal(
          () => Filter()..subcategory = subcategory,
          from: filterProvider,
          name: r'filterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filterHash,
          dependencies: FilterFamily._dependencies,
          allTransitiveDependencies: FilterFamily._allTransitiveDependencies,
          subcategory: subcategory,
        );

  FilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.subcategory,
  }) : super.internal();

  final Subcategory subcategory;

  @override
  FilterState runNotifierBuild(
    covariant Filter notifier,
  ) {
    return notifier.build(
      subcategory,
    );
  }

  @override
  Override overrideWith(Filter Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilterProvider._internal(
        () => create()..subcategory = subcategory,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        subcategory: subcategory,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<Filter, FilterState> createElement() {
    return _FilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilterProvider && other.subcategory == subcategory;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subcategory.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilterRef on AutoDisposeNotifierProviderRef<FilterState> {
  /// The parameter `subcategory` of this provider.
  Subcategory get subcategory;
}

class _FilterProviderElement
    extends AutoDisposeNotifierProviderElement<Filter, FilterState>
    with FilterRef {
  _FilterProviderElement(super.provider);

  @override
  Subcategory get subcategory => (origin as FilterProvider).subcategory;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
