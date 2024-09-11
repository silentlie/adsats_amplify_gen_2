import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<void> create(Aircraft aircraft) async {
  try {
    final request = ModelMutations.create(aircraft);
    final response = await Amplify.API.mutate(request: request).response;

    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // print('Add aircraft result: ${data.name}');
  } on ApiException catch (e) {
    debugPrint('Add aircraft failed: $e');
  }
}

Future<void> update(Aircraft aircraft) async {
  try {
    final request = ModelMutations.update(aircraft);
    final response = await Amplify.API.mutate(request: request).response;

    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // print('Update aircraft result: $data');
  } on ApiException catch (e) {
    debugPrint('Update aircraft failed: $e');
  }
}

Future<void> delete(Aircraft aircraft) async {
  try {
    final request = GraphQLRequest<String>(
      document: deleteAircraftOverride,
      variables: {"aircraftId": aircraft.id},
    );
    final response = await Amplify.API.mutate(request: request).response;
    final data = response.data;
    if (data == null) {
      debugPrint('errors: ${response.errors}');
      return;
    }
    // print('Delete aircraft result: $data');
  } on ApiException catch (e) {
    debugPrint('Delete aircraft failed: $e');
  }
}

Future<void> createAircraftStaff(List<AircraftStaff> staffList) async {
  try {
    final futures = staffList.map((staff) async {
      final request = ModelMutations.create(staff);
      final response = await Amplify.API.mutate(request: request).response;

      final createdAircraftStaff = response.data;
      if (createdAircraftStaff == null) {
        debugPrint('Error creating aircraft staff: ${response.errors}');
        return;
      }
    }).toList();

    await Future.wait(futures);
  } on ApiException catch (e) {
    debugPrint('Create aircraft staff failed: $e');
  }
}

Future<void> deleteAircraftStaff(List<AircraftStaff> staffList) async {
  try {
    final futures = staffList.map((staff) async {
      final request = ModelMutations.delete(staff);
      final response = await Amplify.API.mutate(request: request).response;

      final deletedAircraftStaff = response.data;
      if (deletedAircraftStaff == null) {
        debugPrint('Error deleting aircraft staff: ${response.errors}');
        return;
      }
    }).toList();

    await Future.wait(futures);
  } on ApiException catch (e) {
    debugPrint('Delete aircraft staff failed: $e');
  }
}
