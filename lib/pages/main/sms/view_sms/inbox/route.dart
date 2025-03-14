import 'package:adsats_amplify_gen_2/pages/main/sms/view_sms/data_table.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/view_sms/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/view_sms/inbox/repo.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
