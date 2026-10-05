import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'service.dart';

part 'compliance_managers.g.dart';

@riverpod
Future<List<Staff>> complianceManagers(Ref ref) async {
  return ref.read(reportServiceProvider).fetchRecipientsForReport();
}
