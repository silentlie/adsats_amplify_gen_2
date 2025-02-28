// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$staffRepoHash() => r'5fa86eb6ff2808fd958b9fb53d7fee26595ff2a9';

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

/// See also [staffRepo].
@ProviderFor(staffRepo)
const staffRepoProvider = StaffRepoFamily();

/// See also [staffRepo].
class StaffRepoFamily extends Family<AsyncValue<List<Staff>>> {
  /// See also [staffRepo].
  const StaffRepoFamily();

  /// See also [staffRepo].
  StaffRepoProvider call(
    AdminFilterState filter,
  ) {
    return StaffRepoProvider(
      filter,
    );
  }

  @override
  StaffRepoProvider getProviderOverride(
    covariant StaffRepoProvider provider,
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
  String? get name => r'staffRepoProvider';
}

/// See also [staffRepo].
class StaffRepoProvider extends AutoDisposeFutureProvider<List<Staff>> {
  /// See also [staffRepo].
  StaffRepoProvider(
    AdminFilterState filter,
  ) : this._internal(
          (ref) => staffRepo(
            ref as StaffRepoRef,
            filter,
          ),
          from: staffRepoProvider,
          name: r'staffRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$staffRepoHash,
          dependencies: StaffRepoFamily._dependencies,
          allTransitiveDependencies: StaffRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  StaffRepoProvider._internal(
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
    FutureOr<List<Staff>> Function(StaffRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StaffRepoProvider._internal(
        (ref) => create(ref as StaffRepoRef),
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
  AutoDisposeFutureProviderElement<List<Staff>> createElement() {
    return _StaffRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StaffRepoProvider && other.filter == filter;
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
mixin StaffRepoRef on AutoDisposeFutureProviderRef<List<Staff>> {
  /// The parameter `filter` of this provider.
  AdminFilterState get filter;
}

class _StaffRepoProviderElement
    extends AutoDisposeFutureProviderElement<List<Staff>> with StaffRepoRef {
  _StaffRepoProviderElement(super.provider);

  @override
  AdminFilterState get filter => (origin as StaffRepoProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
