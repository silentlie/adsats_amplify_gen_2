import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/providers/form.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ReportActionsRow extends ConsumerWidget with ConfirmDialogMixin {
  const ReportActionsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final isEditMode = ref.watch(reportFormProvider.select(
      (value) => value.editMode,
    ));
    final isDraft = ref.watch(reportFormProvider.select(
      (value) => value.isDraft,
    ));
    final notifier = ref.read(reportFormProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              final result = await showConfirmDialog(
                context: context,
                title: Text("Are you sure?"),
                content: Text("Do you want to cancel?"),
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
          if (!notifier.isNew() && notifier.editPermit())
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
                    await FilePicker.pickFiles(
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
                final formState = Form.maybeOf(context);
                if (formState == null) return;
                formState.save();
                final result = await showConfirmDialog(
                  context: context,
                  title: Text("Are you sure?"),
                  content: Text("Do you want to save?"),
                );
                if (result) {
                  await notifier.submit(
                    false,
                    (fileName, progress) {
                      // TODO update upload status
                    },
                  );

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
                final formState = Form.maybeOf(context);
                if (formState == null) return;
                formState.save();
                if (!formState.validate()) return;
                final result = await showConfirmDialog(
                  context: context,
                  title: Text("Are you sure?"),
                  content: Text("Do you want to submit and send?"),
                );
                if (result) {
                  await notifier.submit(
                    true,
                    (fileName, progress) {
                      // TODO update upload status
                    },
                  );
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
}
