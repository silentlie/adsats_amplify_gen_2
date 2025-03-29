import 'package:adsats_amplify_gen_2/helper/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create_report/documents.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create_report/report_actions_row.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create_report/report_basic_details.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create_report/report_recipients.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/create_report/state.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class ExternalAuditReportShellBranchData extends StatefulShellBranchData {
  const ExternalAuditReportShellBranchData();
}

class ExternalAuditReportRoute extends RouteInfo {
  const ExternalAuditReportRoute();

  @override
  Icon get icon => const Icon(Icons.find_in_page_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.find_in_page);
  @override
  String get label => 'External Audit Report';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: ExternalAuditReportPage());
  }
}
