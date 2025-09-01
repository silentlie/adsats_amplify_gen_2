import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/providers/categories.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/providers/service.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/widgets/category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryActions extends ConsumerWidget with ConfirmDialogMixin {
  const CategoryActions({super.key, required this.category});

  final Category category;

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
                return CategoryView(
                  category: category,
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
                "Do you want to ${category.archived ? "unarchive" : "archive"} this category?",
              ),
            );
            if (result) {
              await update(category.copyWith(archived: !category.archived));
              ref.invalidate(categoriesProvider);
              controller.close();
            }
          },
          icon: Icon(
            category.archived
                ? Icons.unarchive_outlined
                : Icons.archive_outlined,
          ),
          tooltip: category.archived
              ? "Unarchive this category"
              : "Archive this category",
        ),
        IconButton(
          onPressed: () async {
            final result = await showConfirmDialog(
              context: context,
              title: Text("Are you sure?"),
              content: Text(
                  "Do you want to delete this category?\nIt also deletes its subcategories and documents"),
            );
            if (result) {
              final service = ref.read(categoriesServiceProvider);
              await service.delete(category);
              ref.invalidate(categoriesProvider);
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
