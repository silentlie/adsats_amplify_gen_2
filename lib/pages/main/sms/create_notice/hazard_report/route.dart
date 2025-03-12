import 'package:adsats_amplify_gen_2/API/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create_notice/actions_row_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create_notice/basic_details_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create_notice/documents_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create_notice/recipients_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create_notice/state.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';
part 'components.dart';

class HazardReportShellBranchData extends StatefulShellBranchData {
  const HazardReportShellBranchData();
}

class HazardReportRoute extends RouteInfo {
  const HazardReportRoute();

  @override
  Icon get icon => const Icon(Icons.report_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.report);
  @override
  String get label => 'Hazard Report';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(child: HazardReportPage());
  }
}
