import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/invalidate.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportHeader extends ConsumerWidget {
  const ReportHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(reportFilterProvider);
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: const Text(
        "Inbox",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      title: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 5),
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                invalidateViewCompliance(ref);
              },
              icon: const Icon(Icons.refresh),
            ),
            ElevatedButton.icon(
              onPressed: () {
                InternalAuditReportRoute().go(context);
              },
              label: const Text('Create a new report'),
              icon: const Icon(
                Icons.add,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ReportsFilterView();
                  },
                );
              },
              label: Text("Filter"),
              icon: Icon(Icons.filter_alt_outlined),
            ),
            const SizedBox(
              width: 10,
            ),
            SearchBarWidget(
              onSubmitted: (value) {
                ref.read(reportFilterProvider.notifier).search(value);
              },
              initialValue: filter.search,
            )
          ],
        ),
      ),
    );
  }
}
