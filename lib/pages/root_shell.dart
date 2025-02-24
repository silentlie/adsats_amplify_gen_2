import 'package:flutter/material.dart';

export 'package:adsats_amplify_gen_2/pages/main/shell.dart';
export 'package:adsats_amplify_gen_2/pages/admin/shell.dart';

class RootShell extends StatelessWidget {
  const RootShell({
    super.key,
    required this.child,
  });
  final Widget child;



  @override
  Widget build(BuildContext context) {
    return child;
  }
}
