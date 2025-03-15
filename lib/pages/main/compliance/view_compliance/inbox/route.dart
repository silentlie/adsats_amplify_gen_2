import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/data_table.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/inbox/repo.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class ComplianceInboxShellBranchData extends StatefulShellBranchData {
  const ComplianceInboxShellBranchData();
}

class ComplianceInboxRoute extends RouteInfo {
  const ComplianceInboxRoute();

  @override
  Icon get icon => const Icon(Icons.inbox_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.inbox);
  @override
  String get label => 'Inbox';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: ComplianceInboxPage());
  }
}
