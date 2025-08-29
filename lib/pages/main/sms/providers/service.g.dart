// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(noticeService)
const noticeServiceProvider = NoticeServiceProvider._();

final class NoticeServiceProvider extends $FunctionalProvider<NoticeRepository,
    NoticeRepository, NoticeRepository> with $Provider<NoticeRepository> {
  const NoticeServiceProvider._()
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

String _$noticeServiceHash() => r'64231c8c170c2e4efb9ae5a8f05819c9db269823';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
