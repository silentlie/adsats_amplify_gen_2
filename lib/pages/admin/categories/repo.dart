import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/Category.dart';
import 'package:adsats_amplify_gen_2/pages/admin/filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo.g.dart';

@Riverpod(dependencies: [])
FutureOr<List<Category>> categoriesRepo(
  Ref ref,
  AdminFilterState filter,
) async {
  final request = GraphQLRequest<String>(
    document: listCategories,
    variables: {"filter": filter.toJson()},
  );
  final response = await Amplify.API.query(request: request).response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  Map<String, dynamic> jsonMap = json.decode(response.data!);
  return (jsonMap["listCategories"]["items"] as List).map(
    (document) {
      return Category.fromJson(document);
    },
  ).toList();
}
