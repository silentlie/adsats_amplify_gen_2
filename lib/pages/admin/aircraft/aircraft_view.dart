import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/repo.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
      content: SingleChildScrollView(
        child: Column(
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
                  aircraft = aircraft.copyWith(name: value);
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
                return MultiSelectFormField<Staff>(
                  title: "Choose Staff",
                  items: value,
                  toCard: (value) {
                    return CheckListCard(
                      value: value,
                      title: Text("${value.firstName} ${value.lastName}"),
                    );
                  },
                  onChange: (newValue) {
                    staff = newValue;
                  },
                  initialValue: staff,
                );
              },
            ),
          ],
        ),
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
            if (!context.mounted) return;
            if (context.canPop()) {
              context.pop();
            } else {
              AircraftRoute().go(context);
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
