import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo.g.dart';

@Riverpod(dependencies: [])
FutureOr<List<Notice>> noticesSentRepo(
  Ref ref,
  NoticeFilterState filter,
) async {
  final filterJson = filter.toJson();
  filterJson["staffId"] = {"eq": filter.user.id};
  final request = GraphQLRequest<String>(
    document: listNoticesGraphQL,
    variables: {"filter": filterJson},
  );
  final response = await Amplify.API.query(request: request).response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  Map<String, dynamic> jsonMap = json.decode(response.data!);
  return (jsonMap["listNotices"]["items"] as List)
      .map((notice) => Notice.fromJson(notice))
      .toList();
}
