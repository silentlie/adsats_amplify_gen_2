// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$staffByRoleNameHash() => r'17c8873037db96189e4df888667e312df0472305';

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

/// See also [staffByRoleName].
@ProviderFor(staffByRoleName)
const staffByRoleNameProvider = StaffByRoleNameFamily();

/// See also [staffByRoleName].
class StaffByRoleNameFamily extends Family<AsyncValue<List<Staff>>> {
  /// See also [staffByRoleName].
  const StaffByRoleNameFamily();

  /// See also [staffByRoleName].
  StaffByRoleNameProvider call(
    String roleName,
  ) {
    return StaffByRoleNameProvider(
      roleName,
    );
  }

  @override
  StaffByRoleNameProvider getProviderOverride(
    covariant StaffByRoleNameProvider provider,
  ) {
    return call(
      provider.roleName,
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
  String? get name => r'staffByRoleNameProvider';
}

/// See also [staffByRoleName].
class StaffByRoleNameProvider extends AutoDisposeFutureProvider<List<Staff>> {
  /// See also [staffByRoleName].
  StaffByRoleNameProvider(
    String roleName,
  ) : this._internal(
          (ref) => staffByRoleName(
            ref as StaffByRoleNameRef,
            roleName,
          ),
          from: staffByRoleNameProvider,
          name: r'staffByRoleNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$staffByRoleNameHash,
          dependencies: StaffByRoleNameFamily._dependencies,
          allTransitiveDependencies:
              StaffByRoleNameFamily._allTransitiveDependencies,
          roleName: roleName,
        );

  StaffByRoleNameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roleName,
  }) : super.internal();

  final String roleName;

  @override
  Override overrideWith(
    FutureOr<List<Staff>> Function(StaffByRoleNameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StaffByRoleNameProvider._internal(
        (ref) => create(ref as StaffByRoleNameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roleName: roleName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Staff>> createElement() {
    return _StaffByRoleNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StaffByRoleNameProvider && other.roleName == roleName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roleName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StaffByRoleNameRef on AutoDisposeFutureProviderRef<List<Staff>> {
  /// The parameter `roleName` of this provider.
  String get roleName;
}

class _StaffByRoleNameProviderElement
    extends AutoDisposeFutureProviderElement<List<Staff>>
    with StaffByRoleNameRef {
  _StaffByRoleNameProviderElement(super.provider);

  @override
  String get roleName => (origin as StaffByRoleNameProvider).roleName;
}

String _$reportNotifierHash() => r'069ac13ccd5e689b8bfd47e40983d2bd46c770ef';

/// See also [ReportNotifier].
@ProviderFor(ReportNotifier)
final reportNotifierProvider =
    AutoDisposeNotifierProvider<ReportNotifier, ReportState>.internal(
  ReportNotifier.new,
  name: r'reportNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reportNotifierHash,
  dependencies: <ProviderOrFamily>[
    isQualityManagerProvider,
    userDetailsProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    isQualityManagerProvider,
    ...?isQualityManagerProvider.allTransitiveDependencies,
    userDetailsProvider,
    ...?userDetailsProvider.allTransitiveDependencies
  },
);

typedef _$ReportNotifier = AutoDisposeNotifier<ReportState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
