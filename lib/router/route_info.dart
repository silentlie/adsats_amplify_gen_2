part of 'router.dart';

abstract class RouteInfoBase {
  const RouteInfoBase();
  Icon get icon;
  Icon get selectedIcon;
  String get label;
}

abstract class RouteInfo extends GoRouteData implements RouteInfoBase {
  const RouteInfo();
}

abstract class ShellRouteInfo extends ShellRouteData implements RouteInfoBase {
  const ShellRouteInfo();
}

abstract class StatefulShellRouteInfo extends StatefulShellRouteData implements RouteInfoBase {
  const StatefulShellRouteInfo();
}
