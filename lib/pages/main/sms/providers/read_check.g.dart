// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_check.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(readCheck)
const readCheckProvider = ReadCheckProvider._();

final class ReadCheckProvider extends $FunctionalProvider<
        AsyncValue<List<NoticeStaff>>,
        List<NoticeStaff>,
        FutureOr<List<NoticeStaff>>>
    with
        $FutureModifier<List<NoticeStaff>>,
        $FutureProvider<List<NoticeStaff>> {
  const ReadCheckProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'readCheckProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[
            userIdProvider,
            noticeFormProvider,
            listNoticeStaffProvider
          ],
          $allTransitiveDependencies: const <ProviderOrFamily>{
            ReadCheckProvider.$allTransitiveDependencies0,
            ReadCheckProvider.$allTransitiveDependencies1,
            ReadCheckProvider.$allTransitiveDependencies2,
            ReadCheckProvider.$allTransitiveDependencies3,
            ReadCheckProvider.$allTransitiveDependencies4,
            ReadCheckProvider.$allTransitiveDependencies5,
          },
        );

  static const $allTransitiveDependencies0 = userIdProvider;
  static const $allTransitiveDependencies1 = noticeFormProvider;
  static const $allTransitiveDependencies2 =
      NoticeFormProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies3 =
      NoticeFormProvider.$allTransitiveDependencies1;
  static const $allTransitiveDependencies4 =
      NoticeFormProvider.$allTransitiveDependencies2;
  static const $allTransitiveDependencies5 = listNoticeStaffProvider;

  @override
  String debugGetCreateSourceHash() => _$readCheckHash();

  @$internal
  @override
  $FutureProviderElement<List<NoticeStaff>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<NoticeStaff>> create(Ref ref) {
    return readCheck(ref);
  }
}

String _$readCheckHash() => r'd5c1a8edbb48d1f5f2f483a8405ff2a5a6d27d1a';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
