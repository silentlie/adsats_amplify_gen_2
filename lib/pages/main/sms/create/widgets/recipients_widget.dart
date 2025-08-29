import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notice_form.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoticeRecipientsWidget extends ConsumerWidget {
  const NoticeRecipientsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(noticeFormProvider);
    final notifier = ref.read(noticeFormProvider.notifier);
    final isDraft = ref.watch(noticeFormProvider.select(
      (value) => value.isDraft,
    ));
    final editMode = ref.watch(noticeFormProvider.select(
      (value) => value.editMode,
    ));
    final isSafetyOfficer = ref.watch(isSafetyOfficerProvider);
    return Row(
      children: [
        if (editMode)
          Expanded(
            child: AsyncValueWidget(
              value: ref.watch(listAircraftProvider()),
              data: (value) {
                return MultiSelectFormField<Aircraft>(
                  title: "Aircraft",
                  items: value,
                  toCard: (value) {
                    return CheckListCard(
                      value: value,
                      title: Text(value.name),
                    );
                  },
                  onSaved: (newValue) {
                    notifier.updateNotice(aircraft: newValue);
                  },
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
                if (!isSafetyOfficer) {
                  notifier.updateNotice(
                      roles: value.where(
                    (element) {
                      return element.name == "Safety Officer";
                    },
                  ).toList());
                  return Text("This notice will be sent to Safety Officers");
                }
                return MultiSelectFormField<Role>(
                  title: "Roles",
                  items: value,
                  toCard: (value) {
                    return CheckListCard(
                      value: value,
                      title: Text(value.name),
                    );
                  },
                  onSaved: (newValue) {
                    notifier.updateNotice(roles: newValue);
                  },
                );
              },
            ),
          ),
        if (editMode && !isDraft && isSafetyOfficer)
          Expanded(
            child: AsyncValueWidget(
              value: ref.watch(listStaffProvider()),
              data: (value) {
                return MultiSelectFormField<Staff>(
                  title: "Recipients",
                  items: value,
                  toCard: (value) {
                    return CheckListCard(
                      value: value,
                      title: Text("${value.firstName} ${value.lastName}"),
                    );
                  },
                  onSaved: (newValue) {
                    notifier.updateNotice(recipients: newValue);
                  },
                  initialValue: state.recipients,
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
                    if (state.aircraft.isEmpty) Text("Nil"),
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
                        child:
                            Chip(label: Text("${e.firstName} ${e.lastName}")),
                      )),
                  if (state.recipients.isEmpty) Text("Nil"),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
