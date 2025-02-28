import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo.g.dart';

@Riverpod(dependencies: [])
FutureOr<Role> crewDocumentCategoriesRepo(
  Ref ref,
  CrewDocumentCategoryFilterState filter,
) async {
  final request = GraphQLRequest<String>(
    document: listCrewDocumentCategories,
    variables: {
      "filter": filter.toJson(),
      "id": filter.roleId,
    },
  );
  final response = await Amplify.API.query(request: request).response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  Map<String, dynamic> jsonMap = json.decode(response.data!);
  return Role.fromJson(jsonMap["getRole"]);
}
