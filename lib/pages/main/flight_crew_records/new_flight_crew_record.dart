import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/s3.dart';
import 'package:adsats_amplify_gen_2/widgets/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewFlightCrewRecord extends ConsumerStatefulWidget {
  const NewFlightCrewRecord({
    super.key,
    required this.category,
    required this.staff,
  });
  final FlightCrewRecordCategory category;
  final Staff staff;

  @override
  ConsumerState<NewFlightCrewRecord> createState() =>
      _NewFlightCrewRecordState();
}

class _NewFlightCrewRecordState extends ConsumerState<NewFlightCrewRecord>
    with ConfirmDialogMixin {
  bool _isLoading = false;
  final Map<String, double> _fileProgress = {};

  void _showLoading(bool value) {
    setState(() {
      _isLoading = value;
      if (!value) _fileProgress.clear(); // Reset progress when done
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    bool archived = false;
    TemporalDateTime? issuedAt;
    TemporalDateTime? expiredAt;

    return Stack(
      children: [
        AlertDialog.adaptive(
          title: const Text(
            'Add Flight Crew Records',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
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
                  text: "Issue Date",
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: selectedFiles.map((file) {
                          return PlaformFileWidget(
                            file: file,
                            onDelete: () {
                              ref
                                  .read(selectedFilesProvider.notifier)
                                  .removeFile(file);
                              setState(() {
                                _fileProgress.remove(file.name);
                              });
                            },
                            progress: _fileProgress[file.name],
                          );
                        }).toList(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          actions: [
            // cancel
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
                FilePickerResult? filePickerResult =
                    await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                  type: FileType.any,
                  withData: false,
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
                  context: context,
                  title: Text("Are you sure?"),
                  content: Text("Do you want to upload these records?"),
                );
                if (!result) {
                  return;
                }
                _showLoading(true);
                try {
                  await uploadFlightCrewRecordsFiles(
                    files,
                    widget.staff,
                    widget.category,
                    archived,
                    issuedAt,
                    expiredAt,
                    (fileName, progress) {
                      setState(() {
                        _fileProgress[fileName] = progress;
                      });
                    },
                  );
                  ref.invalidate(flightCrewRecordsRepoProvider);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                } catch (e) {
                  debugPrint('Error uploading files: $e');
                } finally {
                  _showLoading(false);
                }
              },
              style: ButtonStyle(
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
        ),
        if (_isLoading)
          ModalBarrier(
            color: Colors.black.withValues(alpha: 0.5),
            dismissible: false,
          ),
        if (_isLoading)
          Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}

class PlaformFileWidget extends StatelessWidget {
  const PlaformFileWidget({
    super.key,
    required this.file,
    required this.onDelete,
    required this.progress,
  });

  final PlatformFile file;
  final VoidCallback onDelete;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(file.name),
                SizedBox(height: 5),
                LinearProgressIndicator(
                  value: progress ?? 0.0,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
