import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo.g.dart';

@Riverpod(dependencies: [userId])
FutureOr<Iterable<Role>> profileRepo(Ref ref) async {
  final id = await ref.watch(userIdProvider.future);
  final request = GraphQLRequest<String>(
    document: listProfileMetaGraphQL,
    variables: {"id": id},
  );
  final response = await Amplify.API.query(request: request).response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  Map<String, dynamic> jsonMap = json.decode(response.data!);
  return (jsonMap["listRoles"]["items"] as List).map(
    (e) {
      return Role.fromJson(e);
    },
  ).where(
    (element) {
      return element.staff!.isNotEmpty;
    },
  );
}
