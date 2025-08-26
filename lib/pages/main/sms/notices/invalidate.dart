import 'package:adsats_amplify_gen_2/pages/main/sms/notices/inbox/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/sent/repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void invalidateViewSMS(WidgetRef ref) {
  ref.invalidate(noticesSentRepoProvider);
  ref.invalidate(noticesInboxRepoProvider);
}
