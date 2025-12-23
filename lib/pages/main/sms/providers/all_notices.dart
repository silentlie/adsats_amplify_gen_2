import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_notices.g.dart';

@riverpod
Future<List<Notice>> allNotices(Ref ref) async {
  final filter = ref.watch(noticeFilterProvider);
  final filterJson = filter.toJson();
  final service = ref.read(noticeServiceProvider);

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
