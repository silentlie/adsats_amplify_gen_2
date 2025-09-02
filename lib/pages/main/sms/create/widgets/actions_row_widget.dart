import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/enum_label_extension.dart';
import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/read_check.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notice_form.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/service.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class ActionsRowWidget extends HookConsumerWidget with ConfirmDialogMixin {
  const ActionsRowWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final isEditMode = ref.watch(noticeFormProvider.select(
      (value) => value.editMode,
    ));
    final isDraft = ref.watch(noticeFormProvider.select(
      (value) => value.isDraft,
    ));
    final notifier = ref.read(noticeFormProvider.notifier);
    final isSafetyOfficer = ref.watch(isSafetyOfficerProvider);
    final type =
        ref.read(noticeFormProvider.select((value) => value.notice.type!),);
    final scrollController = useScrollController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
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
              if (!notifier.isNew()) readButton(ref, context),
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
                    final formState = Form.maybeOf(context);
                    if (formState == null) return;
                    formState.save();
                    final result = await showConfirmDialog(
                      context: context,
                      title: Text("Are you sure?"),
                      content: Text("Do you want to save?"),
                    );
                    if (result) {
                      await notifier.submit(false, (fileName, progress) {
                        // TODO: update file upload progress
                      });
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
                    if (!(formState.validate())) return;
                    final result = await showConfirmDialog(
                      context: context,
                      title: Text("Are you sure?"),
                      content: Text("Do you want to submit and send?"),
                    );
                    if (result) {
                      await notifier.submit(true, (fileName, progress) {
                        // TODO: update file upload progress
                      });
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
                    "Send ${type.label} to ${isSafetyOfficer ? "crew" : "safety officers"}",
                    style: TextStyle(color: colorScheme.onSecondary),
                  ),
                  icon: Icon(
                    Icons.mail,
                    color: colorScheme.onSecondary,
                  ),
                )
            ],
          ),
        ),
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
                  final service = ref.read(noticeServiceProvider);
                  return service.read(e);
                },
              ));
              ref.invalidate(readCheckProvider);
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
