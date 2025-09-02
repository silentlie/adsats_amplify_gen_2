import 'package:adsats_amplify_gen_2/helper/extensions/staff_name_extension.dart';
import 'package:adsats_amplify_gen_2/notification/notifications.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin NotificationBuilderMixin {
  IconData getNotificationIcon(String? type) {
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

  List<ListTile> buildNotifications(BuildContext context, WidgetRef ref) {
    return ref.watch(notificationsProvider).map(
      (e) {
        return ListTile(
          visualDensity: VisualDensity.standard,
          tileColor: Colors.blue.shade100,
          title: RichText(
            text: TextSpan(
              text: 'Author: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: e.notice?.author?.fullName,
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
          leading: Icon(getNotificationIcon(e.notice?.type?.name)),
          onTap: () {
            ViewNoticeRoute(id: e.notice!.id).push(context);
          },
        );
      },
    ).toList();
  }
}
