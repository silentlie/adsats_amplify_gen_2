import 'package:adsats_amplify_gen_2/helper/extensions/staff_name_extension.dart';
import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/providers/service.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/providers/subcategories.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([listCategories, listStaff])
class SubcategoryView extends ConsumerWidget with ConfirmDialogMixin {
  const SubcategoryView({
    super.key,
    this.subcategory,
    required this.categoryId,
  });

  final Subcategory? subcategory;
  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = this.subcategory != null;
    var subcategory = this.subcategory ??
        Subcategory(
          name: "",
          archived: false,
        );
    List<StaffSubcategory> staffSubcategories = List.from(
      subcategory.staff ?? [],
    );
    return AlertDialog.adaptive(
      title: Text(
        isEditing ? 'Editing ${subcategory.name}' : 'Add an subcategory',
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AsyncValueWidget(
              value: ref.watch(listCategoriesProvider()),
              data: (value) {
                if (!isEditing) {
                  subcategory = subcategory.copyWith(category: value.firstWhere(
                    (element) {
                      return element.id == categoryId;
                    },
                  ));
                }
                return GlobalDropdownMenu<Category>(
                  entries: value.map(
                    (e) {
                      return DropdownMenuEntry(value: e, label: e.name);
                    },
                  ).toList(),
                  onSelected: (value) {
                    subcategory = subcategory.copyWith(category: value);
                  },
                  initialSelection: subcategory.category,
                  text: "Category",
                );
              },
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Subcategory Name',
                ),
                onChanged: (value) {
                  subcategory = subcategory.copyWith(name: value);
                },
                initialValue: subcategory.name,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description of the category',
                ),
                initialValue: subcategory.description,
                onChanged: (value) {
                  subcategory = subcategory.copyWith(description: value);
                },
                maxLines: 4,
              ),
            ),
            GlobalDropdownMenu(
              entries: const [
                DropdownMenuEntry(value: false, label: "No"),
                DropdownMenuEntry(value: true, label: "Yes"),
              ],
              onSelected: (value) {
                subcategory = subcategory.copyWith(archived: value!);
              },
              text: "Archived",
              initialSelection: subcategory.archived,
            ),
            AsyncValueWidget(
              value: ref.watch(listStaffProvider()),
              data: (value) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      children: [
                        MultiSelectFormField<Staff>(
                          title: "Accessible Staff",
                          items: value,
                          toCard: (value) {
                            return CheckListCard(
                              value: value,
                              title: Text(value.fullName),
                            );
                          },
                          onChange: (options) {
                            staffSubcategories.removeWhere(
                              (ss) {
                                return !options.contains(ss.staff);
                              },
                            );
                            for (var staff in options) {
                              if (!staffSubcategories.any(
                                (ss) {
                                  return ss.staff == staff;
                                },
                              )) {
                                staffSubcategories.add(
                                  StaffSubcategory(
                                    accessLevel: 1,
                                    staff: staff,
                                    subcategory: subcategory,
                                  ),
                                );
                              }
                            }
                            setState(() {});
                          },
                          initialValue: staffSubcategories.map(
                            (e) {
                              return e.staff!;
                            },
                          ).toList(),
                        ),
                        ...staffSubcategories.map(
                          (ss) {
                            return GlobalDropdownMenu(
                              entries: [
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
                                staffSubcategories = staffSubcategories.map(
                                  (e) {
                                    return e == ss
                                        ? e.copyWith(accessLevel: value)
                                        : e;
                                  },
                                ).toList();
                              },
                              initialSelection: ss.accessLevel,
                              text: ss.staff!.fullName,
                            );
                          },
                        )
                      ],
                    );
                  },
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
              content: Text("Do you want to ?"),
            );
            if (!result) {
              return;
            }
            final service = ref.read(subcategoriesServiceProvider);
            if (isEditing) {
              await Future.wait([
                if (this.subcategory != subcategory)
                  service.update(subcategory),
                service.upsertStaffSubcategory(
                    subcategory.staff!, staffSubcategories)
              ]);
            } else {
              await Future.wait([
                service.create(subcategory),
                service.upsertStaffSubcategory(
                  [],
                  staffSubcategories,
                ),
              ]);
            }
            ref.invalidate(subcategoriesProvider);
            if (!context.mounted) return;
            if (context.canPop()) {
              context.pop();
            } else {
              SubcategoriesRoute(categoryId: categoryId).go(context);
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
