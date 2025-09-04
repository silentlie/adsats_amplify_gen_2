import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/dialog_page.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewReportRoute extends RouteInfo with $ViewReportRoute {
  const ViewReportRoute({required this.id});
  final String id;

  static final $parentNavigatorKey = rootShellNavigatorKey;
  static const route = TypedGoRoute<ViewReportRoute>(
    path: ':id',
    name: 'View Report',
  );

  @override
  Icon get icon => const Icon(Icons.fact_check_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.fact_check);
  @override
  String get label => 'View Report';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return DialogPage(
      key: state.pageKey,
      child: ViewReportPage(
        id: id,
      ),
    );
  }
}
