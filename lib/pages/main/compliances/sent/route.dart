import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class ComplianceSentShellBranchData extends StatefulShellBranchData {
  const ComplianceSentShellBranchData();
}

class ComplianceSentRoute extends RouteInfo {
  const ComplianceSentRoute();

  //TODO: fix icon
  @override
  Icon get icon => const Icon(Icons.insert_drive_file_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.insert_drive_file);
  @override
  String get label => 'Sent';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: ComplianceSentPage());
  }
}
