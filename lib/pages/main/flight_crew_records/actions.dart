import 'package:adsats_amplify_gen_2/API/mutations.dart' hide delete;
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/edit_flight_crew_record_view.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/s3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlightCrewRecordActions extends ConsumerWidget {
  const FlightCrewRecordActions({
    super.key,
    required this.flightCrewRecord,
  });
  final FlightCrewRecord flightCrewRecord;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = MenuController();
    final isAdmin = ref.watch(isAdminProvider);
    return MenuAnchor(
      controller: controller,
      menuChildren: [
        IconButton(
          onPressed: () async {
            await getFlightCrewRecordFileUrl(flightCrewRecord);
            controller.close();
          },
          icon: const Icon(Icons.download_outlined),
          tooltip: "Download",
        ),
        if (isAdmin)
          IconButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return EditFlightCrewRecordView(
                    record: flightCrewRecord,
                  );
                },
              );
              controller.close();
            },
            icon: const Icon(Icons.edit_outlined),
          ),
        if (isAdmin)
          IconButton(
            onPressed: () async {
              controller.close();
              final result = await showConfirmDialog(
                context,
                Text("Are you sure?"),
                Text(
                  "Do you want to ${flightCrewRecord.archived ? "unarchive" : "archive"} this Flight Crew Record?",
                ),
              );
              if (result) {
                await update(flightCrewRecord.copyWith(
                    archived: !flightCrewRecord.archived));
                ref.invalidate(flightCrewRecordsRepoProvider);
                controller.close();
              }
            },
            icon: Icon(
              flightCrewRecord.archived
                  ? Icons.unarchive_outlined
                  : Icons.archive_outlined,
            ),
            tooltip: flightCrewRecord.archived
                ? "Unarchive this Flight Crew Record"
                : "Archive this Flight Crew Record",
          ),
        if (isAdmin)
          IconButton(
            onPressed: () async {
              controller.close();
              final result = await showConfirmDialog(
                context,
                Text("Are you sure?"),
                Text(
                    "Do you want to delete this Flight Crew Record?\nIt also deletes its documents"),
              );
              if (result) {
                await deleteFlightCrewRecord(flightCrewRecord);
                ref.invalidate(flightCrewRecordsRepoProvider);
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
