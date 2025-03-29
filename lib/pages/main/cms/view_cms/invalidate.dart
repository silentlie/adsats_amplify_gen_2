import 'package:adsats_amplify_gen_2/pages/main/cms/view_cms/inbox/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/view_cms/sent/repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void invalidateViewCms(WidgetRef ref) {
  ref.invalidate(reportsSentRepoProvider);
  ref.invalidate(reportsInboxRepoProvider);
}
