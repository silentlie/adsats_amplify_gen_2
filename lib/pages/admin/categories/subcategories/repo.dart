import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo.g.dart';

@Riverpod(dependencies: [])
FutureOr<Category> subcategoriesRepo(
  Ref ref,
  SubcategoryFilterState filter,
) async {
  final request = GraphQLRequest<String>(
    document: listSubcategoriesGraphQL,
    variables: {
      "filter": filter.toJson(),
      "id": filter.categoryId,
    },
  );
  final response = await Amplify.API.query(request: request).response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  Map<String, dynamic> jsonMap = json.decode(response.data!);
  return Category.fromJson(jsonMap["getCategory"]);
}
