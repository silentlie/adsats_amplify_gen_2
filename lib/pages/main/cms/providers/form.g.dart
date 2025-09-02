// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ReportForm)
const reportFormProvider = ReportFormProvider._();

final class ReportFormProvider
    extends $NotifierProvider<ReportForm, ReportFormState> {
  const ReportFormProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'reportFormProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[
            selectedFilesProvider,
            isComplianceManagerProvider,
            userDetailsProvider
          ],
          $allTransitiveDependencies: const <ProviderOrFamily>{
            ReportFormProvider.$allTransitiveDependencies0,
            ReportFormProvider.$allTransitiveDependencies1,
            ReportFormProvider.$allTransitiveDependencies2,
            ReportFormProvider.$allTransitiveDependencies3,
          },
        );

  static const $allTransitiveDependencies0 = selectedFilesProvider;
  static const $allTransitiveDependencies1 = isComplianceManagerProvider;
  static const $allTransitiveDependencies2 =
      IsComplianceManagerProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies3 =
      IsComplianceManagerProvider.$allTransitiveDependencies1;

  @override
  String debugGetCreateSourceHash() => _$reportFormHash();

  @$internal
  @override
  ReportForm create() => ReportForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportFormState>(value),
    );
  }
}

String _$reportFormHash() => r'52f141cf00a8c60a780d412b8d04d282bc52232b';

abstract class _$ReportForm extends $Notifier<ReportFormState> {
  ReportFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ReportFormState, ReportFormState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ReportFormState, ReportFormState>,
        ReportFormState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
