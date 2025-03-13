// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$crewDocumentFilterHash() =>
    r'f15ca1b63b8f70d363b9fd58be173625c3d14b6e';

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

abstract class _$CrewDocumentFilter
    extends BuildlessAutoDisposeNotifier<CrewDocumentFilterState> {
  late final Staff staff;
  late final CrewDocumentCategory category;

  CrewDocumentFilterState build(
    Staff staff,
    CrewDocumentCategory category,
  );
}

/// See also [CrewDocumentFilter].
@ProviderFor(CrewDocumentFilter)
const crewDocumentFilterProvider = CrewDocumentFilterFamily();

/// See also [CrewDocumentFilter].
class CrewDocumentFilterFamily extends Family<CrewDocumentFilterState> {
  /// See also [CrewDocumentFilter].
  const CrewDocumentFilterFamily();

  /// See also [CrewDocumentFilter].
  CrewDocumentFilterProvider call(
    Staff staff,
    CrewDocumentCategory category,
  ) {
    return CrewDocumentFilterProvider(
      staff,
      category,
    );
  }

  @override
  CrewDocumentFilterProvider getProviderOverride(
    covariant CrewDocumentFilterProvider provider,
  ) {
    return call(
      provider.staff,
      provider.category,
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
  String? get name => r'crewDocumentFilterProvider';
}

/// See also [CrewDocumentFilter].
class CrewDocumentFilterProvider extends AutoDisposeNotifierProviderImpl<
    CrewDocumentFilter, CrewDocumentFilterState> {
  /// See also [CrewDocumentFilter].
  CrewDocumentFilterProvider(
    Staff staff,
    CrewDocumentCategory category,
  ) : this._internal(
          () => CrewDocumentFilter()
            ..staff = staff
            ..category = category,
          from: crewDocumentFilterProvider,
          name: r'crewDocumentFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$crewDocumentFilterHash,
          dependencies: CrewDocumentFilterFamily._dependencies,
          allTransitiveDependencies:
              CrewDocumentFilterFamily._allTransitiveDependencies,
          staff: staff,
          category: category,
        );

  CrewDocumentFilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.staff,
    required this.category,
  }) : super.internal();

  final Staff staff;
  final CrewDocumentCategory category;

  @override
  CrewDocumentFilterState runNotifierBuild(
    covariant CrewDocumentFilter notifier,
  ) {
    return notifier.build(
      staff,
      category,
    );
  }

  @override
  Override overrideWith(CrewDocumentFilter Function() create) {
    return ProviderOverride(
      origin: this,
      override: CrewDocumentFilterProvider._internal(
        () => create()
          ..staff = staff
          ..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        staff: staff,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CrewDocumentFilter,
      CrewDocumentFilterState> createElement() {
    return _CrewDocumentFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CrewDocumentFilterProvider &&
        other.staff == staff &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, staff.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CrewDocumentFilterRef
    on AutoDisposeNotifierProviderRef<CrewDocumentFilterState> {
  /// The parameter `staff` of this provider.
  Staff get staff;

  /// The parameter `category` of this provider.
  CrewDocumentCategory get category;
}

class _CrewDocumentFilterProviderElement
    extends AutoDisposeNotifierProviderElement<CrewDocumentFilter,
        CrewDocumentFilterState> with CrewDocumentFilterRef {
  _CrewDocumentFilterProviderElement(super.provider);

  @override
  Staff get staff => (origin as CrewDocumentFilterProvider).staff;
  @override
  CrewDocumentCategory get category =>
      (origin as CrewDocumentFilterProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
