import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/repo.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/sessions/sessions_view.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/staff_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StaffActions extends ConsumerWidget {
  const StaffActions({super.key, required this.staff});

  final Staff staff;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = MenuController();
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
              context,
              Text("Are you sure?"),
              Text(
                "Do you want to ${staff.archived ? "unarchive" : "archive"} this staff?",
              ),
            );
            if (result) {
              await Future.wait([
                update(staff.copyWith(archived: !staff.archived)),
                staff.archived ? enableUser(staff.id) : disableUser(staff.id),
              ]);
              ref.invalidate(staffRepoProvider);
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
              context,
              Text("Are you sure?"),
              Text("Do you want to delete this staff?"),
            );
            if (result) {
              await Future.wait([
                deleteStaff(staff),
                deleteUser(staff.id),
              ]);
              ref.invalidate(staffRepoProvider);
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
