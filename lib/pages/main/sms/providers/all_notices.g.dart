// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_notices.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(allNotices)
const allNoticesProvider = AllNoticesProvider._();

final class AllNoticesProvider extends $FunctionalProvider<
        AsyncValue<List<Notice>>, List<Notice>, FutureOr<List<Notice>>>
    with $FutureModifier<List<Notice>>, $FutureProvider<List<Notice>> {
  const AllNoticesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'allNoticesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$allNoticesHash();

  @$internal
  @override
  $FutureProviderElement<List<Notice>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Notice>> create(Ref ref) {
    return allNotices(ref);
  }
}

String _$allNoticesHash() => r'87d5b32bd1f1d70b8dedb3ead940de14f21aa68e';
