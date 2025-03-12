import 'package:adsats_amplify_gen_2/pages/main/home/navigate_icon_button.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'package:adsats_amplify_gen_2/pages/main/sms/view_sms/shell.dart';

part 'page.dart';

class SMSShellBranchData extends StatefulShellBranchData {
  static String $initialLocation = SMSRoute().location;
  const SMSShellBranchData();
}

class SMSRoute extends RouteInfo {
  const SMSRoute();

  @override
  Icon get icon => const Icon(Icons.support_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.support);
  @override
  String get label => 'S.M.S';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: SMSPage());
  }
}
