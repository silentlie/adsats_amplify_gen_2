// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
          dependencies: null,
          $allTransitiveDependencies: null,
        );

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

String _$reportFilterHash() => r'1788ba07d8f4ac494e359afd1f82e88912451fc5';

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
