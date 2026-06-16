import 'package:adsats_amplify_gen_2/auth/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

export 'main/shell.dart';
export 'admin/shell.dart';
export 'profile/shell.dart';

class RootShell extends ConsumerStatefulWidget {
  const RootShell({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<RootShell> createState() => _RootShellState();
}

class _RootShellState extends ConsumerState<RootShell>
    with WidgetsBindingObserver {
  DateTime _lastPing = DateTime.fromMillisecondsSinceEpoch(0);
  static const _throttle = Duration(seconds: 15);
  String? _lastLocation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    HardwareKeyboard.instance.addHandler(_handleKeyEvent);
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleKeyEvent);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _ping();
    }
  }

  bool _handleKeyEvent(KeyEvent event) {
    _ping();
    return false;
  }

  void _ping() {
    final now = DateTime.now();
    if (now.difference(_lastPing) >= _throttle) {
      _lastPing = now;
      ref.read(sessionManagerProvider.notifier).markUserActive();
    }
  }

  void _trackRouteActivity(String location) {
    final lastLocation = _lastLocation;
    _lastLocation = location;
    if (lastLocation == null || lastLocation == location) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _ping();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ensure SessionManager stays initialized/alive
    ref.watch(sessionManagerProvider);
    _trackRouteActivity(GoRouter.of(context).state.uri.toString());

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) => _ping(),
      onPointerHover: (_) => _ping(),
      onPointerMove: (_) => _ping(),
      onPointerSignal: (_) => _ping(),
      child: widget.child,
    );
  }
}
