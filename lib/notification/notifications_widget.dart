import 'package:adsats_amplify_gen_2/helper/mixin/notification_builder_mixin.dart';
import 'package:adsats_amplify_gen_2/notification/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badges/badges.dart' as badges;

class NotificationsWidget extends ConsumerWidget with NotificationBuilderMixin {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsWidgets = buildNotifications(context, ref);
    return MenuAnchor(
      menuChildren: [
        if (notificationsWidgets.isEmpty)
          const ListTile(
            title: Text("There is no pending notice"),
          ),
        ...notificationsWidgets,
        TextButton.icon(
          onPressed: () async {
            ref.refresh(notificationsProvider).hashCode;
          },
          label: const Text("Refresh"),
          icon: const Icon(Icons.refresh),
        ),
      ],
      builder: (context, controller, child) {
        return badges.Badge(
          position: badges.BadgePosition.topEnd(top: -5, end: -5),
          badgeContent: Text(notificationsWidgets.length.toString()),
          showBadge: notificationsWidgets.isNotEmpty,
          badgeAnimation: const badges.BadgeAnimation.scale(),
          child: IconButton(
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            icon: const Icon(
              Icons.notifications_none,
            ),
          ),
        );
      },
    );
  }
}
