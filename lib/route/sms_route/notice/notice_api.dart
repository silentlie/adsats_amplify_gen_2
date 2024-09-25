import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<Notice> deleteNotice(Notice notice)async {
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
      (noticeDocument) => futures.add(delete(noticeDocument)),
    );
    futures.add(delete(notice));
    Future.wait(futures);
    return notice;
  } on ApiException catch (e) {
    debugPrint('ApiExecption: delete Notice with ${notice.id} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: delete Notice with ${notice.id} failed: $e');
    rethrow;
  }
}

Future<void> updateAircraftNotice(Notice notice, List<Aircraft> aircraft) async {
  try {
    final List<Future> futures = [];
    final oldRecords = notice.aircraft ?? [];
    final Map<String, AircraftNotice> oldMap = {
      for (var oldRecord in oldRecords) oldRecord.aircraft!.id: oldRecord
    };
    for (var newAircraft in aircraft) {
      final oldRecord = oldMap.remove(newAircraft.id);
      if (oldRecord == null) {
        futures.add(create(AircraftNotice(aircraft: newAircraft, notice: notice)));
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
