// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportRepoHash() => r'79e39c23dec3191ae4629fa61ef06e0435856796';

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

/// See also [reportRepo].
@ProviderFor(reportRepo)
const reportRepoProvider = ReportRepoFamily();

/// See also [reportRepo].
class ReportRepoFamily extends Family<AsyncValue<Report>> {
  /// See also [reportRepo].
  const ReportRepoFamily();

  /// See also [reportRepo].
  ReportRepoProvider call(
    String id,
  ) {
    return ReportRepoProvider(
      id,
    );
  }

  @override
  ReportRepoProvider getProviderOverride(
    covariant ReportRepoProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'reportRepoProvider';
}

/// See also [reportRepo].
class ReportRepoProvider extends AutoDisposeFutureProvider<Report> {
  /// See also [reportRepo].
  ReportRepoProvider(
    String id,
  ) : this._internal(
          (ref) => reportRepo(
            ref as ReportRepoRef,
            id,
          ),
          from: reportRepoProvider,
          name: r'reportRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reportRepoHash,
          dependencies: ReportRepoFamily._dependencies,
          allTransitiveDependencies:
              ReportRepoFamily._allTransitiveDependencies,
          id: id,
        );

  ReportRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Report> Function(ReportRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReportRepoProvider._internal(
        (ref) => create(ref as ReportRepoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Report> createElement() {
    return _ReportRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReportRepoProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReportRepoRef on AutoDisposeFutureProviderRef<Report> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ReportRepoProviderElement
    extends AutoDisposeFutureProviderElement<Report> with ReportRepoRef {
  _ReportRepoProviderElement(super.provider);

  @override
  String get id => (origin as ReportRepoProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
