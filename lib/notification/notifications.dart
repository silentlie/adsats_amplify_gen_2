import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications.g.dart';

@Riverpod(dependencies: [userDetails])
List<NoticeStaff> notifications(Ref ref) {
  // warning: list return a new instance which will cause rebuild even everything is the same
  return ref.watch(userDetailsProvider.select(
    (user) {
      return user.valueOrNull?.notifications ?? [];
    },
  ));
}

List<ListTile> buildNotifications(BuildContext context, WidgetRef ref) {
  IconData getIcon(String? type) {
    switch (type) {
      case "Notice_to_Crew":
        return Icons.notifications_outlined;
      case "Safety_notice":
        return Icons.gpp_maybe_outlined;
      case "Hazard_report":
        return Icons.report_outlined;
      default:
        return Icons.question_mark;
    }
  }

  return ref.watch(notificationsProvider).map(
    (e) {
      return ListTile(
        visualDensity: VisualDensity.standard,
        tileColor: Colors.blue.shade100,
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        title: RichText(
          text: TextSpan(
            text: 'Author: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                text: e.notice?.author?.name,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        subtitle: RichText(
          text: TextSpan(
            text: 'Subject: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                text: e.notice!.subject,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        leading: Icon(getIcon(e.notice!.type!.name)),
        onTap: () async {
          final response = await Amplify.API
              .query(
                request: GraphQLRequest(
                  document: getNoticeDetails,
                  variables: {
                    "id": e.notice!.id,
                  },
                ),
              )
              .response;
          if (response.errors.isNotEmpty) {
            throw response.errors.first;
          }
          Map<String, dynamic> jsonMap = json.decode(response.data);
          final notice = Notice.fromJson(jsonMap["getNotice"]);
          if (!context.mounted) return;
          //TODO go to sms with noticeId
        },
      );
    },
  ).toList();
}
