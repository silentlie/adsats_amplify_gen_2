import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/filter.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/header.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/repo.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/sort.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class CrewDocumentCategoriesRoute extends RouteInfo {
  const CrewDocumentCategoriesRoute({required this.roleId});
  final String roleId;

  @override
  Icon get icon => const Icon(Icons.view_agenda_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.view_agenda);
  @override
  String get label => 'Crew Document Categories';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(
        child: CrewDocumentCategoriesPage(
      roleId: roleId,
    ));
  }
}
