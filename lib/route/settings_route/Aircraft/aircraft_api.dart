import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<Aircraft> deleteAicraft(Aircraft aircraft) async {
  try {
    final request = GraphQLRequest<String>(
      document: getAircraftDetails,
      variables: {"id": aircraft.id},
    );
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    Map<String, dynamic> jsonMap = json.decode(response.data!);
    Aircraft returnAircraft = Aircraft.fromJson(jsonMap["getAircraft"]);
    final List<Future> futures = [];
    returnAircraft.staff?.forEach(
      (aircraftStaff) => futures.add(delete(aircraftStaff)),
    );
    returnAircraft.document?.forEach(
      (aircraftDocument) => futures.add(delete(aircraftDocument)),
    );
    returnAircraft.notices?.forEach(
      (aircraftNotice) => futures.add(delete(aircraftNotice)),
    );
    futures.add(delete(aircraft));
    Future.wait(futures);
    return aircraft;
  } on ApiException catch (e) {
    debugPrint('ApiExecption: delete Aircraft with ${aircraft.id} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: delete Aircraft with ${aircraft.id} failed: $e');
    rethrow;
  }
}

Future<void> updateAircraftStaff(Aircraft aircraft, List<Staff> staff) async {
  try {
    final List<Future> futures = [];
    final oldRecords = aircraft.staff ?? [];
    final Map<String, AircraftStaff> oldMap = {
      for (var oldRecord in oldRecords) oldRecord.staff!.id: oldRecord
    };
    for (var newStaff in staff) {
      final oldRecord = oldMap.remove(newStaff.id);
      if (oldRecord == null) {
        futures.add(create(AircraftStaff(aircraft: aircraft, staff: newStaff)));
      }
    }
    for (var oldRecord in oldMap.values) {
      futures.add(delete(oldRecord));
    }
    await Future.wait(futures);
  } on ApiException catch (e) {
    debugPrint('update role staff failed: $e');
  }
}
