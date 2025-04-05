import 'package:adsats_amplify_gen_2/API/query_providers.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/helper/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/s3.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class NewDocumentDialog extends ConsumerWidget {
  const NewDocumentDialog({
    super.key,
    this.subcategory,
  });

  final Subcategory? subcategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    return AsyncValueWidget(
      value: ref.watch(userDetailsProvider),
      data: (user) {
        Staff uploader = user;
        Subcategory? subcategory = this.subcategory;
        List<Aircraft> aircraft = [];
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
                  value: ref.watch(ListStaffProvider()),
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
                      enabled: ref.watch(isAdminProvider),
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
                  enabled: this.subcategory == null,
                  text: "Choose a subcategory",
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 666),
                  child: GlobalMultiSelect<Aircraft>(
                    text: "Add aircraft",
                    onConfirm: (selectedOptions) {
                      aircraft = selectedOptions;
                    },
                    items: user.aircraft?.map(
                          (e) {
                            return MultiSelectItem(
                              e.aircraft!,
                              e.aircraft!.name,
                            );
                          },
                        ).toList() ??
                        [],
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final selectedFiles = ref.watch(selectedFilesProvider);
                    return Column(
                      children: selectedFiles.map((file) {
                        return Chip(
                          label: Text(file.name),
                          onDeleted: () {
                            ref
                                .read(selectedFilesProvider.notifier)
                                .removeFile(file);
                          },
                        );
                      }).toList(),
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
                  context,
                  Text("Are you sure?"),
                  Text("Do you want to cancel?"),
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
                  context,
                  Text("Are you sure?"),
                  Text("Do you want to upload these documents?"),
                );
                if (!result) {
                  return;
                }
                await uploadFiles(
                  files,
                  uploader,
                  subcategory!,
                  aircraft,
                );
                ref.invalidate(documentsRepoProvider(
                    ref.read(documentFilterProvider(subcategory!))));
                if (!context.mounted) return;
                if (context.canPop()) {
                  context.pop();
                } else {
                  DocumentsRoute().go(context);
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
    );
  }
}
