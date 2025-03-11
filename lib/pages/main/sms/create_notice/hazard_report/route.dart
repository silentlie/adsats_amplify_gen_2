import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class HazardReportShellBranchData extends StatefulShellBranchData {
  const HazardReportShellBranchData();
}

class HazardReportRoute extends RouteInfo {
  const HazardReportRoute();

  @override
  Icon get icon => const Icon(Icons.report_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.report);
  @override
  String get label => 'Hazard Report';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: HazardReportPage());
  }
}
