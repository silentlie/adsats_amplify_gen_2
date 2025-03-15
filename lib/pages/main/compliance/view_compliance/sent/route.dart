import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/data_table.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/sent/repo.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class ComplianceSentShellBranchData extends StatefulShellBranchData {
  const ComplianceSentShellBranchData();
}

class ComplianceSentRoute extends RouteInfo {
  const ComplianceSentRoute();

  @override
  Icon get icon => const Icon(Icons.outbox_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.outbox);
  @override
  String get label => 'Sent';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: ComplianceSentPage());
  }
}
