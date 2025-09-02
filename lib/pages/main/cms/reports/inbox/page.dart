import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/enum/inbox_or_sent.dart';
import 'package:adsats_amplify_gen_2/helper/mixin/compare_mixin.dart';
import 'package:adsats_amplify_gen_2/helper/providers/sort.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/providers/reports.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/reports/widgets/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/reports/widgets/data_table.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CmsInboxPage extends ConsumerWidget with CompareMixin {
  const CmsInboxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(userDetailsProvider.select(
      (value) => value.value,
    ));
    if (userDetails == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final dataAsync = ref.watch(reportsProvider(InboxOrSent.inbox));
    final (asc, key) = ref.watch(
      sortProvider<Report>().select((s) => (s.sortAscending, s.getField)),
    );
    final sortedAsync = dataAsync.whenData((list) {
      if (list.length < 2) return list;
      return [...list]..sort(compare<Report>(
          sortAscending: asc,
          getField: key,
        ));
    });
    return AsyncValueWidget(
      value: sortedAsync,
      data: (data) => ReportDataTable(
        dataSource: ReportDataSource(
          context: context,
          sortedData: data,
        ),
      ),
    );
  }
}
