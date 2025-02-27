import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/aircraft_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AircraftActions extends ConsumerWidget {
  const AircraftActions({super.key, required this.aircraft});

  final Aircraft aircraft;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuAnchor(
      menuChildren: [
        IconButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) {
                return AircraftView(aircraft: aircraft,);
              },
            );
          },
          icon: const Icon(Icons.edit_outlined),
        ),
        IconButton(
          onPressed: () async {
            await update(aircraft.copyWith(archived: !aircraft.archived));
          },
          icon: const Icon(Icons.archive_outlined),
        ),
        IconButton(
          onPressed: () async {
            await deleteAicraft(aircraft);
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
