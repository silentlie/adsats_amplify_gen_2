import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'package:adsats_amplify_gen_2/pages/root_shell.dart';

part 'route_info.dart';
part 'router.g.dart';

@Riverpod(keepAlive: true)
class Router extends _$Router {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
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

class ErrorRoute extends GoRouteData {
  ErrorRoute({required this.error});
  final Exception error;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    return Center(
      child: Text(
        error.toString(),
        style: titleLarge?.copyWith(color: Colors.red),
      ),
    );
  }
}

@TypedShellRoute<RootShellRouteData>(routes: <TypedRoute<RouteData>>[
  TypedStatefulShellRoute<MainShellRouteData>(
    branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
      TypedStatefulShellBranch<HomeShellBranchData>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<HomeRoute>(
            path: '/',
            name: 'Home',
          ),
        ],
      ),
      TypedStatefulShellBranch<DocumentsShellBranchData>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<DocumentsRoute>(
            path: '/documents',
            name: 'Documents',
          ),
        ],
      ),
      TypedStatefulShellBranch<SmsShellBranchData>(
        routes: [
          TypedStatefulShellRoute<SmsShellRouteData>(
            branches: [
              TypedStatefulShellBranch<SmsInboxShellBranchData>(
                routes: <TypedRoute<RouteData>>[
                  TypedGoRoute<SmsInboxRoute>(
                    path: '/sms/inbox',
                    name: 'SMS Inbox',
                  ),
                ],
              ),
              TypedStatefulShellBranch<SmsSentShellBranchData>(
                routes: <TypedRoute<RouteData>>[
                  TypedGoRoute<SmsSentRoute>(
                    path: '/sms/sent',
                    name: 'SMS Sent',
                  ),
                ],
              ),
            ],
          ),
          TypedStatefulShellRoute<CreateNoticeShellRouteData>(
            branches: [
              TypedStatefulShellBranch<NoticeToCrewShellBranchData>(
                routes: <TypedRoute<RouteData>>[
                  TypedGoRoute<NoticeToCrewRoute>(
                    path: '/sms/notice-to-crew',
                    name: 'Notice To Crew',
                  ),
                ],
              ),
              TypedStatefulShellBranch<SafetyNoticeShellBranchData>(
                routes: <TypedRoute<RouteData>>[
                  TypedGoRoute<SafetyNoticeRoute>(
                    path: '/sms/safety-notice',
                    name: 'Safety Notice',
                  ),
                ],
              ),
              TypedStatefulShellBranch<HazardReportShellBranchData>(
                routes: <TypedRoute<RouteData>>[
                  TypedGoRoute<HazardReportRoute>(
                    path: '/sms/hazard-report',
                    name: 'Hazard Report',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      TypedStatefulShellBranch<ComplianceShellBranchData>(
        routes: [
          TypedStatefulShellRoute<ComplianceShellRouteData>(
            branches: [
              TypedStatefulShellBranch<ComplianceInboxShellBranchData>(
                routes: <TypedRoute<RouteData>>[
                  TypedGoRoute<ComplianceInboxRoute>(
                    path: '/compliance/inbox',
                    name: 'Compliance Inbox',
                  ),
                ],
              ),
              TypedStatefulShellBranch<ComplianceSentShellBranchData>(
                routes: <TypedRoute<RouteData>>[
                  TypedGoRoute<ComplianceSentRoute>(
                    path: '/compliance/sent',
                    name: 'Compliance Sent',
                  ),
                ],
              ),
            ],
          ),
          TypedStatefulShellRoute<CreateReportShellRouteData>(
            branches: [
              TypedStatefulShellBranch<InternalAuditReportShellBranchData>(
                routes: <TypedRoute<RouteData>>[
                  TypedGoRoute<InternalAuditReportRoute>(
                    path: '/sms/internal-audit-report',
                    name: 'Internal Audit Report',
                  ),
                ],
              ),
              TypedStatefulShellBranch<ExternalAuditReportShellBranchData>(
                routes: <TypedRoute<RouteData>>[
                  TypedGoRoute<ExternalAuditReportRoute>(
                    path: '/sms/external-audit-report',
                    name: 'External Audit Report',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      TypedStatefulShellBranch<CrewDocumentsShellBranchData>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<CrewDocumentsRoute>(
            path: '/crew-documents',
            name: 'Crew Documents',
          ),
        ],
      ),
      TypedStatefulShellBranch<ProfileShellBranchData>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<ProfileRoute>(
            path: '/profile',
            name: 'Profile',
          ),
        ],
      ),
      TypedStatefulShellBranch<HelpShellBranchData>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<HelpRoute>(
            path: '/help',
            name: 'Help',
          ),
        ],
      ),
      TypedStatefulShellBranch<ResetPasswordShellBranchData>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<ResetPasswordRoute>(
            path: '/reset-password',
            name: 'Reset Password',
          ),
        ],
      ),
    ],
  ),
  TypedStatefulShellRoute<AdminShellRouteData>(
    branches: [
      TypedStatefulShellBranch<AircraftShellBranchData>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<AircraftRoute>(
            path: '/admin/aircraft',
            name: 'Aircraft',
          ),
        ],
      ),
      TypedStatefulShellBranch<RolesShellBranchData>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<RolesRoute>(
            path: '/admin/roles',
            name: 'Roles',
          ),
        ],
      ),
      TypedStatefulShellBranch<StaffShellBranchData>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<StaffRoute>(
            path: '/admin/staff',
            name: 'Staff',
          ),
        ],
      ),
      TypedStatefulShellBranch<CategoriesShellBranchData>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<CategoriesRoute>(
            path: '/admin/categories',
            name: 'Categories',
          ),
        ],
      ),
    ],
  ),
])
class RootShellRouteData extends ShellRouteData {
  const RootShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return Consumer(
      builder: (context, ref, child) {
        return ref.watch(userDetailsProvider).when(
              data: (data) {
                return RootShell(child: navigator);
              },
              error: (error, stackTrace) {
                final titleLarge = Theme.of(context).textTheme.titleLarge;
                return Center(
                  child: Text(
                    error.toString(),
                    style: titleLarge?.copyWith(color: Colors.red),
                  ),
                );
              },
              loading: () => LoadingView(),
              skipLoadingOnRefresh: true,
              skipLoadingOnReload: true,
            );
      },
    );
  }
}
