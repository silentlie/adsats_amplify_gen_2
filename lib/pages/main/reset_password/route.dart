import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class ResetPasswordShellBranchData extends StatefulShellBranchData {
  const ResetPasswordShellBranchData();
}

class ResetPasswordRoute extends RouteInfo {
  const ResetPasswordRoute();

  @override
  Icon get icon => const Icon(Icons.password_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.password);
  @override
  String get label => 'Reset Password';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: ResetPasswordPage());
  }
}
