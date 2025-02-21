import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_notifier.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/sms_widget.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ActionsRowWidget extends StatelessWidget {
  const ActionsRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    final noticeNotifier = Provider.of<NoticeNotifier>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                context.go(SMSWidget.path);
              },
              label: const Text('Cancel'),
            ),
          ),
          if (noticeNotifier.notice != null)
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: FutureBuilder(
                future: list(
                  NoticeStaff.classType,
                  where: NoticeStaff.STAFF
                      .eq(authNotifier.user.id)
                      .and(NoticeStaff.NOTICE.eq(noticeNotifier.notice!.id)),
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final unreadList = snapshot.data!
                        .where((element) => element.readAt == null)
                        .toList();
                    if (unreadList.isEmpty) {
                      return ElevatedButton.icon(
                        onPressed: () {},
                        label: const Text('You\'ve read this notice'),
                        icon: Icon(Icons.mark_email_read_outlined),
                      );
                    } else {
                      return ElevatedButton.icon(
                        onPressed: () async {
                          await Future.wait(unreadList.map(
                            (e) => update(
                                e.copyWith(readAt: TemporalDateTime.now())),
                          ));
                          if (!context.mounted) return;
                          context.go(SMSWidget.path);
                        },
                        label: const Text('Mark as read'),
                        icon: Icon(Icons.mark_email_unread_outlined),
                      );
                    }
                  }
                },
              ),
            ),
          if (noticeNotifier.notice != null &&
              (authNotifier.isSafetyOfficer || authNotifier.isAdmin))
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  noticeNotifier.setState(() {
                    noticeNotifier.editMode = !noticeNotifier.editMode;
                  });
                },
                label: noticeNotifier.editMode
                    ? const Text('View Mode')
                    : const Text('Edit Mode'),
              ),
            ),
          if (noticeNotifier.editMode)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ElevatedButton.icon(
                onPressed: () async {
                  FilePickerResult? filePickerResult =
                      await FilePicker.platform.pickFiles(
                    allowMultiple: true,
                    type: FileType.any,
                    withData: false,
                    // Ensure to get file stream for better performance
                    withReadStream: true,
                  );
                  noticeNotifier.addFiles(filePickerResult?.files ?? []);
                },
                label: const Text("Pick file"),
                icon: Icon(Icons.description_outlined),
              ),
            ),
          if (noticeNotifier.editMode)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ElevatedButton.icon(
                onPressed: () async {
                  await noticeNotifier.saveNotice(false);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    colorScheme.secondary,
                  ),
                ),
                label: Text('Save',
                    style: TextStyle(color: colorScheme.onSecondary)),
                icon: Icon(Icons.mail, color: colorScheme.onSecondary),
              ),
            ),
          if (noticeNotifier.editMode &&
              noticeNotifier.status != NoticeStatus.Draft)
            ElevatedButton.icon(
              onPressed: () async {
                await noticeNotifier.saveNotice(true);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  colorScheme.secondary,
                ),
              ),
              label: Text(
                'Submit and Send',
                style: TextStyle(color: colorScheme.onSecondary),
              ),
              icon: Icon(
                Icons.mail,
                color: colorScheme.onSecondary,
              ),
            ),
        ],
      ),
    );
  }
}
