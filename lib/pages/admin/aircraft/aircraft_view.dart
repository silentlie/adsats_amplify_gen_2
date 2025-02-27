import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/query_providers.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/repo.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AircraftView extends ConsumerWidget {
  const AircraftView({super.key, this.aircraft});

  final Aircraft? aircraft;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = this.aircraft != null;
    var aircraft = this.aircraft ??
        Aircraft(
          name: "",
          archived: false,
        );
    var staff = this.aircraft?.staff?.map(
          (e) {
            return e.staff!;
          },
        ).toList() ??
        [];
    return AlertDialog.adaptive(
      title: Text(
        isEditing ? 'Editing ${aircraft.name}' : 'Add an aircraft',
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Aircraft Name',
              ),
              onChanged: (value) {
                aircraft = aircraft.copyWith();
              },
              initialValue: aircraft.name,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description of the aircraft',
              ),
              initialValue: aircraft.description,
              onChanged: (value) {
                aircraft = aircraft.copyWith(description: value);
              },
              maxLines: 4,
            ),
          ),
          GlobalDropdownMenu(
            entries: const [
              DropdownMenuEntry(value: false, label: "False"),
              DropdownMenuEntry(value: true, label: "True"),
            ],
            onSelected: (value) {
              aircraft = aircraft.copyWith(archived: value!);
            },
            text: "Archived",
            initialSelection: aircraft.archived,
          ),
          AsyncValueWidget(
            value: ref.watch(listStaffProvider()),
            data: (value) {
              return GlobalMultiSelect<Staff>(
                text: "Choose Staff",
                onConfirm: (p0) {
                  staff = p0;
                },
                items: value.map(
                  (e) {
                    return MultiSelectItem(e, e.name);
                  },
                ).toList(),
                initialValue: staff,
              );
            },
          ),
        ],
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () async {
            final result = await showConfirmDialog(
              context,
              Text("Are you sure?"),
              Text("Do you want to cancel?"),
            );
            if (result && context.mounted) {
              Navigator.pop(context);
            }
          },
          label: const Text('Cancel'),
          icon: Icon(Icons.cancel_outlined),
        ),
        ElevatedButton.icon(
          onPressed: () async {
            final result = await showConfirmDialog(
              context,
              Text("Are you sure?"),
              Text("Do you want to ?"),
            );
            if (!result) {
              return;
            }
            //
            if (isEditing) {
              await Future.wait([
                updateAircraftStaff(aircraft, staff),
                update(aircraft),
              ]);
            } else {
              await Future.wait([
                create(aircraft),
                updateAircraftStaff(aircraft, staff),
              ]);
            }
            ref.invalidate(aircraftRepoProvider);
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          label: Text(isEditing ? 'Apply' : 'Create'),
          icon: Icon(
            isEditing ? Icons.edit_outlined : Icons.add_circle_outline,
          ),
        ),
      ],
    );
  }
}
