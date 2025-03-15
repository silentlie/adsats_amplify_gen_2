import 'package:adsats_amplify_gen_2/API/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/create_report/report_actions_row.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/create_report/report_basic_details.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/create_report/report_recipients.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/create_report/state.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'page.dart';
part 'components.dart';

class InternalAuditReportShellBranchData extends StatefulShellBranchData {
  const InternalAuditReportShellBranchData();
}

class InternalAuditReportRoute extends RouteInfo {
  const InternalAuditReportRoute();

  @override
  Icon get icon => const Icon(Icons.plagiarism_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.plagiarism);
  @override
  String get label => 'Internal Audit Report';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: InternalAuditReportPage());
  }
}
