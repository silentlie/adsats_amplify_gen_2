import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/filter.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/header.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/repo.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/sort.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class SubcategoriesRoute extends RouteInfo {
  const SubcategoriesRoute({required this.categoryId});
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
