import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class SmsInboxShellBranchData extends StatefulShellBranchData {
  const SmsInboxShellBranchData();
}

class SmsInboxRoute extends RouteInfo {
  const SmsInboxRoute();

  @override
  Icon get icon => const Icon(Icons.inbox_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.inbox);
  @override
  String get label => 'Inbox';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: SmsInboxPage());
  }
}
