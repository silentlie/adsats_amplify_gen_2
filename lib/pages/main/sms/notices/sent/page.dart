import 'package:adsats_amplify_gen_2/pages/main/sms/notices/data_table.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/sent/repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SmsSentPage extends ConsumerWidget {
  const SmsSentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(noticeFilterProvider);
    final dataAsync = ref.watch(noticesSentRepoProvider(filter));
    return NoticeDataTable(value: dataAsync);
  }
}
