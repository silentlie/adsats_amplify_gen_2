import 'package:adsats_amplify_gen_2/API/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create_notice/state.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class NoticeRecipientsWidget extends ConsumerWidget {
  const NoticeRecipientsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(noticeNotifierProvider);
    final notifier = ref.read(noticeNotifierProvider.notifier);
    final isDraft = ref.watch(noticeNotifierProvider.select(
      (value) => value.isDraft,
    ));
    final editMode = ref.watch(noticeNotifierProvider.select(
      (value) => value.editMode,
    ));
    return Row(
      children: [
        if (editMode)
          Expanded(
            child: AsyncValueWidget(
              value: ref.watch(listAircraftProvider()),
              data: (value) {
                return GlobalMultiSelect<Aircraft>(
                  text: "Aircraft",
                  onConfirm: (p0) {
                    notifier.updateNotice(aircraft: p0);
                  },
                  items: value.map((e) {
                    return MultiSelectItem(e, e.name);
                  }).toList(),
                  initialValue: state.aircraft,
                );
              },
            ),
          ),
        if (editMode && !isDraft)
          Expanded(
            child: AsyncValueWidget(
              value: ref.watch(listRolesProvider()),
              data: (value) {
                return GlobalMultiSelect<Role>(
                  text: "Roles",
                  onConfirm: (p0) {
                    notifier.updateNotice(roles: p0);
                  },
                  items: value.map(
                    (e) {
                      return MultiSelectItem(e, e.name);
                    },
                  ).toList(),
                );
              },
            ),
          ),
        if (editMode && !isDraft)
          Expanded(
            child: AsyncValueWidget(
              value: ref.watch(listStaffProvider()),
              data: (value) {
                return GlobalMultiSelect<Staff>(
                  text: "Recipients",
                  onConfirm: (p0) {
                    notifier.updateNotice(recipients: p0);
                  },
                  items: value.map(
                    (e) {
                      return MultiSelectItem(e, e.name);
                    },
                  ).toList(),
                );
              },
            ),
          ),
        if (!editMode)
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Aircraft:"),
                    ...state.aircraft.map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Chip(label: Text(e.name)),
                      ),
                    ),
                    if (state.aircraft.isEmpty) Text("None"),
                  ],
                ),
              ),
            ),
          ),
        if (!editMode)
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text("Recipients:"),
                  ...state.recipients.map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Chip(label: Text(e.name)),
                      )),
                  if (state.recipients.isEmpty) Text("None"),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
