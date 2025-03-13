import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/crew_documents/filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo.g.dart';

@Riverpod(dependencies: [])
FutureOr<List<CrewDocument>> crewDocumentsRepo(
  Ref ref,
  CrewDocumentFilterState filter,
) async {
  final request = GraphQLRequest<String>(
    document: listCrewDocuments,
    variables: {"filter": filter.toJson()},
  );
  final response = await Amplify.API.query(request: request).response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  Map<String, dynamic> jsonMap = json.decode(response.data!);
  return (jsonMap["listCrewDocuments"]["items"] as List).map(
    (document) {
      return CrewDocument.fromJson(document);
    },
  ).toList();
}

@Riverpod()
FutureOr<(Iterable<Aircraft>, Iterable<Role>)> crewDocumentsMeta(
    Ref ref) async {
  final request = GraphQLRequest<String>(
    document: listCrewDocumentMeta,
  );
  final response = await Amplify.API.query(request: request).response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  Map<String, dynamic> jsonMap = json.decode(response.data!);
  final aircraft = (jsonMap["listAircraft"]["items"] as List)
      .map((item) => Aircraft.fromJson(item));
  final roles = (jsonMap["listRoles"]["items"] as List)
      .map((item) => Role.fromJson(item));
  return (aircraft, roles);
}

@Riverpod()
FutureOr<Iterable<Staff>> listJoinStaff(
  Ref ref,
  Aircraft aircraft,
  Role role,
) async {
  final request =
      GraphQLRequest<String>(document: listCrewDocumentCrews, variables: {
    "aircraftId": aircraft.id,
    "roleId": role.id,
  });
  final response = await Amplify.API.query(request: request).response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  Map<String, dynamic> jsonMap = json.decode(response.data!);
  final staff = (jsonMap["getRole"]["staff"]["items"] as List)
      .map((e) => Staff.fromJson(e["staff"]))
      .where((element) => element.aircraft?.isNotEmpty ?? false);
  return staff;
}
