import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/providers/service.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RoleView extends ConsumerWidget with ConfirmDialogMixin {
  const RoleView({super.key, this.role});

  final Role? role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = this.role != null;
    var role = this.role ?? Role(name: "", archived: false, staff: []);
    List<Staff> staff = role.staff!.map((e) => e.staff!).toList();
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
                DropdownMenuEntry(value: true, label: "No"),
                DropdownMenuEntry(value: true, label: "Yes"),
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
                return MultiSelectFormField<Staff>(
                  title: "Staff",
                  items: value,
                  toCard: (value) {
                    return CheckListCard(
                      value: value,
                      title: Text("${value.firstName} ${value.lastName}"),
                    );
                  },
                  onChange: (newValue) {
                    staff = newValue;
                  },
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
              context: context,
              title: Text("Are you sure?"),
              content: Text("Do you want to cancel?"),
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
              context: context,
              title: Text("Are you sure?"),
              content: Text("Do you want to apply?"),
            );
            if (!result) return;
            final service = ref.read(rolesServiceProvider);
            if (isEditing) {
              await service.update(role, staff);
            } else {
              await service.create(role, staff);
            }
            ref.invalidate(rolesServiceProvider);
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
