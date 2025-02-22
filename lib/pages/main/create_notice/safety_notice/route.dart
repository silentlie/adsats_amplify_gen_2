import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class SafetyNoticeShellBranchData extends StatefulShellBranchData {
  const SafetyNoticeShellBranchData();
}

class SafetyNoticeRoute extends RouteInfo {
  const SafetyNoticeRoute();

  @override
  Icon get icon => const Icon(Icons.gpp_maybe_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.gpp_maybe);
  @override
  String get label => 'Safety Notice';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: SafetyNoticePage());
  }
}
