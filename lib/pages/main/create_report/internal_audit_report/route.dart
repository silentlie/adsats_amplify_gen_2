import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

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
