import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/providers/service.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/providers/subcategories.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/widgets/subcategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([listCategories, listStaff])
class SubcategoryActions extends ConsumerWidget with ConfirmDialogMixin {
  const SubcategoryActions({super.key, required this.subcategory});

  final Subcategory subcategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = MenuController();
    final service = ref.read(subcategoriesServiceProvider);
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
              context: context,
              title: Text("Are you sure?"),
              content: Text(
                "Do you want to ${subcategory.archived ? "unarchive" : "archive"} this subcategory ${subcategory.name}?",
              ),
            );
            if (result) {
              await service.archive(subcategory);
              ref.invalidate(subcategoriesProvider);
              controller.close();
            }
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
              context: context,
              title: Text("Are you sure?"),
              content: Text(
                  "Do you want to delete this subcategory ${subcategory.name}?\nIt also deletes its documents"),
            );
            if (result) {
              await service.delete(subcategory);
              ref.invalidate(subcategoriesProvider);
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
