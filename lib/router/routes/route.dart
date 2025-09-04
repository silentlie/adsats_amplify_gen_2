import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

export 'admin/route.dart';
export 'main/route.dart';
export 'profile/route.dart';
export 'main/home/route.dart';
export 'error/route.dart';

part 'route.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final rootShellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<RootShellRouteData>(routes: <TypedRoute<RouteData>>[
  MainShellRouteData.route,
  AdminShellRouteData.route,
  ProfileShellRouteData.route,
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
