import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/reports/api.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/reports/invalidate.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportActions extends ConsumerWidget with ConfirmDialogMixin {
  const ReportActions({
    super.key,
    required this.report,
  });

  final Report report;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = MenuController();
    final isComplianceManager = ref.watch(isComplianceManagerProvider);
    return MenuAnchor(
      controller: controller,
      alignmentOffset: Offset(50, -40),
      menuChildren: [
        IconButton(
          onPressed: () async {
            ViewReportRoute(id: report.id).go(context);
          },
          icon: const Icon(Icons.remove_red_eye_outlined),
          tooltip: "View this notice",
        ),
        if (isComplianceManager)
          IconButton(
            onPressed: () async {
              final result = await showConfirmDialog(
                context: context,
                title: Text("Are you sure?"),
                content: Text(
                  "Do you want to ${report.archived ? "unarchive" : "archive"} this report?",
                ),
              );
              if (result) {
                await update(report.copyWith(archived: !report.archived));
                invalidateViewCms(ref);
                controller.close();
              }
            },
            icon: Icon(
              report.archived
                  ? Icons.unarchive_outlined
                  : Icons.archive_outlined,
            ),
            tooltip: report.archived
                ? "Unarchive this report"
                : "Archive this report",
          ),
        if (isComplianceManager)
          IconButton(
            onPressed: () async {
              final result = await showConfirmDialog(
                context: context,
                title: Text("Are you sure?"),
                content: Text("Do you want to delete this notice?"),
              );
              if (result) {
                await deleteReport(report);
                invalidateViewCms(ref);
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
