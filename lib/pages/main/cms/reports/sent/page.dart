import 'package:adsats_amplify_gen_2/pages/main/cms/reports/data_table.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/reports/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/reports/sent/repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CmsSentPage extends ConsumerWidget {
  const CmsSentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(reportFilterProvider);
    final dataAsync = ref.watch(reportsSentRepoProvider(filter));
    return ReportDataTable(value: dataAsync);
  }
}
