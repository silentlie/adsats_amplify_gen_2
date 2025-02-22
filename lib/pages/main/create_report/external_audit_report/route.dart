import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class ExternalAuditReportShellBranchData extends StatefulShellBranchData {
  const ExternalAuditReportShellBranchData();
}

class ExternalAuditReportRoute extends RouteInfo {
  const ExternalAuditReportRoute();

  //TODO: fix icon
  @override
  Icon get icon => const Icon(Icons.insert_drive_file_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.insert_drive_file);
  @override
  String get label => 'External Audit Report';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: ExternalAuditReportPage());
  }
}
