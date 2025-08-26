// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(notifications)
const notificationsProvider = NotificationsProvider._();

final class NotificationsProvider extends $FunctionalProvider<List<NoticeStaff>,
    List<NoticeStaff>, List<NoticeStaff>> with $Provider<List<NoticeStaff>> {
  const NotificationsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'notificationsProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[userDetailsProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            NotificationsProvider.$allTransitiveDependencies0,
            NotificationsProvider.$allTransitiveDependencies1,
          ],
        );

  static const $allTransitiveDependencies0 = userDetailsProvider;
  static const $allTransitiveDependencies1 =
      UserDetailsProvider.$allTransitiveDependencies0;

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

String _$notificationsHash() => r'643b7b3472e5fcfb5a67b5e57158ac4f539c002d';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
