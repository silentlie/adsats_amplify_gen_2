import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list.g.dart';

@Riverpod()
FutureOr<List<Staff>> listStaff(
  Ref ref,
  [QueryPredicate<Staff>? where]
) async {
  final request = ModelQueries.list<Staff>(Staff.classType, where: where);
  final response = await Amplify.API
      .query<PaginatedResult<Staff>>(request: request)
      .response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  return response.data!.items.cast<Staff>();
}

@Riverpod()
FutureOr<List<Document>> listDocuments(
  Ref ref,
  [QueryPredicate<Document>? where]
) async {
  final request = ModelQueries.list<Document>(Document.classType, where: where);
  final response = await Amplify.API
      .query<PaginatedResult<Document>>(request: request)
      .response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  return response.data!.items.cast<Document>();
}
