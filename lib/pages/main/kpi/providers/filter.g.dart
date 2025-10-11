// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StaffKPIFilter)
const staffKPIFilterProvider = StaffKPIFilterProvider._();

final class StaffKPIFilterProvider
    extends $NotifierProvider<StaffKPIFilter, StaffKPIFilterState> {
  const StaffKPIFilterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'staffKPIFilterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$staffKPIFilterHash();

  @$internal
  @override
  StaffKPIFilter create() => StaffKPIFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StaffKPIFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StaffKPIFilterState>(value),
    );
  }
}

String _$staffKPIFilterHash() => r'8823d6557f30281e174a93a1729b8319cd5bc4c3';

abstract class _$StaffKPIFilter extends $Notifier<StaffKPIFilterState> {
  StaffKPIFilterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<StaffKPIFilterState, StaffKPIFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<StaffKPIFilterState, StaffKPIFilterState>,
        StaffKPIFilterState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
