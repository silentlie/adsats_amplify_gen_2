import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late List<ListTile> notifications;

  IconData _getIcon(String? type) {
    switch (type) {
      case "Notice_to_Crew":
        return Icons.notifications_outlined;
      case "Safety_notice":
        return Icons.gpp_maybe_outlined;
      case "Hazard_report":
        return Icons.report_outlined;
      default:
        return Icons.question_mark;
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    notifications = authNotifier.user.notifications
            ?.where(
          (element) => element.read_at == null,
        )
            .map(
          (e) {
            return ListTile(
              visualDensity: VisualDensity.standard,
              tileColor: Colors.blue.shade100,
              titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
              title: RichText(
                text: TextSpan(
                  text: 'Author: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: e.notice?.author?.name,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              subtitle: RichText(
                text: TextSpan(
                  text: 'Subject: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: e.notice?.subject,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              leading: Icon(_getIcon(e.notice?.type!.name)),
              onTap: () {
                context.go('/sms', extra: e.notice);
              },
            );
          },
        ).toList() ??
        [];
    return MenuAnchor(
      menuChildren: [
        if (notifications.isEmpty)
          const ListTile(
            title: Text("There is no pending notice"),
          ),
        ...notifications,
        TextButton.icon(
          onPressed: () async {
            await authNotifier.fetchCognitoAuthSession();
            setState(() {});
          },
          label: const Text("Refresh"),
          icon: const Icon(Icons.refresh),
        ),
      ],
      builder: (context, controller, child) {
        return badges.Badge(
          position: badges.BadgePosition.topEnd(top: -5, end: -5),
          badgeContent: Text(notifications.length.toString()),
          showBadge: notifications.isNotEmpty,
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
