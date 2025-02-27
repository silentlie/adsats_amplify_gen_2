// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$documentFilterHash() => r'95fa40d7f0b9a0080422219bfbb592770cb33991';

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

abstract class _$DocumentFilter
    extends BuildlessAutoDisposeNotifier<DocumentFilterState> {
  late final Subcategory subcategory;

  DocumentFilterState build(
    Subcategory subcategory,
  );
}

/// See also [DocumentFilter].
@ProviderFor(DocumentFilter)
const documentFilterProvider = DocumentFilterFamily();

/// See also [DocumentFilter].
class DocumentFilterFamily extends Family<DocumentFilterState> {
  /// See also [DocumentFilter].
  const DocumentFilterFamily();

  /// See also [DocumentFilter].
  DocumentFilterProvider call(
    Subcategory subcategory,
  ) {
    return DocumentFilterProvider(
      subcategory,
    );
  }

  @override
  DocumentFilterProvider getProviderOverride(
    covariant DocumentFilterProvider provider,
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
  String? get name => r'documentFilterProvider';
}

/// See also [DocumentFilter].
class DocumentFilterProvider extends AutoDisposeNotifierProviderImpl<
    DocumentFilter, DocumentFilterState> {
  /// See also [DocumentFilter].
  DocumentFilterProvider(
    Subcategory subcategory,
  ) : this._internal(
          () => DocumentFilter()..subcategory = subcategory,
          from: documentFilterProvider,
          name: r'documentFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$documentFilterHash,
          dependencies: DocumentFilterFamily._dependencies,
          allTransitiveDependencies:
              DocumentFilterFamily._allTransitiveDependencies,
          subcategory: subcategory,
        );

  DocumentFilterProvider._internal(
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
  DocumentFilterState runNotifierBuild(
    covariant DocumentFilter notifier,
  ) {
    return notifier.build(
      subcategory,
    );
  }

  @override
  Override overrideWith(DocumentFilter Function() create) {
    return ProviderOverride(
      origin: this,
      override: DocumentFilterProvider._internal(
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
  AutoDisposeNotifierProviderElement<DocumentFilter, DocumentFilterState>
      createElement() {
    return _DocumentFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DocumentFilterProvider && other.subcategory == subcategory;
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
mixin DocumentFilterRef on AutoDisposeNotifierProviderRef<DocumentFilterState> {
  /// The parameter `subcategory` of this provider.
  Subcategory get subcategory;
}

class _DocumentFilterProviderElement extends AutoDisposeNotifierProviderElement<
    DocumentFilter, DocumentFilterState> with DocumentFilterRef {
  _DocumentFilterProviderElement(super.provider);

  @override
  Subcategory get subcategory => (origin as DocumentFilterProvider).subcategory;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
