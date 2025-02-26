// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$documentsRepoHash() => r'a2224d6d7835b744d58b0a7c46430856199f5a8f';

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

abstract class _$DocumentsRepo
    extends BuildlessAutoDisposeAsyncNotifier<List<Document>> {
  late final FilterState filter;

  FutureOr<List<Document>> build(
    FilterState filter,
  );
}

/// See also [DocumentsRepo].
@ProviderFor(DocumentsRepo)
const documentsRepoProvider = DocumentsRepoFamily();

/// See also [DocumentsRepo].
class DocumentsRepoFamily extends Family<AsyncValue<List<Document>>> {
  /// See also [DocumentsRepo].
  const DocumentsRepoFamily();

  /// See also [DocumentsRepo].
  DocumentsRepoProvider call(
    FilterState filter,
  ) {
    return DocumentsRepoProvider(
      filter,
    );
  }

  @override
  DocumentsRepoProvider getProviderOverride(
    covariant DocumentsRepoProvider provider,
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
  String? get name => r'documentsRepoProvider';
}

/// See also [DocumentsRepo].
class DocumentsRepoProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DocumentsRepo, List<Document>> {
  /// See also [DocumentsRepo].
  DocumentsRepoProvider(
    FilterState filter,
  ) : this._internal(
          () => DocumentsRepo()..filter = filter,
          from: documentsRepoProvider,
          name: r'documentsRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$documentsRepoHash,
          dependencies: DocumentsRepoFamily._dependencies,
          allTransitiveDependencies:
              DocumentsRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  DocumentsRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final FilterState filter;

  @override
  FutureOr<List<Document>> runNotifierBuild(
    covariant DocumentsRepo notifier,
  ) {
    return notifier.build(
      filter,
    );
  }

  @override
  Override overrideWith(DocumentsRepo Function() create) {
    return ProviderOverride(
      origin: this,
      override: DocumentsRepoProvider._internal(
        () => create()..filter = filter,
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
  AutoDisposeAsyncNotifierProviderElement<DocumentsRepo, List<Document>>
      createElement() {
    return _DocumentsRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DocumentsRepoProvider && other.filter == filter;
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
mixin DocumentsRepoRef on AutoDisposeAsyncNotifierProviderRef<List<Document>> {
  /// The parameter `filter` of this provider.
  FilterState get filter;
}

class _DocumentsRepoProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DocumentsRepo,
        List<Document>> with DocumentsRepoRef {
  _DocumentsRepoProviderElement(super.provider);

  @override
  FilterState get filter => (origin as DocumentsRepoProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
