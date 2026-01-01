import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/providers/service.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/reports/filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_reports.g.dart';

@riverpod
Future<List<Report>> allReports(Ref ref) async {
  final filter = ref.watch(reportFilterProvider);
  final filterJson = filter.toJson();
  final service = ref.read(reportServiceProvider);

  final variables = {
    "filter": filterJson,
  };

  final reports = await service.list(variables: variables);
  return reports;
}
