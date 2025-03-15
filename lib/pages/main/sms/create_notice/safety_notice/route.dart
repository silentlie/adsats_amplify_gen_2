import 'package:adsats_amplify_gen_2/helper/selected_files.dart';
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

class SafetyNoticeShellBranchData extends StatefulShellBranchData {
  const SafetyNoticeShellBranchData();
}

class SafetyNoticeRoute extends RouteInfo {
  const SafetyNoticeRoute();

  @override
  Icon get icon => const Icon(Icons.gpp_maybe_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.gpp_maybe);
  @override
  String get label => 'Safety Notice';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: SafetyNoticePage());
  }
}
