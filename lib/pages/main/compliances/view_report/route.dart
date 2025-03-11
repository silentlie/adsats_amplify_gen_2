import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class ViewReportRoute extends RouteInfo {
  const ViewReportRoute({required this.id});
  final String id;

  @override
  Icon get icon => const Icon(Icons.fact_check_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.fact_check);
  @override
  String get label => 'View Report';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(
        child: ViewReportPage(
      id: id,
    ));
  }
}
