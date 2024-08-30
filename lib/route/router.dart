import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/auth/sign_out_button_widget.dart';
import 'package:adsats_amplify_gen_2/route/compliance_route/compliance_widget.dart';
import 'package:adsats_amplify_gen_2/route/documents_route/add_a_document/add_a_document_widget.dart';
import 'package:adsats_amplify_gen_2/route/documents_route/documents_widget.dart';
import 'package:adsats_amplify_gen_2/route/help_route/help_widget.dart';
import 'package:adsats_amplify_gen_2/route/profile_route/profile_widget.dart';
import 'package:adsats_amplify_gen_2/route/training_route/training_widget.dart';
import 'package:adsats_amplify_gen_2/scaffold/scaffod_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/documents',
  debugLogDiagnostics: false,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
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
              return Text('Error: ${snapshot.error}');
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
          path: '/documents',
          builder: (context, state) => const DocumentsWidget(),
        ),
        GoRoute(
          path: '/add-a-document',
          builder: (context, state) => const AddADocumentWidget(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileWidget(),
        ),
        GoRoute(
          path: '/help',
          builder: (context, state) => const HelpWidget(),
        ),
        // GoRoute(
        //   path: '/settings',
        //   builder: (context, state) => const SettingsWidget(),
        // ),
        // GoRoute(
        //   path: '/resetPassword',
        //   builder: (context, state) => const CustomResetPasswordForm(),
        // ),
        // GoRoute(
        //   path: '/sms',
        //   builder: (context, state) => const SMSWidget(),
        //   routes: [
        //     GoRoute(
        //       path: ':notice_id',
        //       builder: (context, state) {
        //         String? noticeID = state.pathParameters["notice_id"];
        //         if (noticeID != null && noticeID.isNotEmpty) {
        //           int? parsedID = int.tryParse(noticeID);
        //           if (parsedID != null) {
        //             return SpecificNoticeWidget(
        //               documentID: parsedID,
        //             );
        //           }
        //         }
        //         return const Placeholder();
        //       },
        //     ),
        //   ],
        // ),
        GoRoute(
          path: '/compliance',
          builder: (context, state) => const ComplianceWidget(),
        ),
        GoRoute(
          path: '/training',
          builder: (context, state) => const TrainingWidget(),
        ),
        // GoRoute(
        //   path: '/send-notices',
        //   builder: (context, state) => const SendNotices(),
        // ),
      ],
    ),
  ],
);
