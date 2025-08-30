import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/s3.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NewDocumentDialog extends ConsumerStatefulWidget {
  const NewDocumentDialog({
    super.key,
    this.subcategory,
  });

  final Subcategory? subcategory;

  @override
  ConsumerState<NewDocumentDialog> createState() => _NewDocumentDialogState();
}

class _NewDocumentDialogState extends ConsumerState<NewDocumentDialog>
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
    ThemeData themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    return Stack(
      children: [
        AsyncValueWidget(
          value: ref.watch(userDetailsProvider),
          data: (user) {
            Staff uploader = user;
            Subcategory? subcategory = widget.subcategory;
            List<Aircraft> aircraft = [];
            bool archived = false;
            TemporalDateTime? issuedAt;
            TemporalDateTime? expiredAt;
            final isAdmin = ref.watch(isAdminProvider);
            return AlertDialog.adaptive(
              title: Text(
                'Add Documents',
                style: themeData.textTheme.headlineMedium,
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AsyncValueWidget(
                      value: ref.watch(listStaffProvider()),
                      data: (data) {
                        return GlobalDropdownMenu<Staff>(
                          entries: data.map(
                            (e) {
                              return DropdownMenuEntry(
                                value: e,
                                label: "${e.firstName} ${e.lastName}",
                              );
                            },
                          ).toList(),
                          onSelected: (value) {
                            uploader = value!;
                          },
                          enabled: isAdmin,
                          initialSelection: data.firstWhere((element) {
                            return element.id == user.id;
                          }),
                          text: "Uploader",
                        );
                      },
                    ),
                    GlobalDropdownMenu<Subcategory>(
                      entries: user.subcategories
                              ?.map(
                                (e) => DropdownMenuEntry(
                                  value: e.subcategory!,
                                  label: e.subcategory!.name,
                                ),
                              )
                              .toList() ??
                          [],
                      onSelected: (value) {
                        subcategory = value;
                      },
                      enabled: isAdmin,
                      text: "Choose a subcategory",
                      initialSelection: subcategory,
                    ),
                    GlobalDropdownMenu(
                      entries: const [
                        DropdownMenuEntry(value: true, label: "No"),
                        DropdownMenuEntry(value: true, label: "Yes"),
                        DropdownMenuEntry(value: null, label: "All"),
                      ],
                      onSelected: (value) {
                        archived = value!;
                      },
                      initialSelection: archived,
                      text: "Archived",
                    ),
                    MultiSelectFormField<Aircraft>(
                      title: "Select aircraft",
                      items: user.aircraft!.map(
                        (e) {
                          return e.aircraft!;
                        },
                      ).toList(),
                      toCard: (value) {
                        return CheckListCard<Aircraft>(
                          value: value,
                          title: Text(value.name),
                          // how to use this based on initial selections
                          selected: true,
                        );
                      },
                      initialValue: aircraft,
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
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
                                  progress: _fileProgress[file.name]);
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
                    if (!result) {
                      return;
                    }
                    if (!context.mounted) return;
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      DocumentsRoute().go(context);
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
                    if (subcategory == null || files.isEmpty) {
                      return;
                    }
                    final result = await showConfirmDialog(
                      context: context,
                      title: Text("Are you sure?"),
                      content: Text("Do you want to upload these documents?"),
                    );
                    if (!result) {
                      return;
                    }
                    // Show loading screen
                    _showLoading(true);
                    try {
                      await uploadFiles(
                        files,
                        uploader,
                        subcategory!,
                        aircraft,
                        archived,
                        issuedAt,
                        expiredAt,
                        (fileName, progress) {
                          setState(() {
                            _fileProgress[fileName] = progress;
                          });
                        },
                      );
                      ref.invalidate(documentsRepoProvider(
                          ref.read(documentFilterProvider(subcategory!))));
                      if (!context.mounted) return;
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        DocumentsRoute().go(context);
                      }
                    } catch (e) {
                      debugPrint('Error uploading files: $e');
                    } finally {
                      // Hide loading screen
                      _showLoading(false);
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
          },
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
