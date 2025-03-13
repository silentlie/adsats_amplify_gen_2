import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/crew_documents/crew_documents_view.dart';
import 'package:adsats_amplify_gen_2/pages/main/crew_documents/repo.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
