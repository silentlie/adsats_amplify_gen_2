import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/providers/aircraft.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/providers/service.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/widgets/aircraft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AircraftActions extends ConsumerWidget with ConfirmDialogMixin {
  const AircraftActions({super.key, required this.aircraft});

  final Aircraft aircraft;

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
                return AircraftView(
                  aircraft: aircraft,
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
                "Do you want to ${aircraft.archived ? "unarchive" : "archive"} this aircraft?",
              ),
            );
            if (result) {
              final service = ref.read(aircraftServiceProvider);
              await service.archive(aircraft);
              ref.invalidate(aircraftProvider);
              controller.close();
            }
          },
          icon: Icon(
            aircraft.archived
                ? Icons.unarchive_outlined
                : Icons.archive_outlined,
          ),
          tooltip: aircraft.archived
              ? "Unarchive this aircraft"
              : "Archive this aircraft",
        ),
        IconButton(
          onPressed: () async {
            final result = await showConfirmDialog(
              context: context,
              title: Text("Are you sure?"),
              content: Text("Do you want to delete this aircraft?"),
            );
            if (result) {
              final service = ref.read(aircraftServiceProvider);
              await service.delete(aircraft);
              ref.invalidate(aircraftProvider);
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
