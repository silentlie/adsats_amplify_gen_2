import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([listCategories, listStaff])
class SubcategoriesRoute extends RouteInfo with $SubcategoriesRoute {
  const SubcategoriesRoute({required this.categoryId});
  static const route = TypedGoRoute<SubcategoriesRoute>(
    path: ':categoryId',
    name: 'Subcategories',
  );
  final String categoryId;

  @override
  Icon get icon => const Icon(Icons.view_agenda_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.view_agenda);
  @override
  String get label => 'Subcategories';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(
        child: SubcategoriesPage(
      categoryId: categoryId,
    ));
  }
}
