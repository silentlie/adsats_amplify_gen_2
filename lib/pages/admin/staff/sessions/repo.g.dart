// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sessionsRepoHash() => r'c1b173a68386d1da70b5147eba6336774e750b0a';

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

/// See also [sessionsRepo].
@ProviderFor(sessionsRepo)
const sessionsRepoProvider = SessionsRepoFamily();

/// See also [sessionsRepo].
class SessionsRepoFamily extends Family<AsyncValue<List<Session>>> {
  /// See also [sessionsRepo].
  const SessionsRepoFamily();

  /// See also [sessionsRepo].
  SessionsRepoProvider call(
    Staff staff,
  ) {
    return SessionsRepoProvider(
      staff,
    );
  }

  @override
  SessionsRepoProvider getProviderOverride(
    covariant SessionsRepoProvider provider,
  ) {
    return call(
      provider.staff,
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
  String? get name => r'sessionsRepoProvider';
}

/// See also [sessionsRepo].
class SessionsRepoProvider extends AutoDisposeFutureProvider<List<Session>> {
  /// See also [sessionsRepo].
  SessionsRepoProvider(
    Staff staff,
  ) : this._internal(
          (ref) => sessionsRepo(
            ref as SessionsRepoRef,
            staff,
          ),
          from: sessionsRepoProvider,
          name: r'sessionsRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sessionsRepoHash,
          dependencies: SessionsRepoFamily._dependencies,
          allTransitiveDependencies:
              SessionsRepoFamily._allTransitiveDependencies,
          staff: staff,
        );

  SessionsRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.staff,
  }) : super.internal();

  final Staff staff;

  @override
  Override overrideWith(
    FutureOr<List<Session>> Function(SessionsRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SessionsRepoProvider._internal(
        (ref) => create(ref as SessionsRepoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        staff: staff,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Session>> createElement() {
    return _SessionsRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionsRepoProvider && other.staff == staff;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, staff.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SessionsRepoRef on AutoDisposeFutureProviderRef<List<Session>> {
  /// The parameter `staff` of this provider.
  Staff get staff;
}

class _SessionsRepoProviderElement
    extends AutoDisposeFutureProviderElement<List<Session>>
    with SessionsRepoRef {
  _SessionsRepoProviderElement(super.provider);

  @override
  Staff get staff => (origin as SessionsRepoProvider).staff;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
