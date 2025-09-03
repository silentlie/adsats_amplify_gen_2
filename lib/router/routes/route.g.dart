// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $rootShellRouteData,
    ];

RouteBase get $rootShellRouteData => ShellRouteData.$route(
      navigatorKey: RootShellRouteData.$navigatorKey,
      factory: $RootShellRouteDataExtension._fromState,
      routes: [
        StatefulShellRouteData.$route(
          factory: $MainShellRouteDataExtension._fromState,
          branches: [
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/',
                  name: 'Home',
                  factory: _$HomeRoute._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/documents',
                  name: 'Documents',
                  factory: _$DocumentsRoute._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              initialLocation: SMSShellBranchData.$initialLocation,
              routes: [
                GoRouteData.$route(
                  path: '/sms',
                  name: 'SMS',
                  factory: _$SMSRoute._fromState,
                  routes: [
                    StatefulShellRouteData.$route(
                      factory: $SmsShellRouteDataExtension._fromState,
                      branches: [
                        StatefulShellBranchData.$branch(
                          routes: [
                            GoRouteData.$route(
                              path: 'inbox',
                              name: 'SMS Inbox',
                              factory: _$SmsInboxRoute._fromState,
                            ),
                          ],
                        ),
                        StatefulShellBranchData.$branch(
                          routes: [
                            GoRouteData.$route(
                              path: 'sent',
                              name: 'SMS Sent',
                              factory: _$SmsSentRoute._fromState,
                            ),
                          ],
                        ),
                      ],
                    ),
                    StatefulShellRouteData.$route(
                      factory: $CreateNoticeShellRouteDataExtension._fromState,
                      branches: [
                        StatefulShellBranchData.$branch(
                          routes: [
                            GoRouteData.$route(
                              path: 'safety-notice',
                              name: 'Safety Notice',
                              factory: _$SafetyNoticeRoute._fromState,
                            ),
                          ],
                        ),
                        StatefulShellBranchData.$branch(
                          routes: [
                            GoRouteData.$route(
                              path: 'hazard-report',
                              name: 'Hazard Report',
                              factory: _$HazardReportRoute._fromState,
                            ),
                          ],
                        ),
                        StatefulShellBranchData.$branch(
                          routes: [
                            GoRouteData.$route(
                              path: 'notice-to-crew',
                              name: 'Notice To Crew',
                              factory: _$NoticeToCrewRoute._fromState,
                            ),
                          ],
                        ),
                      ],
                    ),
                    GoRouteData.$route(
                      path: ':id',
                      name: 'View Notice',
                      parentNavigatorKey: ViewNoticeRoute.$parentNavigatorKey,
                      factory: _$ViewNoticeRoute._fromState,
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              initialLocation: CmsShellBranchData.$initialLocation,
              routes: [
                GoRouteData.$route(
                  path: '/cms',
                  name: 'CMS',
                  factory: _$CmsRoute._fromState,
                  routes: [
                    StatefulShellRouteData.$route(
                      factory: $CmsShellRouteDataExtension._fromState,
                      branches: [
                        StatefulShellBranchData.$branch(
                          routes: [
                            GoRouteData.$route(
                              path: 'inbox',
                              name: 'CMS Inbox',
                              factory: _$CmsInboxRoute._fromState,
                            ),
                          ],
                        ),
                        StatefulShellBranchData.$branch(
                          routes: [
                            GoRouteData.$route(
                              path: 'sent',
                              name: 'CMS Sent',
                              factory: _$CmsSentRoute._fromState,
                            ),
                          ],
                        ),
                      ],
                    ),
                    StatefulShellRouteData.$route(
                      factory: $CreateReportShellRouteDataExtension._fromState,
                      branches: [
                        StatefulShellBranchData.$branch(
                          routes: [
                            GoRouteData.$route(
                              path: 'internal-audit-report',
                              name: 'Internal Audit Report',
                              factory: _$InternalAuditReportRoute._fromState,
                            ),
                          ],
                        ),
                        StatefulShellBranchData.$branch(
                          routes: [
                            GoRouteData.$route(
                              path: 'external-audit-report',
                              name: 'External Audit Report',
                              factory: _$ExternalAuditReportRoute._fromState,
                            ),
                          ],
                        ),
                      ],
                    ),
                    GoRouteData.$route(
                      path: ':id',
                      name: 'View Report',
                      parentNavigatorKey: ViewReportRoute.$parentNavigatorKey,
                      factory: _$ViewReportRoute._fromState,
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/flight-crew-records',
                  name: 'Flight Crew Records',
                  factory: _$FlightCrewRecordsRoute._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/help',
                  name: 'Help',
                  factory: _$HelpRoute._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/kpi',
                  name: 'K.P.I',
                  factory: _$KPIRoute._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellRouteData.$route(
          factory: $AdminShellRouteDataExtension._fromState,
          branches: [
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/admin/aircraft',
                  name: 'Aircraft',
                  factory: _$AircraftRoute._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/admin/roles',
                  name: 'Roles',
                  factory: _$RolesRoute._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: ':roleId',
                      name: 'Flight Crew Records Categories',
                      factory: _$FlightCrewRecordsCategoriesRoute._fromState,
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/admin/staff',
                  name: 'Staff',
                  factory: _$StaffRoute._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/admin/categories',
                  name: 'Categories',
                  factory: _$CategoriesRoute._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: ':categoryId',
                      name: 'Subcategories',
                      factory: _$SubcategoriesRoute._fromState,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellRouteData.$route(
          factory: $ProfileShellRouteDataExtension._fromState,
          branches: [
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/profile',
                  name: 'Profile',
                  factory: _$ProfileRoute._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/profile/records',
                  name: 'Profile Records',
                  factory: _$ProfileRecordsRoute._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/profile/change-password',
                  name: 'Change Password',
                  factory: _$ChangePasswordRoute._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $RootShellRouteDataExtension on RootShellRouteData {
  static RootShellRouteData _fromState(GoRouterState state) =>
      const RootShellRouteData();
}

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

mixin _$HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location(
        '/',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$DocumentsRoute on GoRouteData {
  static DocumentsRoute _fromState(GoRouterState state) =>
      const DocumentsRoute();

  @override
  String get location => GoRouteData.$location(
        '/documents',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SMSRoute on GoRouteData {
  static SMSRoute _fromState(GoRouterState state) => const SMSRoute();

  @override
  String get location => GoRouteData.$location(
        '/sms',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

extension $SmsShellRouteDataExtension on SmsShellRouteData {
  static SmsShellRouteData _fromState(GoRouterState state) =>
      const SmsShellRouteData();
}

mixin _$SmsInboxRoute on GoRouteData {
  static SmsInboxRoute _fromState(GoRouterState state) => const SmsInboxRoute();

  @override
  String get location => GoRouteData.$location(
        '/sms/inbox',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SmsSentRoute on GoRouteData {
  static SmsSentRoute _fromState(GoRouterState state) => const SmsSentRoute();

  @override
  String get location => GoRouteData.$location(
        '/sms/sent',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

extension $CreateNoticeShellRouteDataExtension on CreateNoticeShellRouteData {
  static CreateNoticeShellRouteData _fromState(GoRouterState state) =>
      const CreateNoticeShellRouteData();
}

mixin _$SafetyNoticeRoute on GoRouteData {
  static SafetyNoticeRoute _fromState(GoRouterState state) =>
      const SafetyNoticeRoute();

  @override
  String get location => GoRouteData.$location(
        '/sms/safety-notice',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$HazardReportRoute on GoRouteData {
  static HazardReportRoute _fromState(GoRouterState state) =>
      const HazardReportRoute();

  @override
  String get location => GoRouteData.$location(
        '/sms/hazard-report',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$NoticeToCrewRoute on GoRouteData {
  static NoticeToCrewRoute _fromState(GoRouterState state) =>
      const NoticeToCrewRoute();

  @override
  String get location => GoRouteData.$location(
        '/sms/notice-to-crew',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ViewNoticeRoute on GoRouteData {
  static ViewNoticeRoute _fromState(GoRouterState state) => ViewNoticeRoute(
        id: state.pathParameters['id']!,
      );

  ViewNoticeRoute get _self => this as ViewNoticeRoute;

  @override
  String get location => GoRouteData.$location(
        '/sms/${Uri.encodeComponent(_self.id)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$CmsRoute on GoRouteData {
  static CmsRoute _fromState(GoRouterState state) => const CmsRoute();

  @override
  String get location => GoRouteData.$location(
        '/cms',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

extension $CmsShellRouteDataExtension on CmsShellRouteData {
  static CmsShellRouteData _fromState(GoRouterState state) =>
      const CmsShellRouteData();
}

mixin _$CmsInboxRoute on GoRouteData {
  static CmsInboxRoute _fromState(GoRouterState state) => const CmsInboxRoute();

  @override
  String get location => GoRouteData.$location(
        '/cms/inbox',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$CmsSentRoute on GoRouteData {
  static CmsSentRoute _fromState(GoRouterState state) => const CmsSentRoute();

  @override
  String get location => GoRouteData.$location(
        '/cms/sent',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

extension $CreateReportShellRouteDataExtension on CreateReportShellRouteData {
  static CreateReportShellRouteData _fromState(GoRouterState state) =>
      const CreateReportShellRouteData();
}

mixin _$InternalAuditReportRoute on GoRouteData {
  static InternalAuditReportRoute _fromState(GoRouterState state) =>
      const InternalAuditReportRoute();

  @override
  String get location => GoRouteData.$location(
        '/cms/internal-audit-report',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ExternalAuditReportRoute on GoRouteData {
  static ExternalAuditReportRoute _fromState(GoRouterState state) =>
      const ExternalAuditReportRoute();

  @override
  String get location => GoRouteData.$location(
        '/cms/external-audit-report',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ViewReportRoute on GoRouteData {
  static ViewReportRoute _fromState(GoRouterState state) => ViewReportRoute(
        id: state.pathParameters['id']!,
      );

  ViewReportRoute get _self => this as ViewReportRoute;

  @override
  String get location => GoRouteData.$location(
        '/cms/${Uri.encodeComponent(_self.id)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$FlightCrewRecordsRoute on GoRouteData {
  static FlightCrewRecordsRoute _fromState(GoRouterState state) =>
      const FlightCrewRecordsRoute();

  @override
  String get location => GoRouteData.$location(
        '/flight-crew-records',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$HelpRoute on GoRouteData {
  static HelpRoute _fromState(GoRouterState state) => const HelpRoute();

  @override
  String get location => GoRouteData.$location(
        '/help',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$KPIRoute on GoRouteData {
  static KPIRoute _fromState(GoRouterState state) => const KPIRoute();

  @override
  String get location => GoRouteData.$location(
        '/kpi',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

extension $AdminShellRouteDataExtension on AdminShellRouteData {
  static AdminShellRouteData _fromState(GoRouterState state) =>
      const AdminShellRouteData();
}

mixin _$AircraftRoute on GoRouteData {
  static AircraftRoute _fromState(GoRouterState state) => const AircraftRoute();

  @override
  String get location => GoRouteData.$location(
        '/admin/aircraft',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$RolesRoute on GoRouteData {
  static RolesRoute _fromState(GoRouterState state) => const RolesRoute();

  @override
  String get location => GoRouteData.$location(
        '/admin/roles',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$FlightCrewRecordsCategoriesRoute on GoRouteData {
  static FlightCrewRecordsCategoriesRoute _fromState(GoRouterState state) =>
      FlightCrewRecordsCategoriesRoute(
        roleId: state.pathParameters['roleId']!,
      );

  FlightCrewRecordsCategoriesRoute get _self =>
      this as FlightCrewRecordsCategoriesRoute;

  @override
  String get location => GoRouteData.$location(
        '/admin/roles/${Uri.encodeComponent(_self.roleId)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$StaffRoute on GoRouteData {
  static StaffRoute _fromState(GoRouterState state) => const StaffRoute();

  @override
  String get location => GoRouteData.$location(
        '/admin/staff',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$CategoriesRoute on GoRouteData {
  static CategoriesRoute _fromState(GoRouterState state) =>
      const CategoriesRoute();

  @override
  String get location => GoRouteData.$location(
        '/admin/categories',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SubcategoriesRoute on GoRouteData {
  static SubcategoriesRoute _fromState(GoRouterState state) =>
      SubcategoriesRoute(
        categoryId: state.pathParameters['categoryId']!,
      );

  SubcategoriesRoute get _self => this as SubcategoriesRoute;

  @override
  String get location => GoRouteData.$location(
        '/admin/categories/${Uri.encodeComponent(_self.categoryId)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileShellRouteDataExtension on ProfileShellRouteData {
  static ProfileShellRouteData _fromState(GoRouterState state) =>
      const ProfileShellRouteData();
}

mixin _$ProfileRoute on GoRouteData {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  @override
  String get location => GoRouteData.$location(
        '/profile',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ProfileRecordsRoute on GoRouteData {
  static ProfileRecordsRoute _fromState(GoRouterState state) =>
      const ProfileRecordsRoute();

  @override
  String get location => GoRouteData.$location(
        '/profile/records',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ChangePasswordRoute on GoRouteData {
  static ChangePasswordRoute _fromState(GoRouterState state) =>
      const ChangePasswordRoute();

  @override
  String get location => GoRouteData.$location(
        '/profile/change-password',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
