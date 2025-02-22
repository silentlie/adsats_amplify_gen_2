import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class NoticeToCrewShellBranchData extends StatefulShellBranchData {
  const NoticeToCrewShellBranchData();
}

class NoticeToCrewRoute extends RouteInfo {
  const NoticeToCrewRoute();

  //TODO: fix icon
  @override
  Icon get icon => const Icon(Icons.insert_drive_file_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.insert_drive_file);
  @override
  String get label => 'Notice To Crew';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: NoticeToCrewPage());
  }
}
