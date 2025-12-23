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
          dependencies: null,
          $allTransitiveDependencies: null,
        );

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

String _$noticeFormHash() => r'c9f3bc246330210002a6a5d6063754d3f255071b';

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
