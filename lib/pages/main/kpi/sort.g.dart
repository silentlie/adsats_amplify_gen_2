// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(StaffKPISort)
const staffKPISortProvider = StaffKPISortProvider._();

final class StaffKPISortProvider
    extends $NotifierProvider<StaffKPISort, StaffKPISortState> {
  const StaffKPISortProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'staffKPISortProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$staffKPISortHash();

  @$internal
  @override
  StaffKPISort create() => StaffKPISort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StaffKPISortState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StaffKPISortState>(value),
    );
  }
}

String _$staffKPISortHash() => r'92e16ec2b960b55d2b314a17deef41afc213d98b';

abstract class _$StaffKPISort extends $Notifier<StaffKPISortState> {
  StaffKPISortState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<StaffKPISortState, StaffKPISortState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<StaffKPISortState, StaffKPISortState>,
        StaffKPISortState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
