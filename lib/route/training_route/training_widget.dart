import 'package:flutter/material.dart';

class TrainingWidget extends StatelessWidget {
  const TrainingWidget({super.key});

  static String path = '/training';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536.0),
        child: const Card(child: Text("Training")),
      ),
    );
  }
}
