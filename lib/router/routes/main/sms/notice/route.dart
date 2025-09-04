import 'package:adsats_amplify_gen_2/pages/root_shell.dart';
import 'package:adsats_amplify_gen_2/router/dialog_page.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewNoticeRoute extends RouteInfo with $ViewNoticeRoute {
  const ViewNoticeRoute({required this.id});
  static const route = TypedGoRoute<ViewNoticeRoute>(
    path: ':id',
    name: 'View Notice',
  );
  final String id;

  static final $parentNavigatorKey = rootShellNavigatorKey;

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
      child: ViewNoticePage(
        id: id,
      ),
    );
  }
}
