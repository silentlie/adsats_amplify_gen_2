// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StaffKPIFilter)
final staffKPIFilterProvider = StaffKPIFilterProvider._();

final class StaffKPIFilterProvider
    extends $NotifierProvider<StaffKPIFilter, StaffKPIFilterState> {
  StaffKPIFilterProvider._()
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

String _$staffKPIFilterHash() => r'20c802124e39e26310d4eb2ae34400e47743eaef';

abstract class _$StaffKPIFilter extends $Notifier<StaffKPIFilterState> {
  StaffKPIFilterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<StaffKPIFilterState, StaffKPIFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<StaffKPIFilterState, StaffKPIFilterState>,
        StaffKPIFilterState,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
