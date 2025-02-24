import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class CategoriesShellBranchData extends StatefulShellBranchData {
  const CategoriesShellBranchData();
}

class CategoriesRoute extends RouteInfo {
  const CategoriesRoute();

  @override
  Icon get icon => const Icon(Icons.view_agenda_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.view_agenda);
  @override
  String get label => 'Categories';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: CategoriesPage());
  }
}
