part of '../../route.dart';

class DocumentsShellBranchData extends StatefulShellBranchData {
  const DocumentsShellBranchData();
  static const branch = TypedStatefulShellBranch<DocumentsShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      DocumentsRoute.route,
    ],
  );
}

class DocumentsRoute extends RouteInfo with _$DocumentsRoute {
  const DocumentsRoute();

  static const route = TypedGoRoute<DocumentsRoute>(
    path: '/documents',
    name: 'Documents',
  );

  @override
  Icon get icon => const Icon(Icons.insert_drive_file_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.insert_drive_file);
  @override
  String get label => 'Documents';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: DocumentsPage());
  }
}
