import 'package:adsats_amplify_gen_2/pages/main/cms/reports/inbox/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/reports/sent/repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void invalidateViewCms(WidgetRef ref) {
  ref.invalidate(reportsSentRepoProvider);
  ref.invalidate(reportsInboxRepoProvider);
}
