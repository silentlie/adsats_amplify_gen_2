import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/providers/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report.g.dart';

@riverpod
Future<Report> report(Ref ref, String id) async {
  final service = ref.read(reportServiceProvider);
  return await service.getById(id);
}
