import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/Role.dart';
import 'package:adsats_amplify_gen_2/pages/main/crew_documents/crew_documents_view.dart';
import 'package:adsats_amplify_gen_2/pages/main/profile/repo.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'page.dart';

class ProfileShellBranchData extends StatefulShellBranchData {
  const ProfileShellBranchData();
}

class ProfileRoute extends RouteInfo {
  const ProfileRoute();

  @override
  Icon get icon => const Icon(Icons.account_circle_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.account_circle);
  @override
  String get label => 'Profile';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: ProfilePage());
  }
}
