import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create_notice/state.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/view_notice/repo.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'page.dart';

class ViewNoticeRoute extends RouteInfo {
  const ViewNoticeRoute({required this.id});
  final String id;

  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Icon get icon => const Icon(Icons.support_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.support);
  @override
  String get label => 'View Notice';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return DialogPage(
      key: state.pageKey,
      child: ViewReportPage(
        id: id,
      ),
    );
  }
}
