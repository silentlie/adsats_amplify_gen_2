import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/navigate_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/shell.dart';
export 'package:adsats_amplify_gen_2/pages/main/compliance/create_report/shell.dart';
export 'package:adsats_amplify_gen_2/pages/main/compliance/view_report/route.dart';

part 'page.dart';

class ComplianceShellBranchData extends StatefulShellBranchData {
  static String $initialLocation = ComplianceInboxRoute().location;
  const ComplianceShellBranchData();
}

class ComplianceRoute extends RouteInfo {
  const ComplianceRoute();
  @override
  Icon get icon => const Icon(Icons.fact_check_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.fact_check);
  @override
  String get label => 'Compliance';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: CompliancePage());
  }
}
