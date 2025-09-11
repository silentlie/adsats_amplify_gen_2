import 'package:adsats_amplify_gen_2/auth/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'main/shell.dart';
export 'admin/shell.dart';
export 'profile/shell.dart';

class RootShell extends ConsumerStatefulWidget {
  const RootShell({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<RootShell> createState() => _RootShellState();
}

class _RootShellState extends ConsumerState<RootShell> {
  DateTime _lastPing = DateTime.fromMillisecondsSinceEpoch(0);
  static const _throttle = Duration(seconds: 15);

  void _ping() {
    final now = DateTime.now();
    if (now.difference(_lastPing) >= _throttle) {
      _lastPing = now;
      ref.read(sessionManagerProvider.notifier).markUserActive();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ensure SessionManager stays initialized/alive
    ref.watch(sessionManagerProvider);

    return GestureDetector(
      // One low-cost signal for touch/mouse interaction
      behavior: HitTestBehavior.translucent,
      onTapDown: (_) => _ping(),
      onPanDown: (_) => _ping(), // drag start counts as activity
      child: widget.child,
    );
  }
}
