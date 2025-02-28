// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rolesRepoHash() => r'b31d31bca8be9313f28178d7bb1c22d2b7b199a0';

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

/// See also [rolesRepo].
@ProviderFor(rolesRepo)
const rolesRepoProvider = RolesRepoFamily();

/// See also [rolesRepo].
class RolesRepoFamily extends Family<AsyncValue<List<Role>>> {
  /// See also [rolesRepo].
  const RolesRepoFamily();

  /// See also [rolesRepo].
  RolesRepoProvider call(
    AdminFilterState filter,
  ) {
    return RolesRepoProvider(
      filter,
    );
  }

  @override
  RolesRepoProvider getProviderOverride(
    covariant RolesRepoProvider provider,
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
  String? get name => r'rolesRepoProvider';
}

/// See also [rolesRepo].
class RolesRepoProvider extends AutoDisposeFutureProvider<List<Role>> {
  /// See also [rolesRepo].
  RolesRepoProvider(
    AdminFilterState filter,
  ) : this._internal(
          (ref) => rolesRepo(
            ref as RolesRepoRef,
            filter,
          ),
          from: rolesRepoProvider,
          name: r'rolesRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rolesRepoHash,
          dependencies: RolesRepoFamily._dependencies,
          allTransitiveDependencies: RolesRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  RolesRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final AdminFilterState filter;

  @override
  Override overrideWith(
    FutureOr<List<Role>> Function(RolesRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RolesRepoProvider._internal(
        (ref) => create(ref as RolesRepoRef),
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
  AutoDisposeFutureProviderElement<List<Role>> createElement() {
    return _RolesRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RolesRepoProvider && other.filter == filter;
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
mixin RolesRepoRef on AutoDisposeFutureProviderRef<List<Role>> {
  /// The parameter `filter` of this provider.
  AdminFilterState get filter;
}

class _RolesRepoProviderElement
    extends AutoDisposeFutureProviderElement<List<Role>> with RolesRepoRef {
  _RolesRepoProviderElement(super.provider);

  @override
  AdminFilterState get filter => (origin as RolesRepoProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
