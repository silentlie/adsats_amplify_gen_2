import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notices.g.dart';

enum InboxOrSent { inbox, sent }

@Riverpod(dependencies: [NoticeFilter])
Future<List<Notice>> notices(Ref ref, InboxOrSent type) async {
  final filter = ref.watch(noticeFilterProvider);
  final filterJson = filter.toJson();
  final database = ref.read(databaseAPIProvider);
  switch (type) {
    case InboxOrSent.inbox:
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
  final jsonMap = await database.query(
    document: listNoticesGraphQL,
    variables: {"filter": filterJson},
  );
  return (jsonMap["listNotices"]["items"] as List)
      .map((notice) => Notice.fromJson(notice))
      .toList();
}
