import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/inbox/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/sent/repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void invalidateViewCompliance(WidgetRef ref) {
  ref.invalidate(reportsSentRepoProvider);
  ref.invalidate(reportsInboxRepoProvider);
}
