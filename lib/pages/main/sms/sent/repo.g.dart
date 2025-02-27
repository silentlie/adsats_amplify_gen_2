// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noticesSentRepoHash() => r'bff1de633e8f2b1e301bca0d8d376740d5428c26';

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

/// See also [noticesSentRepo].
@ProviderFor(noticesSentRepo)
const noticesSentRepoProvider = NoticesSentRepoFamily();

/// See also [noticesSentRepo].
class NoticesSentRepoFamily extends Family<AsyncValue<List<Notice>>> {
  /// See also [noticesSentRepo].
  const NoticesSentRepoFamily();

  /// See also [noticesSentRepo].
  NoticesSentRepoProvider call(
    NoticeFilterState filter,
  ) {
    return NoticesSentRepoProvider(
      filter,
    );
  }

  @override
  NoticesSentRepoProvider getProviderOverride(
    covariant NoticesSentRepoProvider provider,
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
  String? get name => r'noticesSentRepoProvider';
}

/// See also [noticesSentRepo].
class NoticesSentRepoProvider extends AutoDisposeFutureProvider<List<Notice>> {
  /// See also [noticesSentRepo].
  NoticesSentRepoProvider(
    NoticeFilterState filter,
  ) : this._internal(
          (ref) => noticesSentRepo(
            ref as NoticesSentRepoRef,
            filter,
          ),
          from: noticesSentRepoProvider,
          name: r'noticesSentRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$noticesSentRepoHash,
          dependencies: NoticesSentRepoFamily._dependencies,
          allTransitiveDependencies:
              NoticesSentRepoFamily._allTransitiveDependencies,
          filter: filter,
        );

  NoticesSentRepoProvider._internal(
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
    FutureOr<List<Notice>> Function(NoticesSentRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NoticesSentRepoProvider._internal(
        (ref) => create(ref as NoticesSentRepoRef),
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
    return _NoticesSentRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NoticesSentRepoProvider && other.filter == filter;
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
mixin NoticesSentRepoRef on AutoDisposeFutureProviderRef<List<Notice>> {
  /// The parameter `filter` of this provider.
  NoticeFilterState get filter;
}

class _NoticesSentRepoProviderElement
    extends AutoDisposeFutureProviderElement<List<Notice>>
    with NoticesSentRepoRef {
  _NoticesSentRepoProviderElement(super.provider);

  @override
  NoticeFilterState get filter => (origin as NoticesSentRepoProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
