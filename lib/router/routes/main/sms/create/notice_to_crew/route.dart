part of '../../../../route.dart';

class NoticeToCrewShellBranchData extends StatefulShellBranchData {
  const NoticeToCrewShellBranchData();
  static const branch = TypedStatefulShellBranch<NoticeToCrewShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      NoticeToCrewRoute.route,
    ],
  );
}

class NoticeToCrewRoute extends RouteInfo with _$NoticeToCrewRoute {
  const NoticeToCrewRoute();
  static const route = TypedGoRoute<NoticeToCrewRoute>(
    path: 'notice-to-crew',
    name: 'Notice To Crew',
  );

  @override
  Icon get icon => const Icon(Icons.notifications_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.notifications);
  @override
  String get label => 'Notice To Crew';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: NoticeToCrewPage());
  }
}
