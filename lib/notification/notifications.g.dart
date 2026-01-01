// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notifications)
final notificationsProvider = NotificationsProvider._();

final class NotificationsProvider extends $FunctionalProvider<List<NoticeStaff>,
    List<NoticeStaff>, List<NoticeStaff>> with $Provider<List<NoticeStaff>> {
  NotificationsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'notificationsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notificationsHash();

  @$internal
  @override
  $ProviderElement<List<NoticeStaff>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<NoticeStaff> create(Ref ref) {
    return notifications(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<NoticeStaff> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<NoticeStaff>>(value),
    );
  }
}

String _$notificationsHash() => r'f0c2b3d6790e0f976d682a87372b6ab19d1c3f67';
