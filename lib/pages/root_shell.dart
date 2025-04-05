import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'package:adsats_amplify_gen_2/pages/main/shell.dart';
export 'package:adsats_amplify_gen_2/pages/admin/shell.dart';

class RootShell extends ConsumerWidget {
  const RootShell({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return child;
  }
}
