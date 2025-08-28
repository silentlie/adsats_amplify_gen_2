import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/aircraft_view.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AircraftActions extends ConsumerWidget {
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
              context,
              Text("Are you sure?"),
              Text(
                "Do you want to ${aircraft.archived ? "unarchive" : "archive"} this aircraft?",
              ),
            );
            if (result) {
              await update(aircraft.copyWith(archived: !aircraft.archived));
              ref.invalidate(aircraftRepoProvider);
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
              context,
              Text("Are you sure?"),
              Text("Do you want to delete this aircraft?"),
            );
            if (result) {
              await deleteAircraft(aircraft);
              ref.invalidate(aircraftRepoProvider);
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
