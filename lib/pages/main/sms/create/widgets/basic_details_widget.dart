import 'package:adsats_amplify_gen_2/helper/extensions/staff_name_extension.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notice_form.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoticeBasicDetailsWidget extends ConsumerWidget {
  const NoticeBasicDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notice = ref.watch(noticeFormProvider).notice;
    final isSafetyOfficer = ref.watch(isSafetyOfficerProvider);
    final notifier = ref.read(noticeFormProvider.notifier);
    final isEditMode = ref.watch(noticeFormProvider.select(
      (value) => value.editMode,
    ));
    return Column(
      children: [
        const Divider(),
        Row(
          children: [
            Expanded(
              child: GlobalTextFormField(
                labelText: 'Notice ID',
                enabled: false,
                initialValue: notice.id,
                onSaved: (value) {},
              ),
            ),
            Expanded(
              child: AsyncValueWidget(
                value: ref.watch(listStaffProvider()),
                data: (value) {
                  final initialSelection = value.firstWhere(
                    (e) => e.id == notice.author!.id,
                  );
                  return GlobalDropdownMenu<Staff>(
                    entries: value.map(
                      (e) {
                        return DropdownMenuEntry(
                          value: e,
                          label: e.fullName,
                        );
                      },
                    ).toList(),
                    enabled: isSafetyOfficer && isEditMode,
                    initialSelection: initialSelection,
                    onSelected: (value) {
                      notifier.updateNotice(author: value);
                    },
                    text: "Author of this notice",
                  );
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: DatePickerWidget(
                text: "Notice Date",
                onSelected: (value) {
                  notifier.updateNotice(noticedDate: value);
                },
                enabled: isEditMode,
                initialValue: notice.noticedAt,
                firstDate: DateTime.now().subtract(
                  const Duration(days: 365 * 10),
                ),
                lastDate: DateTime.now(),
              ),
            ),
            Expanded(
              child: DatePickerWidget(
                text: "Deadline Date",
                onSelected: (value) {
                  notifier.updateNotice(deadlineDate: value);
                },
                enabled: isEditMode,
                initialValue: notice.deadlineAt,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  const Duration(days: 365 * 10),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: GlobalTextFormField(
                labelText: "Subject",
                onSaved: (value) {
                  notifier.updateNotice(subject: value);
                },
                initialValue: notice.subject,
                enabled: isEditMode,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu(
                  dropdownMenuEntries: NoticeStatus.values
                      .where(
                        (element) {
                          if (element != NoticeStatus.Pending ||
                              element != NoticeStatus.Resolved) {
                            return true;
                          }
                          return isSafetyOfficer;
                        },
                      )
                      .map((e) => DropdownMenuEntry(value: e, label: e.name))
                      .toList(),
                  initialSelection: notice.status,
                  enabled: isEditMode,
                  onSelected: (value) {
                    notifier.switchStatus(value!);
                  },
                  hintText: "Status of this notice",
                  menuHeight: 200,
                  expandedInsets: EdgeInsets.zero,
                  label: Text("Status of this notice"),
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ],
    );
  }
}
