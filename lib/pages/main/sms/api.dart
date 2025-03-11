import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/s3.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<Notice> deleteNotice(Notice notice) async {
  try {
    final request = GraphQLRequest<String>(
      document: getNoticeDetails,
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
      (noticeDocument) => futures.add(deleteFile(noticeDocument, notice)),
    );
    futures.add(delete(notice));
    await Future.wait(futures);
    return notice;
  } on ApiException catch (e) {
    debugPrint('ApiExecption: delete Notice with ${notice.id} failed: $e');
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

Future<void> sendEmail(Notice notice, Iterable<Staff> staff) async {
  try {
    final request = GraphQLRequest<String>(
      document: sendNoticeEmail,
      variables: {
        "subject": notice.subject,
        "recipients": staff
            .map(
              (e) => e.email,
            )
            .toList(),
        "status": notice.status!.name,
        "type": notice.type!.name,
        "noticedAt": notice.noticedAt?.toString(),
        "deadlineAt": notice.deadlineAt?.toString(),
        "details": notice.details,
        "author": notice.author!.name,
      },
    );
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    // Map<String, dynamic> jsonMap = json.decode(response.data!);
  } on ApiException catch (e) {
    debugPrint('send notice email failed: $e');
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
        GraphQLRequest<String>(document: listJoinRecipients, variables: {
      "aircraft": aircraftFilter,
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
              (element.aircraft?.isNotEmpty ?? false) &&
              (element.roles?.isNotEmpty ?? false),
        );
    recipients.addAll(staff);
    return recipients.fold<Map<String, Staff>>({}, (map, staff) {
      map.putIfAbsent(staff.id, () => staff);
      return map;
    }).values;
  } on ApiException catch (e) {
    debugPrint('ApiExecption: fetchJoinRecipients failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint('Dart Exception: fetchJoinRecipients failed: $e');
    rethrow;
  }
}
