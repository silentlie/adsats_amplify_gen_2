// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(noticeService)
final noticeServiceProvider = NoticeServiceProvider._();

final class NoticeServiceProvider extends $FunctionalProvider<NoticeRepository,
    NoticeRepository, NoticeRepository> with $Provider<NoticeRepository> {
  NoticeServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'noticeServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$noticeServiceHash();

  @$internal
  @override
  $ProviderElement<NoticeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NoticeRepository create(Ref ref) {
    return noticeService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NoticeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NoticeRepository>(value),
    );
  }
}

String _$noticeServiceHash() => r'f618c9fe1e0e9872379c5dd05348da9b3ca1ada1';
