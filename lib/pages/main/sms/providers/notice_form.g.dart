// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_form.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(NoticeForm)
const noticeFormProvider = NoticeFormProvider._();

final class NoticeFormProvider
    extends $NotifierProvider<NoticeForm, NoticeFormState> {
  const NoticeFormProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'noticeFormProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[
            selectedFilesProvider,
            isSafetyOfficerProvider,
            userDetailsProvider
          ],
          $allTransitiveDependencies: const <ProviderOrFamily>{
            NoticeFormProvider.$allTransitiveDependencies0,
            NoticeFormProvider.$allTransitiveDependencies1,
            NoticeFormProvider.$allTransitiveDependencies2,
            NoticeFormProvider.$allTransitiveDependencies3,
          },
        );

  static const $allTransitiveDependencies0 = selectedFilesProvider;
  static const $allTransitiveDependencies1 = isSafetyOfficerProvider;
  static const $allTransitiveDependencies2 =
      IsSafetyOfficerProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies3 =
      IsSafetyOfficerProvider.$allTransitiveDependencies1;

  @override
  String debugGetCreateSourceHash() => _$noticeFormHash();

  @$internal
  @override
  NoticeForm create() => NoticeForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NoticeFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NoticeFormState>(value),
    );
  }
}

String _$noticeFormHash() => r'f6448cc893623869d2b8eb1f506cadbdc8815839';

abstract class _$NoticeForm extends $Notifier<NoticeFormState> {
  NoticeFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<NoticeFormState, NoticeFormState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<NoticeFormState, NoticeFormState>,
        NoticeFormState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
