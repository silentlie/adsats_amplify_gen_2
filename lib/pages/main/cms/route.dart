import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/navigate_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'package:adsats_amplify_gen_2/pages/main/cms/view_cms/shell.dart';
export 'package:adsats_amplify_gen_2/pages/main/cms/create_report/shell.dart';
export 'package:adsats_amplify_gen_2/pages/main/cms/view_report/route.dart';

part 'page.dart';

class CmsShellBranchData extends StatefulShellBranchData {
  static String $initialLocation = CmsSentRoute().location;
  const CmsShellBranchData();
}

class CmsRoute extends RouteInfo {
  const CmsRoute();
  @override
  Icon get icon => const Icon(Icons.fact_check_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.fact_check);
  @override
  String get label => 'C.M.S';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: CmsPage());
  }
}
