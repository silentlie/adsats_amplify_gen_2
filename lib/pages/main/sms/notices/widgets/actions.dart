import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/models/Notice.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notices.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/service.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoticeActions extends ConsumerWidget with ConfirmDialogMixin {
  const NoticeActions({super.key, required this.notice});

  final Notice notice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = MenuController();
    final isSafetyOfficer = ref.watch(isSafetyOfficerProvider);
    final service = ref.read(noticeServiceProvider);
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
                context: context,
                title: Text("Are you sure?"),
                content: Text(
                  "Do you want to ${notice.archived ? "unarchive" : "archive"} this notice?\n${notice.subject}",
                ),
              );
              if (result) {
                await service.archive(notice);
                ref.invalidate(noticesProvider);
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
                context: context,
                title: Text("Are you sure?"),
                content: Text("Do you want to delete this notice?\n${notice.subject}"),
              );
              if (result) {
                await service.delete(notice);
                ref.invalidate(noticesProvider);
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
