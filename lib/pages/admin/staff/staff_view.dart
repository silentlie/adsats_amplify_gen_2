import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/query_providers.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/repo.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StaffView extends ConsumerWidget {
  const StaffView({super.key, this.staff});

  final Staff? staff;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = this.staff != null;
    var staff = this.staff ??
        Staff(
          firstName: "",
          lastName: "",
          email: "",
          archived: false,
        );
    var aircraft = this.staff?.aircraft?.map(
          (e) {
            return e.aircraft!;
          },
        ).toList() ??
        [];
    var roles = this.staff?.roles?.map(
          (e) {
            return e.role!;
          },
        ).toList() ??
        [];
    Map<Subcategory, StaffSubcategory> staffSubcategories = {
      for (var staffSubcategory in staff.subcategories ?? <StaffSubcategory>[])
        staffSubcategory.subcategory!: staffSubcategory
    };
    return AlertDialog.adaptive(
      title: Text(
        isEditing
            ? 'Editing ${staff.firstName} ${staff.lastName}'
            : 'Add an staff',
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
                  labelText: 'First Name',
                ),
                onChanged: (value) {
                  staff = staff.copyWith(firstName: value);
                },
                initialValue: staff.firstName,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
                onChanged: (value) {
                  staff = staff.copyWith(lastName: value);
                },
                initialValue: staff.lastName,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                initialValue: staff.email,
                onChanged: (value) {
                  staff = staff.copyWith(email: value);
                },
                enabled: !isEditing,
                validator: (value) {
                  if (value?.isNotEmpty ?? false) return null;
                  return "Please enter email";
                },
              ),
            ),
            GlobalDropdownMenu<bool>(
              entries: const [
                DropdownMenuEntry(value: false, label: "False"),
                DropdownMenuEntry(value: true, label: "True"),
              ],
              onSelected: (value) {
                staff = staff.copyWith(archived: value!);
              },
              text: "Archived",
              initialSelection: staff.archived,
            ),
            AsyncValueWidget(
              value: ref.watch(listAircraftProvider()),
              data: (value) {
                return MultiSelectFormField<Aircraft>(
                  title: "Choose Aircraft",
                  items: value,
                  toCard: (value) {
                    return CheckListCard(
                      value: value,
                      title: Text(value.name),
                    );
                  },
                  onChange: (newValue) {
                    aircraft = newValue;
                  },
                  initialValue: aircraft,
                );
              },
            ),
            AsyncValueWidget(
              value: ref.watch(listRolesProvider()),
              data: (value) {
                return MultiSelectFormField<Role>(
                  title: "Choose Roles",
                  items: value,
                  toCard: (value) {
                    return CheckListCard(
                      value: value,
                      title: Text(value.name),
                    );
                  },
                  onChange: (newValue) {
                    roles = newValue;
                  },
                  initialValue: roles,
                );
              },
            ),
            AsyncValueWidget(
              value: ref.watch(listSubcategoriesProvider()),
              data: (value) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      children: [
                        MultiSelectFormField<Subcategory>(
                          title: "Accessible",
                          items: value,
                          toCard: (value) {
                            return CheckListCard(
                              value: value,
                              title: Text(value.name),
                            );
                          },
                          onChange: (newValue) {
                            staffSubcategories = {
                              for (var newSubcategory in newValue)
                                newSubcategory:
                                    staffSubcategories[newSubcategory] ??
                                        StaffSubcategory(
                                          accessLevel: 1,
                                          subcategory: newSubcategory,
                                          staff: staff,
                                        )
                            };
                            setState(() {});
                          },
                          initialValue: staffSubcategories.keys.toList(),
                        ),
                        ...staffSubcategories.entries.map(
                          (entry) => Container(
                            padding: const EdgeInsets.all(8),
                            child: DropdownMenu(
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(
                                  value: 1,
                                  label: "Read-only",
                                ),
                                DropdownMenuEntry(
                                  value: 2,
                                  label: "Full-access",
                                ),
                              ],
                              onSelected: (value) {
                                staffSubcategories[entry.key] =
                                    entry.value.copyWith(
                                  accessLevel: value as int,
                                );
                              },
                              initialSelection: entry.value.accessLevel,
                              expandedInsets: EdgeInsets.zero,
                              requestFocusOnTap: false,
                              hintText: entry.key.name,
                              label: Text(entry.key.name),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
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
                update(staff),
                updateAircraftStaff(staff, aircraft),
                updateRoleStaff(staff, roles),
                updateStaffSubcategory(staff, staffSubcategories),
              ]);
            } else {
              String id = await createUser(
                email: staff.email,
                tempPassword: "LM00r3??",
              );
              final newStaff = Staff(
                id: id,
                firstName: staff.firstName,
                lastName: staff.lastName,
                archived: staff.archived,
                email: staff.email,
              );
              await Future.wait([
                create(newStaff),
                updateAircraftStaff(newStaff, aircraft),
                updateRoleStaff(newStaff, roles),
                updateStaffSubcategory(newStaff, staffSubcategories),
              ]);
            }
            ref.invalidate(staffRepoProvider);
            if (!context.mounted) return;
            if (context.canPop()) {
              context.pop();
            } else {
              StaffRoute().go(context);
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
