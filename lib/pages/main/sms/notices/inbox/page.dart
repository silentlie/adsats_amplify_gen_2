import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/enum/scope.dart';
import 'package:adsats_amplify_gen_2/helper/mixin/compare_mixin.dart';
import 'package:adsats_amplify_gen_2/helper/providers/sort.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/widgets/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/widgets/data_table.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notices.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SmsInboxPage extends ConsumerWidget with CompareMixin {
  const SmsInboxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(userDetailsProvider.select(
      (value) => value.value,
    ));
    if (userDetails == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final dataAsync = ref.watch(noticesProvider(Scope.inbox));
    final (asc, key, custom) = ref.watch(
      sortProvider<Notice>()
          .select((s) => (s.sortAscending, s.getField, s.custom)),
    );
    final sortedAsync = dataAsync.whenData((list) {
      if (list.length < 2) return list;
      return [...list]..sort(compare<Notice>(
          sortAscending: asc,
          getField: key,
          custom: custom,
        ));
    });
    return AsyncValueWidget(
      value: sortedAsync,
      data: (data) => NoticeDataTable(
        dataSource: NoticeDataSource(
          sortedData: data,
          context: context,
        ),
      ),
    );
  }
}
