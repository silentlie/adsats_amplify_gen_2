import 'package:adsats_amplify_gen_2/helper/enum/scope.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/providers/service.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/reports/filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reports.g.dart';

@riverpod
Future<List<Report>> reports(Ref ref, Scope type) async {
  final filter = ref.watch(reportFilterProvider);
  final filterJson = filter.toJson();
  final service = ref.read(reportServiceProvider);
  service.listIdsForUser(filter.user.id);
  switch (type) {
    case Scope.inbox:
      final reportIds = await service.listIdsForUser(filter.user.id);
      if (reportIds.isEmpty) return <Report>[];
      filterJson['or'] = reportIds
          .map((id) => {
                "id": {"eq": id}
              })
          .toList();
      break;
    case Scope.sent:
      filterJson['auditorId'] = {'eq': filter.user.id};
      break;
    case Scope.all:
      // no additional filter - return all reports matching base filter
      break;
  }
  final reports = await service.list(variables: {"filter": filterJson});
  return reports;
}
