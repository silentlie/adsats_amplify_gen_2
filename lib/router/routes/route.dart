import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/dialog_page.dart';
import 'package:adsats_amplify_gen_2/router/route_info.dart';
import 'package:adsats_amplify_gen_2/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'route.g.dart';
part 'admin/route.dart';
part 'admin/staff/route.dart';
part 'admin/aircraft/route.dart';
part 'admin/roles/route.dart';
part 'admin/roles/flight_crew_record_categories/route.dart';
part 'admin/categories/route.dart';
part 'admin/categories/subcategories/route.dart';
part 'main/route.dart';
part 'main/home/route.dart';
part 'main/profile/route.dart';
part 'main/documents/route.dart';
part 'main/flight_crew_records/route.dart';
part 'main/help/route.dart';
part 'main/sms/notices/route.dart';
part 'main/sms/notice/route.dart';
part 'main/sms/route.dart';
part 'main/sms/notices/inbox/route.dart';
part 'main/sms/notices/sent/route.dart';
part 'main/sms/create/route.dart';
part 'main/sms/create/safety_notice/route.dart';
part 'main/sms/create/hazard_report/route.dart';
part 'main/sms/create/notice_to_crew/route.dart';
part 'main/cms/route.dart';
part 'main/cms/reports/route.dart';
part 'main/cms/reports/inbox/route.dart';
part 'main/cms/reports/sent/route.dart';
part 'main/cms/report/route.dart';
part 'main/cms/create/route.dart';
part 'main/cms/create/internal/route.dart';
part 'main/cms/create/external/route.dart';
part 'main/kpi/route.dart';
part 'error/route.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final rootShellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<RootShellRouteData>(routes: <TypedRoute<RouteData>>[
  MainShellRouteData.route,
  AdminShellRouteData.route,
])
class RootShellRouteData extends ShellRouteData {
  const RootShellRouteData();

  static final $navigatorKey = rootShellNavigatorKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return Consumer(
      builder: (context, ref, child) {
        ref.watch(userDetailsProvider.select(
          (value) => value.value,
        ));
        return RootShell(child: navigator);
      },
    );
  }
}
