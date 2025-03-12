import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/models/Notice.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/view_sms/api.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/view_sms/invalidate.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoticeActions extends ConsumerWidget {
  const NoticeActions({super.key, required this.notice});

  final Notice notice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = MenuController();
    final isSafetyOfficer = ref.watch(isSafetyOfficerProvider);
    return MenuAnchor(
      controller: controller,
      alignmentOffset: Offset(50, -40),
      menuChildren: [
        IconButton(
          onPressed: () async {
            ViewNoticeRoute(id: notice.id).push(context);
          },
          icon: const Icon(Icons.remove_red_eye_outlined),
          tooltip: "View this notice",
        ),
        if (isSafetyOfficer)
          IconButton(
            onPressed: () async {
              final result = await showConfirmDialog(
                context,
                Text("Are you sure?"),
                Text(
                  "Do you want to ${notice.archived ? "unarchive" : "archive"} this notice?",
                ),
              );
              if (result) {
                await update(notice.copyWith(archived: !notice.archived));
                invalidate(ref);
                controller.close();
              }
            },
            icon: Icon(
              notice.archived
                  ? Icons.unarchive_outlined
                  : Icons.archive_outlined,
            ),
            tooltip: notice.archived
                ? "Unarchive this notice"
                : "Archive this notice",
          ),
        if (isSafetyOfficer)
          IconButton(
            onPressed: () async {
              final result = await showConfirmDialog(
                context,
                Text("Are you sure?"),
                Text("Do you want to delete this notice?"),
              );
              if (result) {
                await deleteNotice(notice);
                invalidate(ref);
                controller.close();
              }
            },
            icon: const Icon(Icons.delete_outline),
            tooltip: "Delete this notice",
          ),
      ],
      builder: (context, controller, child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(
            Icons.more_vert,
            // size: 20,
          ),
        );
      },
    );
  }
}
