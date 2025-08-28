import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo.g.dart';

@Riverpod(dependencies: [])
class DocumentsRepo extends _$DocumentsRepo {
  @override
  FutureOr<List<Document>> build(DocumentFilterState filter) async {
    final request = GraphQLRequest<String>(
      document: listDocumentsGraphQL,
      variables: {"filter": filter.toJson()},
    );
    final query = Amplify.API.query(request: request);
    ref.onDispose(query.cancel);
    final response = await query.response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    Map<String, dynamic> jsonMap = json.decode(response.data!);
    return (jsonMap["listDocuments"]["items"] as List).map(
      (document) {
        return Document.fromJson(document);
      },
    ).toList();
  }
}
