import 'package:flutter/material.dart';

class ComplianceWidget extends StatelessWidget {
  const ComplianceWidget({super.key});

  static String path = '/compliance';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536.0),
        child: const Card(child: Text("Compliance")),
      ),
    );
  }
}
