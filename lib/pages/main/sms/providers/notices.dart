import 'package:adsats_amplify_gen_2/helper/enum/scope.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notices.g.dart';

@riverpod
Future<List<Notice>> notices(Ref ref, Scope type) async {
  final filter = ref.watch(noticeFilterProvider);
  final filterJson = filter.toJson();
  final service = ref.read(noticeServiceProvider);
  switch (type) {
    case Scope.inbox:
      final noticeIds = await service.listIdsForInbox(filter.user.id);
      if (noticeIds.isEmpty) return <Notice>[];
      filterJson['or'] = noticeIds
          .map((e) => {
                "id": {"eq": e}
              })
          .toList();
      break;
    case Scope.sent:
      filterJson['staffId'] = {'eq': filter.user.id};
      break;
    case Scope.all:
      // no additional filter - return all notices matching base filter
      break;
  }
  final variables = {
    "filter": filterJson,
  };

  final notices = await service.list(variables: variables);
  if (filter.aircraft.isEmpty) return notices;
  final ids = {for (final a in filter.aircraft) a.id};
  return notices
    ..retainWhere((notice) {
      for (final a in notice.aircraft!) {
        if (ids.contains(a.aircraft!.id)) {
          return true;
        }
      }
      return false;
    });
}
