import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/flight_crew_record_categories/providers/records.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/flight_crew_record_categories/providers/service.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/flight_crew_record_categories/widgets/crew_document_category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlightCrewRecordsCategoryActions extends ConsumerWidget
    with ConfirmDialogMixin {
  const FlightCrewRecordsCategoryActions({super.key, required this.category});

  final FlightCrewRecordCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = MenuController();
    final service = ref.read(flightCrewRecordCategoriesServiceProvider);
    return MenuAnchor(
      controller: controller,
      menuChildren: [
        IconButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) {
                return FlightCrewRecordsCategoryView(
                  category: category,
                  roleId: category.role!.id,
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
                "Do you want to ${category.archived ? "unarchive" : "archive"} this category ${category.name}?",
              ),
            );
            if (!result) return;
            await service.archive(category);
            ref.invalidate(flightCrewRecordCategoriesProvider);
            controller.close();
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
                "Do you want to delete this category ${category.name}?\nIt also deletes any Flight Crew Records under this Category",
              ),
            );
            if (!result) return;
            await service.delete(category);
            ref.invalidate(flightCrewRecordCategoriesProvider);
            controller.close();
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
