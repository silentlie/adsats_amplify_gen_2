import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/constants/durations.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/staff_name_extension.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/models/new_documents.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewDocumentsDetailsForm extends ConsumerWidget {
  const NewDocumentsDetailsForm({
    super.key,
    required this.state,
    required this.onChanged,
  });

  final NewDocumentsState state;
  final ValueChanged<NewDocumentsState> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userDetailsProvider.select((value) => value.value!));
    final isAdmin = ref.watch(isAdminProvider);
    final subcategories =
        user.subcategories?.map((e) => e.subcategory).whereType<Subcategory>();
    final aircraft =
        user.aircraft?.map((e) => e.aircraft).whereType<Aircraft>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AsyncValueWidget(
          value: ref.watch(listStaffProvider()),
          data: (staff) {
            return GlobalDropdownMenu<Staff>(
              entries: staff.map(
                (value) {
                  return DropdownMenuEntry(
                    value: value,
                    label: value.fullName,
                  );
                },
              ).toList(),
              onSelected: (value) {
                if (value == null) return;
                onChanged(state.copyWith(uploader: value));
              },
              enabled: isAdmin,
              initialSelection: staff.firstWhere(
                (element) => element.id == state.uploader?.id,
                orElse: () => staff.first,
              ),
              text: 'Uploader',
            );
          },
        ),
        GlobalDropdownMenu<Subcategory>(
          entries: subcategories
                  ?.map(
                    (value) => DropdownMenuEntry(
                      value: value,
                      label: value.name,
                    ),
                  )
                  .toList() ??
              [],
          onSelected: (value) {
            if (value == null) return;
            onChanged(state.copyWith(subcategory: value));
          },
          enabled: isAdmin,
          text: 'Choose a subcategory',
          initialSelection: state.subcategory,
        ),
        GlobalDropdownMenu<bool>(
          entries: const [
            DropdownMenuEntry(value: false, label: 'No'),
            DropdownMenuEntry(value: true, label: 'Yes'),
          ],
          onSelected: (value) {
            if (value == null) return;
            onChanged(state.copyWith(archived: value));
          },
          initialSelection: state.archived,
          text: 'Archived',
        ),
        MultiSelectFormField<Aircraft>(
          title: 'Select aircraft',
          items: aircraft?.toList() ?? [],
          toCard: (value) {
            return CheckListCard<Aircraft>(
              value: value,
              title: Text(value.name),
            );
          },
          onChange: (value) {
            onChanged(state.copyWith(aircraft: value));
          },
          initialValue: state.aircraft,
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        ),
        DatePickerWidget(
          text: 'Issue Date',
          firstDate: DateTime.now().subtract(kTwentyFiveYearDuration),
          lastDate: DateTime.now().add(kTwentyFiveYearDuration),
          onSelected: (value) {
            onChanged(state.copyWith(issuedAt: value));
          },
          initialValue: state.issuedAt,
        ),
        DatePickerWidget(
          text: 'Expired date',
          firstDate: DateTime.now().subtract(kTwentyFiveYearDuration),
          lastDate: DateTime.now().add(kTwentyFiveYearDuration),
          onSelected: (value) {
            onChanged(state.withExpiredAt(value));
          },
          initialValue: state.expiredAt,
        ),
      ],
    );
  }
}
