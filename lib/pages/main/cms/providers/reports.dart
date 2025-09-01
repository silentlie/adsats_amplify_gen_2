import 'package:adsats_amplify_gen_2/helper/enum/inbox_or_sent.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/providers/service.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/reports/filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reports.g.dart';

@Riverpod(dependencies: [ReportFilter])
Future<List<Report>> reports(Ref ref, InboxOrSent type) async {
  final filter = ref.watch(reportFilterProvider);
  final filterJson = filter.toJson();
  final service = ref.read(reportServiceProvider);
  service.listIdsForUser(filter.user.id);
  switch (type) {
    case InboxOrSent.inbox:
      final reportIds = await service.listIdsForUser(filter.user.id);
      if (reportIds.isEmpty) return <Report>[];
      filterJson['or'] = reportIds
          .map((id) => {
                "id": {"eq": id}
              })
          .toList();
      break;
    case InboxOrSent.sent:
      filterJson['staffId'] = {'eq': filter.user.id};
      break;
  }
  final reports = await service.list(variables: {"filter": filterJson});
  return reports;
}
