// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportsInboxRepoHash() => r'656cf3f61d7c6026e2df81b76008750a82315e13';

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

/// See also [reportsInboxRepo].
@ProviderFor(reportsInboxRepo)
const reportsInboxRepoProvider = ReportsInboxRepoFamily();

/// See also [reportsInboxRepo].
class ReportsInboxRepoFamily extends Family<AsyncValue<List<Report>>> {
  /// See also [reportsInboxRepo].
  const ReportsInboxRepoFamily();

  /// See also [reportsInboxRepo].
  ReportsInboxRepoProvider call(
    ReportFilterState filter,
  ) {
    return ReportsInboxRepoProvider(
      filter,
    );
  }

  @override
  ReportsInboxRepoProvider getProviderOverride(
    covariant ReportsInboxRepoProvider provider,
  ) {
    return call(
      provider.filter,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    listReportStaffProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    listReportStaffProvider,
    ...?listReportStaffProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'reportsInboxRepoProvider';
}

/// See also [reportsInboxRepo].
class ReportsInboxRepoProvider extends AutoDisposeFutureProvider<List<Report>> {
  /// See also [reportsInboxRepo].
  ReportsInboxRepoProvider(
    ReportFilterState filter,
  ) : this._internal(
          (ref) => reportsInboxRepo(
            ref as ReportsInboxRepoRef,
            filter,
          ),
          from: reportsInboxRepoProvider,
          name: r'reportsInboxRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reportsInboxRepoHash,
          dependencies: ReportsInboxRepoFamily._dependencies,
          allTransitiveDependencies:
              ReportsInboxRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  ReportsInboxRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final ReportFilterState filter;

  @override
  Override overrideWith(
    FutureOr<List<Report>> Function(ReportsInboxRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReportsInboxRepoProvider._internal(
        (ref) => create(ref as ReportsInboxRepoRef),
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
  AutoDisposeFutureProviderElement<List<Report>> createElement() {
    return _ReportsInboxRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReportsInboxRepoProvider && other.filter == filter;
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
mixin ReportsInboxRepoRef on AutoDisposeFutureProviderRef<List<Report>> {
  /// The parameter `filter` of this provider.
  ReportFilterState get filter;
}

class _ReportsInboxRepoProviderElement
    extends AutoDisposeFutureProviderElement<List<Report>>
    with ReportsInboxRepoRef {
  _ReportsInboxRepoProviderElement(super.provider);

  @override
  ReportFilterState get filter => (origin as ReportsInboxRepoProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
