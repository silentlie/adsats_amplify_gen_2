// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noticeRepoHash() => r'f118cbebf51f0c881909b837f61e7e1897d6c634';

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

/// See also [noticeRepo].
@ProviderFor(noticeRepo)
const noticeRepoProvider = NoticeRepoFamily();

/// See also [noticeRepo].
class NoticeRepoFamily extends Family<AsyncValue<Notice>> {
  /// See also [noticeRepo].
  const NoticeRepoFamily();

  /// See also [noticeRepo].
  NoticeRepoProvider call(
    String id,
  ) {
    return NoticeRepoProvider(
      id,
    );
  }

  @override
  NoticeRepoProvider getProviderOverride(
    covariant NoticeRepoProvider provider,
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
  String? get name => r'noticeRepoProvider';
}

/// See also [noticeRepo].
class NoticeRepoProvider extends AutoDisposeFutureProvider<Notice> {
  /// See also [noticeRepo].
  NoticeRepoProvider(
    String id,
  ) : this._internal(
          (ref) => noticeRepo(
            ref as NoticeRepoRef,
            id,
          ),
          from: noticeRepoProvider,
          name: r'noticeRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$noticeRepoHash,
          dependencies: NoticeRepoFamily._dependencies,
          allTransitiveDependencies:
              NoticeRepoFamily._allTransitiveDependencies,
          id: id,
        );

  NoticeRepoProvider._internal(
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
    FutureOr<Notice> Function(NoticeRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NoticeRepoProvider._internal(
        (ref) => create(ref as NoticeRepoRef),
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
  AutoDisposeFutureProviderElement<Notice> createElement() {
    return _NoticeRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NoticeRepoProvider && other.id == id;
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
mixin NoticeRepoRef on AutoDisposeFutureProviderRef<Notice> {
  /// The parameter `id` of this provider.
  String get id;
}

class _NoticeRepoProviderElement
    extends AutoDisposeFutureProviderElement<Notice> with NoticeRepoRef {
  _NoticeRepoProviderElement(super.provider);

  @override
  String get id => (origin as NoticeRepoProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
