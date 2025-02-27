import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/Aircraft.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo.g.dart';

@Riverpod(dependencies: [])
FutureOr<List<Aircraft>> aircraftRepo(Ref ref, AircraftFilterState filter,) async {
  final request = GraphQLRequest<String>(
    document: listAircraft,
    variables: {"filter": filter.toJson()},
  );
  final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
  return (jsonMap["listAircraft"]["items"] as List).map(
    (document) {
      return Aircraft.fromJson(document);
    },
  ).toList();
}