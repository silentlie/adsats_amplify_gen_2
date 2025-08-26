part of '../../../route.dart';

class ViewReportRoute extends RouteInfo with _$ViewReportRoute {
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
