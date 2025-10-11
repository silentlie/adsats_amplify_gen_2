// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_check.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
          dependencies: const <ProviderOrFamily>[noticeFormProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>{
            ReadCheckProvider.$allTransitiveDependencies0,
            ReadCheckProvider.$allTransitiveDependencies1,
            ReadCheckProvider.$allTransitiveDependencies2,
            ReadCheckProvider.$allTransitiveDependencies3,
            ReadCheckProvider.$allTransitiveDependencies4,
          },
        );

  static const $allTransitiveDependencies0 = noticeFormProvider;
  static const $allTransitiveDependencies1 =
      NoticeFormProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies2 =
      NoticeFormProvider.$allTransitiveDependencies1;
  static const $allTransitiveDependencies3 =
      NoticeFormProvider.$allTransitiveDependencies2;
  static const $allTransitiveDependencies4 =
      NoticeFormProvider.$allTransitiveDependencies3;

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

String _$readCheckHash() => r'a4d057e40d2313c6fc978c9f75d37f4a99ee6586';
