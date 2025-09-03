import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

export 'home/page.dart';
export 'change_password/page.dart';
export 'records/page.dart';

class ProfileShell extends ConsumerWidget {
  const ProfileShell({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  void onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  int? validIndex() => (navigationShell.currentIndex >= 0 &&
          navigationShell.currentIndex < routes.length)
      ? navigationShell.currentIndex
      : null;

  final List<RouteInfoBase> routes = const [
    ProfileRoute(),
    ChangePasswordRoute(),
    ProfileRecordsRoute(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return navigationShell;
  }
}
