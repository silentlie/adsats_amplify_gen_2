import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/query_providers.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/repo.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class RoleView extends ConsumerWidget {
  const RoleView({super.key, this.role});

  final Role? role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = this.role != null;
    var role = this.role ??
        Role(
          name: "",
          archived: false,
        );
    List<Staff> staff = role.staff?.map((e) => e.staff!).toList() ?? [];
    return AlertDialog.adaptive(
      title: Text(
        isEditing ? 'Editing ${role.name}' : 'Add an role',
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Role Name',
                ),
                onChanged: (value) {
                  role = role.copyWith(name: value);
                },
                initialValue: role.name,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description of the role',
                ),
                initialValue: role.description,
                onChanged: (value) {
                  role = role.copyWith(description: value);
                },
                maxLines: 4,
              ),
            ),
            GlobalDropdownMenu(
              entries: const [
                DropdownMenuEntry(value: false, label: "False"),
                DropdownMenuEntry(value: true, label: "True"),
              ],
              onSelected: (value) {
                role = role.copyWith(archived: value!);
              },
              text: "Archived",
              initialSelection: role.archived,
            ),
            AsyncValueWidget(
              value: ref.watch(listStaffProvider()),
              data: (value) {
                return GlobalMultiSelect<Staff>(
                  text: "Staff",
                  onConfirm: (p0) {
                    staff = p0;
                  },
                  items: value.map(
                    (e) {
                      return MultiSelectItem(e, e.name);
                    },
                  ).toList(),
                  initialValue: staff,
                );
              },
            )
          ],
        ),
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () async {
            final result = await showConfirmDialog(
              context,
              Text("Are you sure?"),
              Text("Do you want to cancel?"),
            );
            if (result && context.mounted) {
              Navigator.pop(context);
            }
          },
          label: const Text('Cancel'),
          icon: Icon(Icons.cancel_outlined),
        ),
        ElevatedButton.icon(
          onPressed: () async {
            final result = await showConfirmDialog(
              context,
              Text("Are you sure?"),
              Text("Do you want to apply?"),
            );
            if (!result) return;
            if (isEditing) {
              await Future.wait([
                updateRoleStaff(role, staff),
                if (role != this.role) update(role),
              ]);
            } else {
              await create(role);
            }
            ref.invalidate(rolesRepoProvider);
            if (!context.mounted) return;
            if (context.canPop()) {
              context.pop();
            } else {
              RolesRoute().go(context);
            }
          },
          label: Text(isEditing ? 'Apply' : 'Create'),
          icon: Icon(
            isEditing ? Icons.edit_outlined : Icons.add_circle_outline,
          ),
        ),
      ],
    );
  }
}
