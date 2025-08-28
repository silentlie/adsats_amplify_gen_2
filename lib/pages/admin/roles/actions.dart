import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/repo.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/role_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoleActions extends ConsumerWidget with ConfirmDialogMixin {
  const RoleActions({super.key, required this.role});

  final Role role;

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
                return RoleView(
                  role: role,
                );
              },
            );
          },
          icon: const Icon(Icons.edit_outlined),
        ),
        IconButton(
          onPressed: () async {
            final result = await showConfirmDialog(
              context: context,
              title: Text("Are you sure?"),
              content: Text("Do you want to delete this role?"),
            );
            if (result) {
              await update(role.copyWith(archived: !role.archived));
              ref.invalidate(rolesRepoProvider);
              controller.close();
            }
          },
          icon: Icon(
            role.archived ? Icons.unarchive_outlined : Icons.archive_outlined,
          ),
          tooltip: role.archived ? "Unarchive this role" : "Archive this role",
        ),
        IconButton(
          onPressed: () async {
            final result = await showConfirmDialog(
              context: context,
              title: Text("Are you sure?"),
              content: Text(
                  "Do you want to delete this role?\nIt also delete all its Categories and Flight Crew Records "),
            );
            if (result) {
              await deleteRole(role);
              ref.invalidate(rolesRepoProvider);
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
