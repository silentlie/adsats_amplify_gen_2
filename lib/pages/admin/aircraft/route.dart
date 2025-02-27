import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/filter.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/header.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/repo.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/sort.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class AircraftShellBranchData extends StatefulShellBranchData {
  const AircraftShellBranchData();
}

class AircraftRoute extends RouteInfo {
  const AircraftRoute();

  @override
  Icon get icon => const Icon(Icons.airlines_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.airlines);
  @override
  String get label => 'Aircraft';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: AircraftPage());
  }
}
