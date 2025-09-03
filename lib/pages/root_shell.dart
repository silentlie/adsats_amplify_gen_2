import 'package:adsats_amplify_gen_2/auth/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'main/shell.dart';
export 'admin/shell.dart';
export 'profile/shell.dart';

class RootShell extends ConsumerWidget {
  const RootShell({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sessionManagerProvider);
    return child;
  }
}
