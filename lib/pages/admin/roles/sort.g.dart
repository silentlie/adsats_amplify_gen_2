// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(RoleSort)
const roleSortProvider = RoleSortProvider._();

final class RoleSortProvider
    extends $NotifierProvider<RoleSort, RoleSortState> {
  const RoleSortProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'roleSortProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$roleSortHash();

  @$internal
  @override
  RoleSort create() => RoleSort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoleSortState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoleSortState>(value),
    );
  }
}

String _$roleSortHash() => r'84fabc59a263f49e5498be4575666429b8e37e45';

abstract class _$RoleSort extends $Notifier<RoleSortState> {
  RoleSortState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<RoleSortState, RoleSortState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<RoleSortState, RoleSortState>,
        RoleSortState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
