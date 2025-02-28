import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/header.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/repo.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/sort.dart';
import 'package:adsats_amplify_gen_2/pages/admin/filter.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
