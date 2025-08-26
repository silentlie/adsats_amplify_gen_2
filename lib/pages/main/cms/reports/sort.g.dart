// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ReportSort)
const reportSortProvider = ReportSortProvider._();

final class ReportSortProvider
    extends $NotifierProvider<ReportSort, ReportSortState> {
  const ReportSortProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'reportSortProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reportSortHash();

  @$internal
  @override
  ReportSort create() => ReportSort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportSortState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportSortState>(value),
    );
  }
}

String _$reportSortHash() => r'670e53e999d6aede349cac50e010f28fc5e5f0ce';

abstract class _$ReportSort extends $Notifier<ReportSortState> {
  ReportSortState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ReportSortState, ReportSortState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ReportSortState, ReportSortState>,
        ReportSortState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
