import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/auth/sign_out_button_widget.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/compliance_route/compliance_widget.dart';
import 'package:adsats_amplify_gen_2/route/crew_documents_route/crew_documents_widget.dart';
import 'package:adsats_amplify_gen_2/route/documents_route/documents_widget.dart';
import 'package:adsats_amplify_gen_2/route/help_route/help_widget.dart';
import 'package:adsats_amplify_gen_2/route/home_route/home_widget.dart';
import 'package:adsats_amplify_gen_2/route/profile_route/profile_widget.dart';
import 'package:adsats_amplify_gen_2/route/admin_route/admin_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_widget.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/sms_widget.dart';
import 'package:adsats_amplify_gen_2/route/training_route/training_widget.dart';
import 'package:adsats_amplify_gen_2/scaffold/scaffod_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: HomeWidget.path,
  debugLogDiagnostics: false,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        AuthNotifier authNotifier =
            Provider.of<AuthNotifier>(context, listen: false);
        if (authNotifier.isSignedIn) {
          authNotifier.fetchCognitoAuthSession();
          return MyScaffold(child: child);
        }
        return FutureBuilder(
          future: authNotifier.fetchCognitoAuthSession(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text('Error: ${snapshot.error}'),
                  const SignOutButtonWidget(),
                ],
              );
            } else if (snapshot.hasData) {
              if (snapshot.data!) {
                return MyScaffold(child: child);
              } else {
                return Column(
                  children: [
                    Text(
                      'Error access denied, user status: ${snapshot.data!}',
                    ),
                    const SignOutButtonWidget(),
                  ],
                );
              }
            } else {
              return const Placeholder();
            }
          },
        );
      },
      routes: [
        GoRoute(
          path: HomeWidget.path,
          builder: (context, state) => const HomeWidget(),
        ),
        GoRoute(
          path: DocumentsWidget.path,
          builder: (context, state) => const DocumentsWidget(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileWidget(),
        ),
        GoRoute(
          path: HelpWidget.path,
          builder: (context, state) => const HelpWidget(),
        ),
        GoRoute(
          path: AdminWidget.path,
          builder: (context, state) {
            if (!Provider.of<AuthNotifier>(context, listen: false).isAdmin) {
              context.go(HomeWidget.path);
            }
            return const AdminWidget();
          },
        ),
        GoRoute(
          path: CrewDocumentsWidget.path,
          builder: (context, state) {
            if (!Provider.of<AuthNotifier>(context, listen: false).isAdmin) {
              context.go(HomeWidget.path);
            }
            return const CrewDocumentsWidget();
          },
        ),
        GoRoute(
          path: SMSWidget.path,
          builder: (context, state) {
            if (state.extra == null) {
              return const SMSWidget();
            }
            Notice notice = state.extra as Notice;
            return NoticeWidget(notice: notice);
          },
        ),
        GoRoute(
          path: ComplianceWidget.path,
          builder: (context, state) => const ComplianceWidget(),
        ),
        GoRoute(
          path: TrainingWidget.path,
          builder: (context, state) => const TrainingWidget(),
        ),
        GoRoute(
          path: NoticeWidget.path,
          builder: (context, state) => const NoticeWidget(),
        ),
      ],
    ),
  ],
);
