import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/widgets/app_bar_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'package:adsats_amplify_gen_2/pages/root_shell.dart';

part 'route_info.dart';
part 'router.g.dart';
part 'dialog_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
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
      TypedStatefulShellBranch<SMSShellBranchData>(
        routes: [
          TypedGoRoute<SMSRoute>(
            path: '/sms',
            name: 'SMS',
            routes: [
              TypedStatefulShellRoute<SmsShellRouteData>(
                branches: [
                  TypedStatefulShellBranch<SmsInboxShellBranchData>(
                    routes: <TypedRoute<RouteData>>[
                      TypedGoRoute<SmsInboxRoute>(
                        path: 'inbox',
                        name: 'SMS Inbox',
                      ),
                    ],
                  ),
                  TypedStatefulShellBranch<SmsSentShellBranchData>(
                    routes: <TypedRoute<RouteData>>[
                      TypedGoRoute<SmsSentRoute>(
                        path: 'sent',
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
                        path: 'notice-to-crew',
                        name: 'Notice To Crew',
                      ),
                    ],
                  ),
                  TypedStatefulShellBranch<SafetyNoticeShellBranchData>(
                    routes: <TypedRoute<RouteData>>[
                      TypedGoRoute<SafetyNoticeRoute>(
                        path: 'safety-notice',
                        name: 'Safety Notice',
                      ),
                    ],
                  ),
                  TypedStatefulShellBranch<HazardReportShellBranchData>(
                    routes: <TypedRoute<RouteData>>[
                      TypedGoRoute<HazardReportRoute>(
                        path: 'hazard-report',
                        name: 'Hazard Report',
                      ),
                    ],
                  ),
                ],
              ),
              TypedGoRoute<ViewNoticeRoute>(
                path: ':id',
                name: 'View Notice',
              ),
            ],
          ),
        ],
      ),
      TypedStatefulShellBranch<ComplianceShellBranchData>(
        routes: [
          TypedGoRoute<ComplianceRoute>(
            path: '/compliance',
            name: 'Compliance',
            routes: [
              TypedStatefulShellRoute<ComplianceShellRouteData>(
                branches: [
                  TypedStatefulShellBranch<ComplianceInboxShellBranchData>(
                    routes: <TypedRoute<RouteData>>[
                      TypedGoRoute<ComplianceInboxRoute>(
                        path: 'inbox',
                        name: 'Compliance Inbox',
                      ),
                    ],
                  ),
                  TypedStatefulShellBranch<ComplianceSentShellBranchData>(
                    routes: <TypedRoute<RouteData>>[
                      TypedGoRoute<ComplianceSentRoute>(
                        path: 'sent',
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
                        path: 'internal-audit-report',
                        name: 'Internal Audit Report',
                      ),
                    ],
                  ),
                  TypedStatefulShellBranch<ExternalAuditReportShellBranchData>(
                    routes: <TypedRoute<RouteData>>[
                      TypedGoRoute<ExternalAuditReportRoute>(
                        path: 'external-audit-report',
                        name: 'External Audit Report',
                      ),
                    ],
                  ),
                ],
              ),
              TypedGoRoute<ViewReportRoute>(
                path: ':id',
                name: 'View Report',
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
      TypedStatefulShellBranch<KPIShellBranchData>(
        routes: <TypedRoute<RouteData>>[
          TypedGoRoute<KPIRoute>(
            path: '/kpi',
            name: 'K.P.I',
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
              routes: [
                TypedGoRoute<CrewDocumentCategoriesRoute>(
                  path: ':roleId',
                  name: 'Crew Document Categories',
                ),
              ]),
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
            routes: [
              TypedGoRoute<SubcategoriesRoute>(
                path: ':categoryId',
                name: 'Subcategories',
              ),
            ],
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

class ErrorRoute extends GoRouteData {
  ErrorRoute({required this.error});
  final Exception error;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      appBar: AppBarWidget(
        isBarebone: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error.toString(),
              style: titleLarge?.copyWith(color: Colors.red),
            ),
            TextButton.icon(
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  HomeRoute().go(context);
                }
              },
              label: Text("Back"),
              icon: Icon(Icons.arrow_back),
            ),
          ],
        ),
      ),
    );
  }
}
