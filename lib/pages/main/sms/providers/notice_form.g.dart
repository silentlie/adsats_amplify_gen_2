// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_form.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
            userDetailsProvider,
            noticeServiceProvider
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
  static const $allTransitiveDependencies2 = userDetailsProvider;
  static const $allTransitiveDependencies3 = noticeServiceProvider;

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

String _$noticeFormHash() => r'f0b16bf1cbd7ec22a050feb0d8245a515560957c';

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
