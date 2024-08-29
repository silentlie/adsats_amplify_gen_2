import 'package:adsats_amplify_gen_2/auth/auth.dart';
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
        return FutureBuilder(
          future: authNotifier.fetchCognitoAuthSession(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              if (snapshot.data!) {
                return MyScaffold(child: child);
              } else {
                return Text(
                    'Error access denied, user status: ${snapshot.data!}');
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
          builder: (context, state) => const Placeholder(),
        ),
        // GoRoute(
        //   path: '/add-a-document',
        //   builder: (context, state) => const AddADocument(),
        // ),
        // GoRoute(
        //   path: '/profile',
        //   builder: (context, state) => const ProfileWidget(),
        // ),
        // GoRoute(
        //   path: '/help',
        //   builder: (context, state) => const HelpWidget(),
        // ),
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
        // GoRoute(
        //   path: '/compliance',
        //   builder: (context, state) => const ComplianceWidget(),
        // ),
        // GoRoute(
        //   path: '/training',
        //   builder: (context, state) => const TrainingWidget(),
        // ),
        // GoRoute(
        //   path: '/send-notices',
        //   builder: (context, state) => const SendNotices(),
        // ),
      ],
    ),
  ],
);
