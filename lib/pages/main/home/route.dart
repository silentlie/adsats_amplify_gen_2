import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/notification/notifications.dart';
import 'package:adsats_amplify_gen_2/pages/main/home/navigate_icon_button.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class HomeShellBranchData extends StatefulShellBranchData {
  const HomeShellBranchData();
}

class HomeRoute extends RouteInfo {
  const HomeRoute();

  @override
  Icon get icon => const Icon(Icons.home_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.home);
  @override
  String get label => 'Home';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: HomePage());
  }
}
