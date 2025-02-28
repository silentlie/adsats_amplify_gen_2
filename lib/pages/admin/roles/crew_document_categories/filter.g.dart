// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$crewDocumentCategoryFilterHash() =>
    r'de817df2666d7daee07a31281da17c29a050c6aa';

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

abstract class _$CrewDocumentCategoryFilter
    extends BuildlessAutoDisposeNotifier<CrewDocumentCategoryFilterState> {
  late final String roleId;

  CrewDocumentCategoryFilterState build(
    String roleId,
  );
}

/// See also [CrewDocumentCategoryFilter].
@ProviderFor(CrewDocumentCategoryFilter)
const crewDocumentCategoryFilterProvider = CrewDocumentCategoryFilterFamily();

/// See also [CrewDocumentCategoryFilter].
class CrewDocumentCategoryFilterFamily
    extends Family<CrewDocumentCategoryFilterState> {
  /// See also [CrewDocumentCategoryFilter].
  const CrewDocumentCategoryFilterFamily();

  /// See also [CrewDocumentCategoryFilter].
  CrewDocumentCategoryFilterProvider call(
    String roleId,
  ) {
    return CrewDocumentCategoryFilterProvider(
      roleId,
    );
  }

  @override
  CrewDocumentCategoryFilterProvider getProviderOverride(
    covariant CrewDocumentCategoryFilterProvider provider,
  ) {
    return call(
      provider.roleId,
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
  String? get name => r'crewDocumentCategoryFilterProvider';
}

/// See also [CrewDocumentCategoryFilter].
class CrewDocumentCategoryFilterProvider
    extends AutoDisposeNotifierProviderImpl<CrewDocumentCategoryFilter,
        CrewDocumentCategoryFilterState> {
  /// See also [CrewDocumentCategoryFilter].
  CrewDocumentCategoryFilterProvider(
    String roleId,
  ) : this._internal(
          () => CrewDocumentCategoryFilter()..roleId = roleId,
          from: crewDocumentCategoryFilterProvider,
          name: r'crewDocumentCategoryFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$crewDocumentCategoryFilterHash,
          dependencies: CrewDocumentCategoryFilterFamily._dependencies,
          allTransitiveDependencies:
              CrewDocumentCategoryFilterFamily._allTransitiveDependencies,
          roleId: roleId,
        );

  CrewDocumentCategoryFilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roleId,
  }) : super.internal();

  final String roleId;

  @override
  CrewDocumentCategoryFilterState runNotifierBuild(
    covariant CrewDocumentCategoryFilter notifier,
  ) {
    return notifier.build(
      roleId,
    );
  }

  @override
  Override overrideWith(CrewDocumentCategoryFilter Function() create) {
    return ProviderOverride(
      origin: this,
      override: CrewDocumentCategoryFilterProvider._internal(
        () => create()..roleId = roleId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roleId: roleId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CrewDocumentCategoryFilter,
      CrewDocumentCategoryFilterState> createElement() {
    return _CrewDocumentCategoryFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CrewDocumentCategoryFilterProvider &&
        other.roleId == roleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CrewDocumentCategoryFilterRef
    on AutoDisposeNotifierProviderRef<CrewDocumentCategoryFilterState> {
  /// The parameter `roleId` of this provider.
  String get roleId;
}

class _CrewDocumentCategoryFilterProviderElement
    extends AutoDisposeNotifierProviderElement<CrewDocumentCategoryFilter,
        CrewDocumentCategoryFilterState> with CrewDocumentCategoryFilterRef {
  _CrewDocumentCategoryFilterProviderElement(super.provider);

  @override
  String get roleId => (origin as CrewDocumentCategoryFilterProvider).roleId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
