// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $rootShellRouteData,
    ];

RouteBase get $rootShellRouteData => ShellRouteData.$route(
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
                  factory: $HomeRouteExtension._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/documents',
                  name: 'Documents',
                  factory: $DocumentsRouteExtension._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                StatefulShellRouteData.$route(
                  factory: $SmsShellRouteDataExtension._fromState,
                  branches: [
                    StatefulShellBranchData.$branch(
                      routes: [
                        GoRouteData.$route(
                          path: '/sms/inbox',
                          name: 'SMS Inbox',
                          factory: $SmsInboxRouteExtension._fromState,
                        ),
                      ],
                    ),
                    StatefulShellBranchData.$branch(
                      routes: [
                        GoRouteData.$route(
                          path: '/sms/sent',
                          name: 'SMS Sent',
                          factory: $SmsSentRouteExtension._fromState,
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
                          path: '/sms/notice-to-crew',
                          name: 'Notice To Crew',
                          factory: $NoticeToCrewRouteExtension._fromState,
                        ),
                      ],
                    ),
                    StatefulShellBranchData.$branch(
                      routes: [
                        GoRouteData.$route(
                          path: '/sms/safety-notice',
                          name: 'Safety Notice',
                          factory: $SafetyNoticeRouteExtension._fromState,
                        ),
                      ],
                    ),
                    StatefulShellBranchData.$branch(
                      routes: [
                        GoRouteData.$route(
                          path: '/sms/hazard-report',
                          name: 'Hazard Report',
                          factory: $HazardReportRouteExtension._fromState,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                StatefulShellRouteData.$route(
                  factory: $ComplianceShellRouteDataExtension._fromState,
                  branches: [
                    StatefulShellBranchData.$branch(
                      routes: [
                        GoRouteData.$route(
                          path: '/compliance/inbox',
                          name: 'Compliance Inbox',
                          factory: $ComplianceInboxRouteExtension._fromState,
                        ),
                      ],
                    ),
                    StatefulShellBranchData.$branch(
                      routes: [
                        GoRouteData.$route(
                          path: '/compliance/sent',
                          name: 'Compliance Sent',
                          factory: $ComplianceSentRouteExtension._fromState,
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
                          path: '/sms/internal-audit-report',
                          name: 'Internal Audit Report',
                          factory:
                              $InternalAuditReportRouteExtension._fromState,
                        ),
                      ],
                    ),
                    StatefulShellBranchData.$branch(
                      routes: [
                        GoRouteData.$route(
                          path: '/sms/external-audit-report',
                          name: 'External Audit Report',
                          factory:
                              $ExternalAuditReportRouteExtension._fromState,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/crew-documents',
                  name: 'Crew Documents',
                  factory: $CrewDocumentsRouteExtension._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/profile',
                  name: 'Profile',
                  factory: $ProfileRouteExtension._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/help',
                  name: 'Help',
                  factory: $HelpRouteExtension._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/reset-password',
                  name: 'Reset Password',
                  factory: $ResetPasswordRouteExtension._fromState,
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
                  factory: $AircraftRouteExtension._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/admin/roles',
                  name: 'Roles',
                  factory: $RolesRouteExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: ':roleId',
                      name: 'Crew Document Categories',
                      factory: $CrewDocumentCategoriesRouteExtension._fromState,
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
                  factory: $StaffRouteExtension._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              routes: [
                GoRouteData.$route(
                  path: '/admin/categories',
                  name: 'Categories',
                  factory: $CategoriesRouteExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: ':categoryId',
                      name: 'Subcategories',
                      factory: $SubcategoriesRouteExtension._fromState,
                    ),
                  ],
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

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DocumentsRouteExtension on DocumentsRoute {
  static DocumentsRoute _fromState(GoRouterState state) =>
      const DocumentsRoute();

  String get location => GoRouteData.$location(
        '/documents',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SmsShellRouteDataExtension on SmsShellRouteData {
  static SmsShellRouteData _fromState(GoRouterState state) =>
      const SmsShellRouteData();
}

extension $SmsInboxRouteExtension on SmsInboxRoute {
  static SmsInboxRoute _fromState(GoRouterState state) => const SmsInboxRoute();

  String get location => GoRouteData.$location(
        '/sms/inbox',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SmsSentRouteExtension on SmsSentRoute {
  static SmsSentRoute _fromState(GoRouterState state) => const SmsSentRoute();

  String get location => GoRouteData.$location(
        '/sms/sent',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CreateNoticeShellRouteDataExtension on CreateNoticeShellRouteData {
  static CreateNoticeShellRouteData _fromState(GoRouterState state) =>
      const CreateNoticeShellRouteData();
}

extension $NoticeToCrewRouteExtension on NoticeToCrewRoute {
  static NoticeToCrewRoute _fromState(GoRouterState state) =>
      const NoticeToCrewRoute();

  String get location => GoRouteData.$location(
        '/sms/notice-to-crew',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SafetyNoticeRouteExtension on SafetyNoticeRoute {
  static SafetyNoticeRoute _fromState(GoRouterState state) =>
      const SafetyNoticeRoute();

  String get location => GoRouteData.$location(
        '/sms/safety-notice',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HazardReportRouteExtension on HazardReportRoute {
  static HazardReportRoute _fromState(GoRouterState state) =>
      const HazardReportRoute();

  String get location => GoRouteData.$location(
        '/sms/hazard-report',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ComplianceShellRouteDataExtension on ComplianceShellRouteData {
  static ComplianceShellRouteData _fromState(GoRouterState state) =>
      const ComplianceShellRouteData();
}

extension $ComplianceInboxRouteExtension on ComplianceInboxRoute {
  static ComplianceInboxRoute _fromState(GoRouterState state) =>
      const ComplianceInboxRoute();

  String get location => GoRouteData.$location(
        '/compliance/inbox',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ComplianceSentRouteExtension on ComplianceSentRoute {
  static ComplianceSentRoute _fromState(GoRouterState state) =>
      const ComplianceSentRoute();

  String get location => GoRouteData.$location(
        '/compliance/sent',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CreateReportShellRouteDataExtension on CreateReportShellRouteData {
  static CreateReportShellRouteData _fromState(GoRouterState state) =>
      const CreateReportShellRouteData();
}

extension $InternalAuditReportRouteExtension on InternalAuditReportRoute {
  static InternalAuditReportRoute _fromState(GoRouterState state) =>
      const InternalAuditReportRoute();

  String get location => GoRouteData.$location(
        '/sms/internal-audit-report',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ExternalAuditReportRouteExtension on ExternalAuditReportRoute {
  static ExternalAuditReportRoute _fromState(GoRouterState state) =>
      const ExternalAuditReportRoute();

  String get location => GoRouteData.$location(
        '/sms/external-audit-report',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CrewDocumentsRouteExtension on CrewDocumentsRoute {
  static CrewDocumentsRoute _fromState(GoRouterState state) =>
      const CrewDocumentsRoute();

  String get location => GoRouteData.$location(
        '/crew-documents',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileRouteExtension on ProfileRoute {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HelpRouteExtension on HelpRoute {
  static HelpRoute _fromState(GoRouterState state) => const HelpRoute();

  String get location => GoRouteData.$location(
        '/help',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ResetPasswordRouteExtension on ResetPasswordRoute {
  static ResetPasswordRoute _fromState(GoRouterState state) =>
      const ResetPasswordRoute();

  String get location => GoRouteData.$location(
        '/reset-password',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AdminShellRouteDataExtension on AdminShellRouteData {
  static AdminShellRouteData _fromState(GoRouterState state) =>
      const AdminShellRouteData();
}

extension $AircraftRouteExtension on AircraftRoute {
  static AircraftRoute _fromState(GoRouterState state) => const AircraftRoute();

  String get location => GoRouteData.$location(
        '/admin/aircraft',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RolesRouteExtension on RolesRoute {
  static RolesRoute _fromState(GoRouterState state) => const RolesRoute();

  String get location => GoRouteData.$location(
        '/admin/roles',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CrewDocumentCategoriesRouteExtension on CrewDocumentCategoriesRoute {
  static CrewDocumentCategoriesRoute _fromState(GoRouterState state) =>
      CrewDocumentCategoriesRoute(
        roleId: state.pathParameters['roleId']!,
      );

  String get location => GoRouteData.$location(
        '/admin/roles/${Uri.encodeComponent(roleId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StaffRouteExtension on StaffRoute {
  static StaffRoute _fromState(GoRouterState state) => const StaffRoute();

  String get location => GoRouteData.$location(
        '/admin/staff',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CategoriesRouteExtension on CategoriesRoute {
  static CategoriesRoute _fromState(GoRouterState state) =>
      const CategoriesRoute();

  String get location => GoRouteData.$location(
        '/admin/categories',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SubcategoriesRouteExtension on SubcategoriesRoute {
  static SubcategoriesRoute _fromState(GoRouterState state) =>
      SubcategoriesRoute(
        categoryId: state.pathParameters['categoryId']!,
      );

  String get location => GoRouteData.$location(
        '/admin/categories/${Uri.encodeComponent(categoryId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'33d77f388773fe464240e522cbfe463c8d5295c9';

/// See also [Router].
@ProviderFor(Router)
final routerProvider = NotifierProvider<Router, GoRouter>.internal(
  Router.new,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Router = Notifier<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
