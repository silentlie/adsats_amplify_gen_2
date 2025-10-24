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
          dependencies: null,
          $allTransitiveDependencies: null,
        );

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

String _$readCheckHash() => r'ebb6f5788f261885c6ac85cbe370cd658cbd7100';
