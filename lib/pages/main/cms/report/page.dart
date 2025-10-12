import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/external/page.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create/internal/page.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/providers/report.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';

@Dependencies([SelectedFiles])
class ViewReportPage extends ConsumerWidget {
  const ViewReportPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536.0),
        child: Card(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: AsyncValueWidget(
                  value: ref.watch(reportProvider(id)),
                  data: (value) {
                    return switch (value.type) {
                      ReportType.Internal_audit_report =>
                        InternalAuditReportPage(
                          report: value,
                        ),
                      ReportType.External_audit_report =>
                        ExternalAuditReportPage(
                          report: value,
                        ),
                      _ => Center(
                          child: Text("Unknown report type"),
                        )
                    };
                  },
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  icon: const Icon(Icons.cancel_outlined),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
