import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

Future<Subcategory> deleteSubcategory(Subcategory subcategory) async {
  try {
    final request = GraphQLRequest<String>(
      document: getSubcategoryDetails,
      variables: {"id": subcategory.id},
    );
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    Map<String, dynamic> jsonMap = json.decode(response.data!);
    Subcategory returnSubcategory =
        Subcategory.fromJson(jsonMap["getSubcategory"]);
    final List<Future> futures = [];
    returnSubcategory.staff?.forEach(
      (staffSubcategory) => futures.add(delete(staffSubcategory)),
    );
    futures.add(delete(subcategory));
    await Future.wait(futures);
    return subcategory;
  } on ApiException catch (e) {
    debugPrint(
        'ApiExecption: delete Subcategory with ${subcategory.id} failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint(
        'Dart Exception: delete Subcategory with ${subcategory.id} failed: $e');
    rethrow;
  }
}

Future<void> updateStaffSubcategory(
    List<StaffSubcategory> oldStaffSubcategories,
    List<StaffSubcategory> staffSubcategories) async {
  try {
    if (oldStaffSubcategories.isEmpty && staffSubcategories.isEmpty) {
      return;
    }
    if (oldStaffSubcategories.isEmpty) {
      await Future.wait(
        staffSubcategories.map((newRecord) => create(newRecord)),
      );
      return;
    } else if (staffSubcategories.isEmpty) {
      await Future.wait(
        oldStaffSubcategories.map((oldRecord) => delete(oldRecord)),
      );
      return;
    }
    final List<Future> futures = [];
    final Map<ModelIdentifier, StaffSubcategory> newMap = {
      for (var newRecord in staffSubcategories)
        newRecord.modelIdentifier: newRecord
    };
    for (var oldRecord in oldStaffSubcategories) {
      final newRecord = newMap.remove(oldRecord.modelIdentifier);
      if (newRecord == null) {
        futures.add(delete(oldRecord));
      } else if (newRecord.accessLevel != oldRecord.accessLevel) {
        futures.add(update(newRecord));
      }
    }
    for (var newRecord in newMap.values) {
      futures.add(create(newRecord));
    }
    await Future.wait(futures);
  } on ApiException catch (e) {
    debugPrint('ApiExecption: update StaffSubcategory failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint('Dart Exception: delete StaffSubcategory failed: $e');
    rethrow;
  }
}
