// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
            userDetailsProvider,
            reportServiceProvider
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
  static const $allTransitiveDependencies2 = userDetailsProvider;
  static const $allTransitiveDependencies3 = reportServiceProvider;

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

String _$reportFormHash() => r'c5ab5b22fae2b3e7e0194327c27555bade568f6f';

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
