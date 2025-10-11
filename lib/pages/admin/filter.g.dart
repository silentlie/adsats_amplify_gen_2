// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AdminFilter)
const adminFilterProvider = AdminFilterProvider._();

final class AdminFilterProvider
    extends $NotifierProvider<AdminFilter, AdminFilterState> {
  const AdminFilterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'adminFilterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$adminFilterHash();

  @$internal
  @override
  AdminFilter create() => AdminFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AdminFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AdminFilterState>(value),
    );
  }
}

String _$adminFilterHash() => r'9c19f325f4fabd0463fe48c9ac30c1e759bfa471';

abstract class _$AdminFilter extends $Notifier<AdminFilterState> {
  AdminFilterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AdminFilterState, AdminFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AdminFilterState, AdminFilterState>,
        AdminFilterState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
