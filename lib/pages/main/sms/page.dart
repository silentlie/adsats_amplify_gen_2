import 'package:flutter/material.dart';

export 'notices/shell.dart';
export 'create/shell.dart';
export 'notice/page.dart';

class SMSPage extends StatelessWidget {
  const SMSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
