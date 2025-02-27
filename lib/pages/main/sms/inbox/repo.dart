import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/API/query_providers.dart' hide listNotices;
import 'package:adsats_amplify_gen_2/pages/main/sms/filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../models/ModelProvider.dart';

part 'repo.g.dart';

@Riverpod(dependencies: [listNoticeStaff])
FutureOr<List<Notice>> noticesInboxRepo(Ref ref, NoticeFilterState filter,) async {
  final noticeIds = await ref.watch(listNoticeStaffProvider(
    NoticeStaff.STAFF.eq(filter.user.id),
  ).future);
  final filterJson = filter.toJson();
  if (noticeIds.isEmpty) {
    return [];
  }
  filterJson["or"] = noticeIds
      .map((e) => {
            "id": {"eq": e.notice?.id}
          })
      .toList();
  final request = GraphQLRequest<String>(
    document: listNotices,
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
