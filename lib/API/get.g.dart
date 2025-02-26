// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getNoticeHash() => r'e68c25c527faf21005d607be5f8300c0a4dfbe57';

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

/// See also [getNotice].
@ProviderFor(getNotice)
const getNoticeProvider = GetNoticeFamily();

/// See also [getNotice].
class GetNoticeFamily extends Family<AsyncValue<Notice>> {
  /// See also [getNotice].
  const GetNoticeFamily();

  /// See also [getNotice].
  GetNoticeProvider call(
    ModelIdentifier<Notice> modelIdentifier,
  ) {
    return GetNoticeProvider(
      modelIdentifier,
    );
  }

  @override
  GetNoticeProvider getProviderOverride(
    covariant GetNoticeProvider provider,
  ) {
    return call(
      provider.modelIdentifier,
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
  String? get name => r'getNoticeProvider';
}

/// See also [getNotice].
class GetNoticeProvider extends AutoDisposeFutureProvider<Notice> {
  /// See also [getNotice].
  GetNoticeProvider(
    ModelIdentifier<Notice> modelIdentifier,
  ) : this._internal(
          (ref) => getNotice(
            ref as GetNoticeRef,
            modelIdentifier,
          ),
          from: getNoticeProvider,
          name: r'getNoticeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNoticeHash,
          dependencies: GetNoticeFamily._dependencies,
          allTransitiveDependencies: GetNoticeFamily._allTransitiveDependencies,
          modelIdentifier: modelIdentifier,
        );

  GetNoticeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.modelIdentifier,
  }) : super.internal();

  final ModelIdentifier<Notice> modelIdentifier;

  @override
  Override overrideWith(
    FutureOr<Notice> Function(GetNoticeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetNoticeProvider._internal(
        (ref) => create(ref as GetNoticeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        modelIdentifier: modelIdentifier,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Notice> createElement() {
    return _GetNoticeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetNoticeProvider &&
        other.modelIdentifier == modelIdentifier;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, modelIdentifier.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetNoticeRef on AutoDisposeFutureProviderRef<Notice> {
  /// The parameter `modelIdentifier` of this provider.
  ModelIdentifier<Notice> get modelIdentifier;
}

class _GetNoticeProviderElement extends AutoDisposeFutureProviderElement<Notice>
    with GetNoticeRef {
  _GetNoticeProviderElement(super.provider);

  @override
  ModelIdentifier<Notice> get modelIdentifier =>
      (origin as GetNoticeProvider).modelIdentifier;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
