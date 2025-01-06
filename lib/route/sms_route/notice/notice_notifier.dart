import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_api.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/sms_widget.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NoticeNotifier extends ChangeNotifier {
  final BuildContext context;
  final formKey = GlobalKey<FormState>();
  Notice? notice;
  late final String id;
  late bool editMode;
  late NoticeType type;
  late NoticeStatus status;
  late bool archived;
  late Staff author;
  late String subject;
  TemporalDateTime? noticedAt;
  TemporalDateTime? deadlineAt;
  late final Map<String, dynamic> details;
  late List<NoticeDocument> documents;
  late List<Aircraft> aircraft;
  List<Role> roles = [];
  List<Staff> recipients = [];

  NoticeNotifier.noticeToCrew({
    Notice? notice,
    required this.context,
  }) {
    editMode = notice == null;
    id = notice?.id ?? "";
    type = notice?.type ?? NoticeType.Notice_to_Crew;
    status = notice?.status ?? NoticeStatus.Draft;
    archived = notice?.archived ?? false;
    author = notice?.author ??
        Provider.of<AuthNotifier>(context, listen: false).user;
    subject = notice?.subject ?? "";
    noticedAt = notice?.noticed_at;
    deadlineAt = notice?.deadline_at;
    details = json.decode(notice?.details ?? "{}") as Map<String, dynamic>;
    documents = notice?.documents ?? [];
    aircraft = notice?.aircraft?.map((e) => e.aircraft!).toList() ?? [];
  }

  Widget actionsRow(BuildContext context, Function(VoidCallback) setState) {
    final colorScheme = Theme.of(context).colorScheme;
    final authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            context.go(SMSWidget.path);
          },
          label: const Text('Cancel'),
        ),
        const SizedBox(width: 10),
        readButton(context),
        const SizedBox(width: 10),
        if (notice != null && (authNotifier.isEditor || authNotifier.isAdmin))
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                editMode = !editMode;
              });
            },
            label: editMode ? const Text('View Mode') : const Text('Edit Mode'),
          ),
        const SizedBox(width: 10),
        if (editMode)
          ElevatedButton.icon(
            onPressed: () async {
              await saveNotice(context, false);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                colorScheme.secondary,
              ),
            ),
            label:
                Text('Save', style: TextStyle(color: colorScheme.onSecondary)),
            icon: Icon(Icons.mail, color: colorScheme.onSecondary),
          ),
        const SizedBox(width: 10),
        if (editMode)
          ElevatedButton.icon(
            onPressed: () async {
              await saveNotice(context, true);
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
    );
  }

  Widget readButton(BuildContext context) {
    final authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    if (notice == null) return SizedBox();
    return FutureBuilder(
      future: list(
        NoticeStaff.classType,
        where: NoticeStaff.STAFF
            .eq(authNotifier.user.id)
            .and(NoticeStaff.NOTICE.eq(notice!.id)),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final unreadList = snapshot.data!
              .where((element) => element.read_at == null)
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
                  (e) => update(e.copyWith(read_at: TemporalDateTime.now())),
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
    );
  }

  Future<void> saveNotice(BuildContext context, bool sendNotice) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final newNotice = Notice(
        id: notice?.id,
        type: type,
        status: status,
        author: author,
        noticed_at: noticedAt,
        deadline_at: deadlineAt,
        subject: subject,
        archived: archived,
        details: jsonEncode(details),
      );
      if (notice == null) {
        await Future.wait([
          create(newNotice),
          ...aircraft.map(
              (e) => create(AircraftNotice(aircraft: e, notice: newNotice))),
          ...documents.map(
              (e) => create(NoticeDocument(name: e.name, notices: newNotice)))
        ]);
      } else {
        await Future.wait([
          update(newNotice),
          updateAircraftNotice(newNotice, aircraft),
        ]);
      }
      if (sendNotice) {
        await Future.wait(recipients.map(
          (e) => create(NoticeStaff(staff: e, notice: newNotice)),
        ));
      }
      if (!context.mounted) return;
      context.go(SMSWidget.path);
    }
  }
}
