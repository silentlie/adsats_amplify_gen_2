import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
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
