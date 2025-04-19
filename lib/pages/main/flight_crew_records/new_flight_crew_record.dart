import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/helper/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/s3.dart';
import 'package:adsats_amplify_gen_2/widgets/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewFlightCrewRecord extends ConsumerWidget {
  const NewFlightCrewRecord({
    super.key,
    required this.category,
    required this.staff,
  });
  final FlightCrewRecordCategory category;
  final Staff staff;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    bool archived = false;
    TemporalDateTime? issuedAt;
    TemporalDateTime? expiredAt;
    return AlertDialog.adaptive(
      title: const Text(
        'Add Flight Crew Records',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlobalDropdownMenu(
            entries: const [
              DropdownMenuEntry(value: false, label: "False"),
              DropdownMenuEntry(value: true, label: "True"),
              DropdownMenuEntry(value: null, label: "All"),
            ],
            onSelected: (value) {
              archived = value!;
            },
            initialSelection: archived,
            text: "Archived",
          ),
          DatePickerWidget(
            text: "Issued date",
            firstDate: DateTime.now().subtract(
              const Duration(days: 365 * 10),
            ),
            lastDate: DateTime.now().add(
              const Duration(days: 365 * 10),
            ),
            onSelected: (value) {
              issuedAt = value;
            },
          ),
          DatePickerWidget(
            text: "Expired date",
            firstDate: DateTime.now().subtract(
              const Duration(days: 365 * 10),
            ),
            lastDate: DateTime.now().add(
              const Duration(days: 365 * 10),
            ),
            onSelected: (value) {
              expiredAt = value;
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final selectedFiles = ref.watch(selectedFilesProvider);
              return Column(
                children: selectedFiles.map((file) {
                  return Chip(
                    label: Text(file.name),
                    onDeleted: () {
                      ref.read(selectedFilesProvider.notifier).removeFile(file);
                    },
                  );
                }).toList(),
              );
            },
          )
        ],
      ),
      actions: [
        // cancel
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
            FilePickerResult? filePickerResult =
                await FilePicker.platform.pickFiles(
              allowMultiple: true,
              type: FileType.any,
              withData: false,
              // Ensure to get file stream for better performance
              withReadStream: true,
            );
            if (filePickerResult != null) {
              ref
                  .read(selectedFilesProvider.notifier)
                  .addFiles(filePickerResult.files);
            }
          },
          label: const Text("Pick file"),
          icon: Icon(Icons.note_add_outlined),
        ),
        // apply
        ElevatedButton.icon(
          onPressed: () async {
            final files = ref.read(selectedFilesProvider);
            if (files.isEmpty) {
              return;
            }
            final result = await showConfirmDialog(
              context,
              Text("Are you sure?"),
              Text("Do you want to upload these records?"),
            );
            if (!result) {
              return;
            }
            await uploadFlightCrewRecordsFiles(
              files,
              staff,
              category,
              archived,
              issuedAt,
              expiredAt,
            );
            ref.invalidate(flightCrewRecordsRepoProvider);
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          style: ButtonStyle(
            // Change button background color
            backgroundColor:
                WidgetStateProperty.all<Color>(colorScheme.secondary),
          ),
          label: Text(
            'Upload Files',
            style: TextStyle(color: colorScheme.onSecondary),
          ),
          icon: Icon(
            Icons.upload_file,
            color: colorScheme.onSecondary,
          ),
        )
      ],
    );
  }
}
