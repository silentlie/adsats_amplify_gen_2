import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/providers/service.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/providers/staff.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/sessions/sessions_view.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/widgets/staff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StaffActions extends ConsumerWidget with ConfirmDialogMixin {
  const StaffActions({super.key, required this.staff});

  final Staff staff;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = MenuController();
    final service = ref.read(staffServiceProvider);
    return MenuAnchor(
      controller: controller,
      menuChildren: [
        IconButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) {
                return StaffView(
                  staff: staff,
                );
              },
            );
          },
          icon: const Icon(Icons.edit_outlined),
        ),
        IconButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: SessionsView(
                    staff: staff,
                  ),
                );
              },
            );
          },
          icon: const Icon(Icons.sensors_outlined),
        ),
        IconButton(
          onPressed: () async {
            final result = await showConfirmDialog(
              context: context,
              title: Text("Are you sure?"),
              content: Text(
                "Do you want to ${staff.archived ? "unarchive" : "archive"} this staff?",
              ),
            );
            if (result) {
              await service.archive(staff);
              ref.invalidate(staffProvider);
              controller.close();
            }
          },
          icon: Icon(
            staff.archived ? Icons.unarchive_outlined : Icons.archive_outlined,
          ),
          tooltip:
              staff.archived ? "Unarchive this staff" : "Archive this staff",
        ),
        IconButton(
          onPressed: () async {
            final result = await showConfirmDialog(
              context: context,
              title: Text("Are you sure?"),
              content: Text("Do you want to delete this staff?"),
            );
            if (result) {
              await service.delete(staff);
              ref.invalidate(staffProvider);
              controller.close();
            }
          },
          icon: const Icon(Icons.delete_outline),
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
