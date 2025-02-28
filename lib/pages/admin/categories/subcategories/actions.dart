import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/repo.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/subcategory_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubcategoryActions extends ConsumerWidget {
  const SubcategoryActions({super.key, required this.subcategory});

  final Subcategory subcategory;

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
                return SubcategoryView(
                  subcategory: subcategory,
                  categoryId: subcategory.category!.id,
                );
              },
            );
          },
          icon: const Icon(Icons.edit_outlined),
        ),
        IconButton(
          onPressed: () async {
            final result = await showConfirmDialog(
              context,
              Text("Are you sure?"),
              Text(
                "Do you want to ${subcategory.archived ? "unarchive" : "archive"} this subcategory?",
              ),
            );
            if (result)
            {await update(subcategory.copyWith(archived: !subcategory.archived));
            ref.invalidate(subcategoriesRepoProvider);
            controller.close();}
          },
           icon: Icon(
            subcategory.archived
                ? Icons.unarchive_outlined
                : Icons.archive_outlined,
          ),
          tooltip: subcategory.archived
              ? "Unarchive this subcategory"
              : "Archive this subcategory",
        ),
        IconButton(
          onPressed: () async {
             final result = await showConfirmDialog(
              context,
              Text("Are you sure?"),
              Text("Do you want to delete this subcategory?\nIt also deletes its documents"),
            );
            if (result)
            {await deleteSubcategory(subcategory);
            ref.invalidate(subcategoriesRepoProvider);
            controller.close();}
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
