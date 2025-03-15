import 'dart:async';

import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/header.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/sort.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class KPIShellBranchData extends StatefulShellBranchData {
  const KPIShellBranchData();
}

class KPIRoute extends RouteInfo {
  const KPIRoute();

  @override
  Icon get icon => const Icon(Icons.onetwothree_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.onetwothree);
  @override
  String get label => 'K.P.I';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: KPIPage());
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    // TODO: implement redirect
    return super.redirect(context, state);
  }
}