// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ReportFilter)
const reportFilterProvider = ReportFilterProvider._();

final class ReportFilterProvider
    extends $NotifierProvider<ReportFilter, ReportFilterState> {
  const ReportFilterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'reportFilterProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[userDetailsProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            ReportFilterProvider.$allTransitiveDependencies0,
            ReportFilterProvider.$allTransitiveDependencies1,
          ],
        );

  static const $allTransitiveDependencies0 = userDetailsProvider;
  static const $allTransitiveDependencies1 =
      UserDetailsProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$reportFilterHash();

  @$internal
  @override
  ReportFilter create() => ReportFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportFilterState>(value),
    );
  }
}

String _$reportFilterHash() => r'7ccb1d1b5198a0f69e655b1faddd3e9217e81a3c';

abstract class _$ReportFilter extends $Notifier<ReportFilterState> {
  ReportFilterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ReportFilterState, ReportFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ReportFilterState, ReportFilterState>,
        ReportFilterState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
