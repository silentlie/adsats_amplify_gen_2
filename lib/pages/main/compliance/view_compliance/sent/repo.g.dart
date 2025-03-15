// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportsSentRepoHash() => r'a784d206be019459a23af941befcfc1242d57445';

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

/// See also [reportsSentRepo].
@ProviderFor(reportsSentRepo)
const reportsSentRepoProvider = ReportsSentRepoFamily();

/// See also [reportsSentRepo].
class ReportsSentRepoFamily extends Family<AsyncValue<List<Report>>> {
  /// See also [reportsSentRepo].
  const ReportsSentRepoFamily();

  /// See also [reportsSentRepo].
  ReportsSentRepoProvider call(
    ReportFilterState filter,
  ) {
    return ReportsSentRepoProvider(
      filter,
    );
  }

  @override
  ReportsSentRepoProvider getProviderOverride(
    covariant ReportsSentRepoProvider provider,
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
  String? get name => r'reportsSentRepoProvider';
}

/// See also [reportsSentRepo].
class ReportsSentRepoProvider extends AutoDisposeFutureProvider<List<Report>> {
  /// See also [reportsSentRepo].
  ReportsSentRepoProvider(
    ReportFilterState filter,
  ) : this._internal(
          (ref) => reportsSentRepo(
            ref as ReportsSentRepoRef,
            filter,
          ),
          from: reportsSentRepoProvider,
          name: r'reportsSentRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reportsSentRepoHash,
          dependencies: ReportsSentRepoFamily._dependencies,
          allTransitiveDependencies:
              ReportsSentRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  ReportsSentRepoProvider._internal(
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
    FutureOr<List<Report>> Function(ReportsSentRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReportsSentRepoProvider._internal(
        (ref) => create(ref as ReportsSentRepoRef),
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
    return _ReportsSentRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReportsSentRepoProvider && other.filter == filter;
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
mixin ReportsSentRepoRef on AutoDisposeFutureProviderRef<List<Report>> {
  /// The parameter `filter` of this provider.
  ReportFilterState get filter;
}

class _ReportsSentRepoProviderElement
    extends AutoDisposeFutureProviderElement<List<Report>>
    with ReportsSentRepoRef {
  _ReportsSentRepoProviderElement(super.provider);

  @override
  ReportFilterState get filter => (origin as ReportsSentRepoProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
