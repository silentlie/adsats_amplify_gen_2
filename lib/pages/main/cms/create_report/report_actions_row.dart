import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/helper/selected_files.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create_report/state.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ReportActionsRow extends ConsumerWidget {
  const ReportActionsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final isEditMode = ref.watch(reportNotifierProvider.select(
      (value) => value.editMode,
    ));
    final isDraft = ref.watch(reportNotifierProvider.select(
      (value) => value.isDraft,
    ));
    final notifier = ref.read(reportNotifierProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              final result = await showConfirmDialog(
                context,
                Text("Are you sure?"),
                Text("Do you want to cancel?"),
              );
              if (result && context.mounted) {
                if (context.canPop()) {
                  context.pop();
                } else {
                  SmsSentRoute().go(context);
                }
              }
            },
            label: const Text('Cancel'),
            icon: Icon(Icons.cancel_outlined),
          ),
          // if (notifier.isEditable()) readButton(ref),
          if (notifier.isEditable() && notifier.editPermit())
            ElevatedButton.icon(
              onPressed: () {
                notifier.switchEditMode();
              },
              label: Text(
                isEditMode ? 'View Mode' : 'Edit Mode',
              ),
              icon: Icon(
                isEditMode
                    ? Icons.remove_red_eye_outlined
                    : Icons.edit_outlined,
              ),
            ),
          if (isEditMode)
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
                ref
                    .read(selectedFilesProvider.notifier)
                    .addFiles(filePickerResult?.files ?? []);
              },
              label: const Text("Attached Documents"),
              icon: Icon(Icons.description_outlined),
            ),
          if (isEditMode)
            ElevatedButton.icon(
              onPressed: () async {
                // if (!notifier.validate()) return;
                final result = await showConfirmDialog(
                  context,
                  Text("Are you sure?"),
                  Text("Do you want to submid and save?"),
                );
                if (result) {
                  await notifier.submit(false);
                  if (!context.mounted) return;
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    SmsSentRoute().go(context);
                  }
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  colorScheme.secondary,
                ),
              ),
              label: Text(
                "Save",
                style: TextStyle(color: colorScheme.onSecondary),
              ),
              icon: Icon(
                Icons.mail,
                color: colorScheme.onSecondary,
              ),
            ),
          if (isEditMode && !isDraft)
            ElevatedButton.icon(
              onPressed: () async {
                if (!notifier.validate()) return;
                final result = await showConfirmDialog(
                  context,
                  Text("Are you sure?"),
                  Text("Do you want to submit and send?"),
                );
                if (result) {
                  await notifier.submit(true);
                  if (!context.mounted) return;
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    CmsSentRoute().go(context);
                  }
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  colorScheme.secondary,
                ),
              ),
              label: Text(
                "Submit and Send",
                style: TextStyle(color: colorScheme.onSecondary),
              ),
              icon: Icon(
                Icons.mail,
                color: colorScheme.onSecondary,
              ),
            )
        ],
      ),
    );
  }

  // Widget readButton(WidgetRef ref) {
  //   return AsyncValueWidget(
  //     value: ref.watch(readCheckProvider),
  //     data: (value) {
  //       if (value.isEmpty) {
  //         return ElevatedButton.icon(
  //           onPressed: () {},
  //           label: const Text('You\'ve read this notice'),
  //           icon: Icon(Icons.mark_email_read_outlined),
  //         );
  //       } else {
  //         return ElevatedButton.icon(
  //           onPressed: () async {
  //             await Future.wait(value.map(
  //               (e) {
  //                 return update(e.copyWith(readAt: TemporalDateTime.now()));
  //               },
  //             ));
  //             ref.invalidate(readCheckProvider);
  //           },
  //           label: const Text('Mark as read'),
  //           icon: Icon(Icons.mark_email_unread_outlined),
  //         );
  //       }
  //     },
  //   );
  // }
}
