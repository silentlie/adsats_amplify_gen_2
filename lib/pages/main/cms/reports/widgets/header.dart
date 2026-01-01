import 'package:adsats_amplify_gen_2/pages/main/cms/providers/reports.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/reports/filter.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
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
        "CMS",
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
            Tooltip(
              richMessage: WidgetSpan(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Status colors:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, color: Colors.red, size: 14),
                        SizedBox(width: 6),
                        Text('Open report'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.square, color: Colors.red, size: 14),
                        SizedBox(width: 6),
                        Text('Open report with discrepancies found'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, color: Colors.amber, size: 14),
                        SizedBox(width: 6),
                        Text('Pending report'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.square, color: Colors.amber, size: 14),
                        SizedBox(width: 6),
                        Text('Pending report with discrepancies found'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, color: Colors.green, size: 14),
                        SizedBox(width: 6),
                        Text('Closed report'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.square, color: Colors.purple, size: 14),
                        SizedBox(width: 6),
                        Text('Closed report with discrepancies found'),
                      ],
                    ),
                  ],
                ),
              ),
              child: Icon(Icons.info_outline),
            ),
            IconButton(
              onPressed: () {
                ref.invalidate(reportsProvider);
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
