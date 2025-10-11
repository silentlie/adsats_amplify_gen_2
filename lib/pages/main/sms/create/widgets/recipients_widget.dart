import 'package:adsats_amplify_gen_2/helper/extensions/fav_sort.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/staff_name_extension.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notice_form.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([NoticeForm, listAircraft, listRoles, listStaff])
class NoticeRecipientsWidget extends HookConsumerWidget {
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
    if (!editMode) {
      final aircraftScroll = useScrollController();
      final recipientsScroll = useScrollController();
      return Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade800),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                interactive: true,
                controller: aircraftScroll,
                child: SingleChildScrollView(
                  controller: aircraftScroll,
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.all(8.0).copyWith(bottom: 16.0),
                    child: Row(
                      children: [
                        Text("Aircraft:"),
                        ...state.aircraft.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Chip(label: Text(e.name)),
                          ),
                        ),
                        if (state.aircraft.isEmpty) Text("Nil"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade800),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                interactive: true,
                controller: recipientsScroll,
                child: SingleChildScrollView(
                  controller: recipientsScroll,
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.all(8.0).copyWith(bottom: 16.0),
                    child: Row(
                      children: [
                        Text("Recipients:"),
                        ...state.recipients
                            .sortedByFav(
                              isFav: (e) => e.readAt == null,
                              getField: (e) => e.staff!.fullName,
                            )
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Chip(
                                  label: Text(e.staff!.fullName),
                                  color: WidgetStateProperty.all(
                                    e.readAt != null
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ),
                            ),
                        if (state.recipients.isEmpty) Text("Nil"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
    final isSafetyOfficer = ref.watch(isSafetyOfficerProvider);
    return Row(
      children: [
        Expanded(
          child: AsyncValueWidget(
            // TODO: FutureWidget
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
        if (!isDraft)
          Expanded(
            child: AsyncValueWidget(
              // TODO: FutureWidget
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
        if (!isDraft && isSafetyOfficer)
          Expanded(
            child: AsyncValueWidget(
              // TODO: FutureWidget
              value: ref.watch(listStaffProvider()),
              data: (value) {
                return MultiSelectFormField<Staff>(
                  title: "Recipients",
                  items: value,
                  toCard: (value) {
                    return CheckListCard(
                      value: value,
                      title: Text(value.fullName),
                    );
                  },
                  onSaved: (newValue) {
                    notifier.updateNotice(recipients: newValue);
                  },
                  initialValue: state.recipients.map((e) => e.staff!).toList(),
                );
              },
            ),
          ),
      ],
    );
  }
}
