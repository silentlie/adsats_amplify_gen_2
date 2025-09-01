import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/models/filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo.g.dart';

// TODO to delete
@Riverpod(dependencies: [])
FutureOr<List<FlightCrewRecord>> flightCrewRecordsRepo(
  Ref ref,
  FlightCrewRecordFilterState filter,
) async {
  final request = GraphQLRequest<String>(
    document: listFlightCrewRecordsGraphQL,
    variables: {
      "filter": filter.toJson(),
    },
  );
  final response = await Amplify.API.query(request: request).response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  Map<String, dynamic> jsonMap = json.decode(response.data!);
  return (jsonMap["listFlightCrewRecords"]["items"] as List).map(
    (document) {
      return FlightCrewRecord.fromJson(document);
    },
  ).toList();
}

@Riverpod(dependencies: [userDetails])
FutureOr<(Iterable<Aircraft>, Iterable<Role>)> flightCrewRecordsMeta(
    Ref ref) async {
  final request = GraphQLRequest<String>(
    document: listFlightCrewRecordsMetaGraphQL,
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
  final userDetails = await ref.read(userDetailsProvider.future);
  // Reorder aircraft based on userDetails.aircraft
  final userAircraftIds = userDetails.aircraft!.map((a) => a.aircraft!.id);
  final reorderedAircraft = [
    ...aircraft.where((a) => userAircraftIds.contains(a.id)),
    ...aircraft.where((a) => !userAircraftIds.contains(a.id)),
  ];

  // Reorder roles based on userDetails.roles
  final userRoleIds = userDetails.roles!.map((r) => r.role!.id);
  final reorderedRoles = [
    ...roles.where((r) => userRoleIds.contains(r.id)),
    ...roles.where((r) => !userRoleIds.contains(r.id)),
  ];
  return (reorderedAircraft, reorderedRoles);
}

@Riverpod()
FutureOr<Iterable<Staff>> listJoinStaff(
  Ref ref,
  Aircraft aircraft,
  Role role,
) async {
  final request = GraphQLRequest<String>(
      document: listFlightCrewRecordsCrewsGraphQL,
      variables: {
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
      .where((element) => element.aircraft!.isNotEmpty);
  return staff;
}
