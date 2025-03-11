import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create_notice/actions_row_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create_notice/basic_details_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create_notice/documents_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create_notice/recipients_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create_notice/state.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class NoticeToCrewShellBranchData extends StatefulShellBranchData {
  const NoticeToCrewShellBranchData();
}

class NoticeToCrewRoute extends RouteInfo {
  const NoticeToCrewRoute();

  @override
  Icon get icon => const Icon(Icons.notifications_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.notifications);
  @override
  String get label => 'Notice To Crew';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: NoticeToCrewPage());
  }
}
