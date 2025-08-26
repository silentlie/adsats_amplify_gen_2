// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(NoticeNotifier)
const noticeNotifierProvider = NoticeNotifierProvider._();

final class NoticeNotifierProvider
    extends $NotifierProvider<NoticeNotifier, NoticeState> {
  const NoticeNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'noticeNotifierProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[
            selectedFilesProvider,
            isSafetyOfficerProvider,
            userDetailsProvider
          ],
          $allTransitiveDependencies: const <ProviderOrFamily>{
            NoticeNotifierProvider.$allTransitiveDependencies0,
            NoticeNotifierProvider.$allTransitiveDependencies1,
            NoticeNotifierProvider.$allTransitiveDependencies2,
            NoticeNotifierProvider.$allTransitiveDependencies3,
          },
        );

  static const $allTransitiveDependencies0 = selectedFilesProvider;
  static const $allTransitiveDependencies1 = isSafetyOfficerProvider;
  static const $allTransitiveDependencies2 =
      IsSafetyOfficerProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies3 =
      IsSafetyOfficerProvider.$allTransitiveDependencies1;

  @override
  String debugGetCreateSourceHash() => _$noticeNotifierHash();

  @$internal
  @override
  NoticeNotifier create() => NoticeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NoticeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NoticeState>(value),
    );
  }
}

String _$noticeNotifierHash() => r'0b81d303cac868115d25be16ae3a49daf4d4f045';

abstract class _$NoticeNotifier extends $Notifier<NoticeState> {
  NoticeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<NoticeState, NoticeState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<NoticeState, NoticeState>, NoticeState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
