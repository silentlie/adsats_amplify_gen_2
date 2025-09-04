import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'subcategories/route.dart';

class CategoriesShellBranchData extends StatefulShellBranchData {
  const CategoriesShellBranchData();
  static const branch = TypedStatefulShellBranch<CategoriesShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      CategoriesRoute.route,
    ],
  );
}

class CategoriesRoute extends RouteInfo with $CategoriesRoute {
  const CategoriesRoute();

  static const route = TypedGoRoute<CategoriesRoute>(
    path: '/admin/categories',
    name: 'Categories',
    routes: <TypedRoute<RouteData>>[
      SubcategoriesRoute.route,
    ],
  );

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
