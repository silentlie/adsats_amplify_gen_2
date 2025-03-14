// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noticesInboxRepoHash() => r'cb997a034097d8e5f0752d9d0387f3c6e80f6fd6';

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

/// See also [noticesInboxRepo].
@ProviderFor(noticesInboxRepo)
const noticesInboxRepoProvider = NoticesInboxRepoFamily();

/// See also [noticesInboxRepo].
class NoticesInboxRepoFamily extends Family<AsyncValue<List<Notice>>> {
  /// See also [noticesInboxRepo].
  const NoticesInboxRepoFamily();

  /// See also [noticesInboxRepo].
  NoticesInboxRepoProvider call(
    NoticeFilterState filter,
  ) {
    return NoticesInboxRepoProvider(
      filter,
    );
  }

  @override
  NoticesInboxRepoProvider getProviderOverride(
    covariant NoticesInboxRepoProvider provider,
  ) {
    return call(
      provider.filter,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    listNoticeStaffProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    listNoticeStaffProvider,
    ...?listNoticeStaffProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'noticesInboxRepoProvider';
}

/// See also [noticesInboxRepo].
class NoticesInboxRepoProvider extends AutoDisposeFutureProvider<List<Notice>> {
  /// See also [noticesInboxRepo].
  NoticesInboxRepoProvider(
    NoticeFilterState filter,
  ) : this._internal(
          (ref) => noticesInboxRepo(
            ref as NoticesInboxRepoRef,
            filter,
          ),
          from: noticesInboxRepoProvider,
          name: r'noticesInboxRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$noticesInboxRepoHash,
          dependencies: NoticesInboxRepoFamily._dependencies,
          allTransitiveDependencies:
              NoticesInboxRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  NoticesInboxRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final NoticeFilterState filter;

  @override
  Override overrideWith(
    FutureOr<List<Notice>> Function(NoticesInboxRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NoticesInboxRepoProvider._internal(
        (ref) => create(ref as NoticesInboxRepoRef),
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
  AutoDisposeFutureProviderElement<List<Notice>> createElement() {
    return _NoticesInboxRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NoticesInboxRepoProvider && other.filter == filter;
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
mixin NoticesInboxRepoRef on AutoDisposeFutureProviderRef<List<Notice>> {
  /// The parameter `filter` of this provider.
  NoticeFilterState get filter;
}

class _NoticesInboxRepoProviderElement
    extends AutoDisposeFutureProviderElement<List<Notice>>
    with NoticesInboxRepoRef {
  _NoticesInboxRepoProviderElement(super.provider);

  @override
  NoticeFilterState get filter => (origin as NoticesInboxRepoProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
