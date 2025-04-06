import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/query_providers.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/repo.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FlightCrewRecordsCategoryView extends ConsumerWidget {
  const FlightCrewRecordsCategoryView(
      {super.key, this.category, required this.roleId});

  final FlightCrewRecordCategory? category;
  final String roleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = this.category != null;
    var category = this.category ??
        FlightCrewRecordCategory(
          name: "",
          archived: false,
        );
    return AlertDialog.adaptive(
      title: Text(
        isEditing
            ? 'Editing ${category.name}'
            : 'Add a Flight Crew Records Category',
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AsyncValueWidget(
              value: ref.watch(listRolesProvider()),
              data: (value) {
                if (!isEditing) {
                  category = category.copyWith(role: value.firstWhere(
                    (element) {
                      return element.id == roleId;
                    },
                  ));
                }
                return GlobalDropdownMenu<Role>(
                  entries: value.map(
                    (e) {
                      return DropdownMenuEntry(value: e, label: e.name);
                    },
                  ).toList(),
                  onSelected: (value) {
                    category = category.copyWith(role: value);
                  },
                  initialSelection: category.role,
                  text: "Role",
                );
              },
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Category Name',
                ),
                onChanged: (value) {
                  category = category.copyWith(name: value);
                },
                initialValue: category.name,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description of the category',
                ),
                initialValue: category.description,
                onChanged: (value) {
                  category = category.copyWith(description: value);
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
                category = category.copyWith(archived: value!);
              },
              text: "Archived",
              initialSelection: category.archived,
            ),
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
              Text("Do you want to ?"),
            );
            if (!result) {
              return;
            }
            if (isEditing) {
              await Future.wait([
                if (this.category != category) update(category),
              ]);
            } else {
              await Future.wait([
                create(category),
              ]);
            }
            ref.invalidate(flightCrewRecordsCategoriesRepoProvider);
            if (!context.mounted) return;
            if (context.canPop()) {
              context.pop();
            } else {
              FlightCrewRecordsCategoriesRoute(roleId: roleId).go(context);
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
