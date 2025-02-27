import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/header.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/inbox/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/inbox/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/sort.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class SmsInboxShellBranchData extends StatefulShellBranchData {
  const SmsInboxShellBranchData();
}

class SmsInboxRoute extends RouteInfo {
  const SmsInboxRoute();

  @override
  Icon get icon => const Icon(Icons.inbox_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.inbox);
  @override
  String get label => 'Inbox';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: SmsInboxPage());
  }
}
