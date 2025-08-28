import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/API/send_email.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/enum_label_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/s3.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<Notice> deleteNotice(Notice notice) async {
  try {
    final request = GraphQLRequest<String>(
      document: getNoticeDetailsGraphQL,
      variables: {"id": notice.id},
    );
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    Map<String, dynamic> jsonMap = json.decode(response.data!);
    Notice returnNotice = Notice.fromJson(jsonMap["getNotice"]);
    final List<Future> futures = [];
    returnNotice.recipients?.forEach(
      (noticeStaff) => futures.add(delete(noticeStaff)),
    );
    returnNotice.aircraft?.forEach(
      (aircraftNotice) => futures.add(delete(aircraftNotice)),
    );
    returnNotice.documents?.forEach(
      (noticeDocument) =>
          futures.add(deleteNoticeDocumentFile(noticeDocument, notice)),
    );
    futures.add(delete(notice));
    await Future.wait(futures);
    return notice;
  } on ApiException catch (e) {
    debugPrint('ApiException: delete Notice with ${notice.id} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint('Dart Exception: delete Notice with ${notice.id} failed: $e');
    rethrow;
  }
}

Future<void> updateAircraftNotice(
  Notice oldNotice,
  Notice newNotice,
) async {
  try {
    final List<Future> futures = [];
    final oldRecords = oldNotice.aircraft ?? [];
    final newRecords = newNotice.aircraft ?? [];
    final Map<String, AircraftNotice> oldMap = {
      for (var oldAircraft in oldRecords) oldAircraft.aircraft!.id: oldAircraft
    };
    for (var newAircraft in newRecords) {
      final oldRecord = oldMap.remove(newAircraft.id);
      if (oldRecord == null) {
        futures.add(
          create(AircraftNotice(
            aircraft: newAircraft.aircraft!,
            notice: oldNotice,
          )),
        );
      }
    }
    for (var oldRecord in oldMap.values) {
      futures.add(delete(oldRecord));
    }
    await Future.wait(futures);
  } on ApiException catch (e) {
    debugPrint('update aircraft notice failed: $e');
  }
}

Future<Iterable<Staff>> fetchJoinRecipients({
  required Notice notice,
  required List<Role> roles,
}) async {
  final aircraft = notice.aircraft!.map((e) => e.aircraft!);
  final recipients = notice.recipients!.map((e) => e.staff!).toList();
  if (aircraft.isEmpty || roles.isEmpty) return recipients;
  Map<String, dynamic> aircraftFilter = {
    "or": aircraft
        .map(
          (aircraft) => {
            "aircraftId": {"eq": aircraft.id}
          },
        )
        .toList()
  };
  Map<String, dynamic> rolesFilter = {
    "or": roles
        .map(
          (role) => {
            "roleId": {"eq": role.id}
          },
        )
        .toList()
  };
  try {
    final request =
        GraphQLRequest<String>(document: listJoinRecipientsGraphQL, variables: {
      "aircraftFilter": aircraftFilter,
      "rolesFilter": rolesFilter,
    });
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    Map<String, dynamic> jsonMap = json.decode(response.data!);
    final staff = (jsonMap["listStaff"]["items"] as List)
        .map((e) => Staff.fromJson(e))
        .where(
          (element) =>
              (element.aircraft!.isNotEmpty) && (element.roles!.isNotEmpty),
        );

    recipients.addAll(staff);
    return recipients.fold<Map<String, Staff>>({}, (map, staff) {
      map.putIfAbsent(staff.id, () => staff);
      return map;
    }).values;
  } on ApiException catch (e) {
    debugPrint('ApiException: fetchJoinRecipients failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint('Dart Exception: fetchJoinRecipients failed: $e');
    rethrow;
  }
}

Future<void> updateNoticeStaff(
  Notice? oldNotice,
  Notice newNotice,
  Iterable<Staff> recipients,
) async {
  try {
    // Create a copy of recipients to avoid modifying the original list
    final newRecipients = List<Staff>.from(recipients);

    // Wait for all futures to complete
    await Future.wait([
      sendNoticeEmail(newNotice, recipients),
      // Handle existing recipients
      ...oldNotice?.recipients!.map(
            (e) {
              if (newRecipients.contains(e.staff)) {
                // Keep existing staff and remove from new recipients
                newRecipients.remove(e.staff);
                return update(
                  NoticeStaff(
                    id: e.id,
                    staff: e.staff,
                    notice: e.notice,
                  ),
                );
              } else {
                // Remove staff that are no longer recipients
                return delete(e);
              }
            },
          ) ??
          [],
      // Add new recipients
      ...newRecipients.map(
        (staff) => create(
          NoticeStaff(
            notice: newNotice,
            staff: staff,
          ),
        ),
      ),
    ]);
  } on ApiException catch (e) {
    debugPrint('ApiException: send notice failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint('Dart Exception: send notice failed: $e');
    rethrow;
  }
}

Future<void> sendNoticeEmail(Notice notice, Iterable<Staff> staff) async {
  if (staff.isEmpty) return;
  final subject =
      "${notice.type!.label}: ${notice.subject} [${notice.status!.name}]";
  final htmlBody = buildNoticeEmailMain(notice);
  final sender = "${notice.author!.firstName} ${notice.author!.lastName}";
  final recipients = staff.map((e) => e.email).toList();
  await sendEmail(
    subject: subject,
    sender: sender,
    htmlMain: htmlBody,
    recipients: recipients,
  );
}
