import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class HelpShellBranchData extends StatefulShellBranchData {
  const HelpShellBranchData();
}

class HelpRoute extends RouteInfo {
  const HelpRoute();

  @override
  Icon get icon => const Icon(Icons.help_outline);
  @override
  Icon get selectedIcon => const Icon(Icons.help);
  @override
  String get label => 'Help';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: HelpPage());
  }
}
