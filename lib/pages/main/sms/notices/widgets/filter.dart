import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/filter.dart';
import 'package:adsats_amplify_gen_2/widgets/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoticesFilterView extends ConsumerWidget {
  const NoticesFilterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filter = ref.watch(noticeFilterProvider);
    return AlertDialog.adaptive(
      title: const Text('Filter By:'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlobalDropdownMenu<NoticeType>(
            entries: NoticeType.values.map(
              (e) {
                return DropdownMenuEntry(
                    value: e, label: e.name.replaceAll('_', ' '));
              },
            ).toList(),
            onSelected: (value) {
              filter = filter.copyWith(type: value);
            },
            initialSelection: filter.type,
            text: "Notice Type",
          ),
          GlobalDropdownMenu<NoticeStatus>(
            entries: NoticeStatus.values.map(
              (e) {
                return DropdownMenuEntry(value: e, label: e.name);
              },
            ).toList(),
            onSelected: (value) {
              filter = filter.copyWith(status: value);
            },
            initialSelection: filter.status,
            text: "Notice Status",
          ),
          GlobalDropdownMenu(
            entries: const [
              DropdownMenuEntry(value: false, label: "False"),
              DropdownMenuEntry(value: true, label: "True"),
              DropdownMenuEntry(value: null, label: "All"),
            ],
            onSelected: (value) {
              filter = filter.copyWith(archived: value);
            },
            initialSelection: filter.archived,
            text: "Archived",
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: DateTimeRangePicker(
              text: "Select notice date range",
              onSubmitted: (value) {
                filter = filter.copyWith(noticedAt: value);
              },
              initialDateRange: filter.noticedAt,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: DateTimeRangePicker(
              text: "Select deadline date range",
              onSubmitted: (value) {
                filter = filter.copyWith(deadlineAt: value);
              },
              initialDateRange: filter.deadlineAt,
            ),
          ),
        ],
      ),
      actions: [
        // cancel
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            ref.invalidate(noticeFilterProvider);
            Navigator.pop(context);
          },
          child: const Text("Reset filter"),
        ),
        // apply
        TextButton(
          onPressed: () {
            ref.read(noticeFilterProvider.notifier).apply(filter);
            Navigator.pop(context);
          },
          child: const Text('Apply'),
        )
      ],
    );
  }
}
