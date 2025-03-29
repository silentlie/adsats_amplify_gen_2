import 'package:adsats_amplify_gen_2/pages/main/compliance/create_report/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportRecipients extends ConsumerWidget {
  const ReportRecipients({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editMode = ref.watch(reportNotifierProvider.select(
      (value) => value.editMode,
    ));
    if (editMode) {
      return Text("This report will be sent to Quality Managers");
    }
    final state = ref.read(reportNotifierProvider);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Text("Recipients:"),
          ...state.recipients.map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Chip(label: Text("${e.firstName} ${e.lastName}")),
              )),
          if (state.recipients.isEmpty) Text("None"),
        ],
      ),
    );
  }
}
