import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class CrewDocumentsShellBranchData extends StatefulShellBranchData {
  const CrewDocumentsShellBranchData();
}

class CrewDocumentsRoute extends RouteInfo {
  const CrewDocumentsRoute();

  @override
  Icon get icon => const Icon(Icons.contact_page_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.contact_page);
  @override
  String get label => 'Crew Docs';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: CrewDocumentsPage());
  }
}
