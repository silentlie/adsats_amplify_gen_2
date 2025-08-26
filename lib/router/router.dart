import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'routes/route.dart';
export 'route_info.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true, dependencies: [userId])
class Router extends _$Router {
  @override
  GoRouter build() {
    return GoRouter(
      initialLocation: HomeRoute().location,
      restorationScopeId: 'root_route',
      navigatorKey: rootNavigatorKey,
      routes: $appRoutes,
      debugLogDiagnostics: true,
      redirect: (context, state) {
        ref.refresh(userIdProvider.future).ignore();
        return null;
      },
      errorBuilder: (BuildContext context, GoRouterState state) {
        return ErrorRoute(error: state.error!).build(context, state);
      },
    );
  }
}
