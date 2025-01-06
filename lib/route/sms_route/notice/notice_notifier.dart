import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
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
  late List<Staff> recipients;

  NoticeNotifier.noticeToCrew({
    this.notice,
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
    recipients = notice?.recipients?.map((e) => e.staff!).toList() ?? [];
  }

  Future<void> saveNotice(bool sendNotice) async {
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
    }
  }
}
