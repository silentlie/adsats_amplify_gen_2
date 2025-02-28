import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/pages/admin/filter.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/header.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/repo.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/sort.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

export 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/route.dart';

part 'page.dart';

class RolesShellBranchData extends StatefulShellBranchData {
  const RolesShellBranchData();
}

class RolesRoute extends RouteInfo {
  const RolesRoute();

  @override
  Icon get icon => const Icon(Icons.groups_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.groups);
  @override
  String get label => 'Roles';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: RolesPage());
  }
}
