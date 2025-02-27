import 'package:adsats_amplify_gen_2/pages/main/sms/inbox/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/sent/repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void invalidate(WidgetRef ref) {
  ref.invalidate(noticesSentRepoProvider);
  ref.invalidate(noticesInboxRepoProvider);
}
