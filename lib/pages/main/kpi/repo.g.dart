// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$staffKPIRepoHash() => r'6d883f3bf2443459a118f8aeb7544be02a5a3f03';

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

/// See also [staffKPIRepo].
@ProviderFor(staffKPIRepo)
const staffKPIRepoProvider = StaffKPIRepoFamily();

/// See also [staffKPIRepo].
class StaffKPIRepoFamily extends Family<AsyncValue<List<StaffKPI>>> {
  /// See also [staffKPIRepo].
  const StaffKPIRepoFamily();

  /// See also [staffKPIRepo].
  StaffKPIRepoProvider call(
    StaffKPIFilterState filter,
  ) {
    return StaffKPIRepoProvider(
      filter,
    );
  }

  @override
  StaffKPIRepoProvider getProviderOverride(
    covariant StaffKPIRepoProvider provider,
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
  String? get name => r'staffKPIRepoProvider';
}

/// See also [staffKPIRepo].
class StaffKPIRepoProvider extends AutoDisposeFutureProvider<List<StaffKPI>> {
  /// See also [staffKPIRepo].
  StaffKPIRepoProvider(
    StaffKPIFilterState filter,
  ) : this._internal(
          (ref) => staffKPIRepo(
            ref as StaffKPIRepoRef,
            filter,
          ),
          from: staffKPIRepoProvider,
          name: r'staffKPIRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$staffKPIRepoHash,
          dependencies: StaffKPIRepoFamily._dependencies,
          allTransitiveDependencies:
              StaffKPIRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  StaffKPIRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final StaffKPIFilterState filter;

  @override
  Override overrideWith(
    FutureOr<List<StaffKPI>> Function(StaffKPIRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StaffKPIRepoProvider._internal(
        (ref) => create(ref as StaffKPIRepoRef),
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
  AutoDisposeFutureProviderElement<List<StaffKPI>> createElement() {
    return _StaffKPIRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StaffKPIRepoProvider && other.filter == filter;
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
mixin StaffKPIRepoRef on AutoDisposeFutureProviderRef<List<StaffKPI>> {
  /// The parameter `filter` of this provider.
  StaffKPIFilterState get filter;
}

class _StaffKPIRepoProviderElement
    extends AutoDisposeFutureProviderElement<List<StaffKPI>>
    with StaffKPIRepoRef {
  _StaffKPIRepoProviderElement(super.provider);

  @override
  StaffKPIFilterState get filter => (origin as StaffKPIRepoProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
