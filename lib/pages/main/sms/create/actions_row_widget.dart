import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/helper/selected_files.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notice/read_check.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/state.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ActionsRowWidget extends ConsumerWidget {
  const ActionsRowWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final isEditMode = ref.watch(noticeNotifierProvider.select(
      (value) => value.editMode,
    ));
    final isDraft = ref.watch(noticeNotifierProvider.select(
      (value) => value.isDraft,
    ));
    final notifier = ref.read(noticeNotifierProvider.notifier);
    final formState = ref.watch(noticeNotifierProvider).formKey.currentState!;
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
          if (notifier.isEditable()) readButton(ref, context),
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
              label: const Text("Attachments Documents"),
              icon: Icon(Icons.description_outlined),
            ),
          if (isEditMode)
            ElevatedButton.icon(
              onPressed: () async {
                // if (!formState.validate()) return;
                final result = await showConfirmDialog(
                  context,
                  Text("Are you sure?"),
                  Text("Do you want to save?"),
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
                if (!formState.validate()) return;
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
                    SmsInboxRoute().go(context);
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

  Widget readButton(WidgetRef ref, BuildContext context) {
    return AsyncValueWidget(
      value: ref.watch(readCheckProvider),
      data: (value) {
        if (value.isEmpty) {
          return ElevatedButton.icon(
            onPressed: () {},
            label: const Text('You\'ve read this notice'),
            icon: Icon(Icons.mark_email_read_outlined),
          );
        } else {
          return ElevatedButton.icon(
            onPressed: () async {
              await Future.wait(value.map(
                (e) {
                  return update(e.copyWith(readAt: TemporalDateTime.now()));
                },
              ));
              ref.invalidate(readCheckProvider);
              ref.invalidate(userDetailsProvider);
              if (!context.mounted) return;
              if (context.canPop()) {
                context.pop();
              } else {
                SmsInboxRoute().go(context);
              }
            },
            label: const Text('Mark as read'),
            icon: Icon(Icons.mark_email_unread_outlined),
          );
        }
      },
    );
  }
}
