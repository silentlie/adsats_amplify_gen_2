import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

enum InboxOrSent { inbox, sent }

@Riverpod(dependencies: [NoticeFilter])
class NoticeRepository extends _$NoticeRepository {
  @override
  Future<List<Notice>> build(InboxOrSent type) async {
    final filter = ref.watch(noticeFilterProvider);
    final filterJson = filter.toJson();
    switch (type) {
      case InboxOrSent.inbox:
        final database = ref.read(databaseAPIProvider);
        final noticeIds = await database.listAll(
          modelType: NoticeStaff.classType,
          where: NoticeStaff.STAFF.eq(filter.user.id),
        );
        if (noticeIds.isEmpty) return <Notice>[];
        filterJson['or'] = noticeIds
            .map((e) => {
                  "id": {"eq": e.notice?.id}
                })
            .toList();
        break;

      case InboxOrSent.sent:
        filterJson['staffId'] = {'eq': filter.user.id};
        break;
    }
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


}
