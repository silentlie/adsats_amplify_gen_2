import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/helper/date_to_string.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/actions.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/role_view.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class RoleDataSource extends DataTableSource {
  RoleDataSource({required this.sortedData, required this.context});
  List<Role> sortedData;
  BuildContext context;
  @override
  int get rowCount => sortedData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final role = sortedData[index];
    return DataRow2.byIndex(
      onTap: () {
        FlightCrewRecordsCategoriesRoute(roleId: role.id).push(context);
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return RoleView(
              role: role,
            );
          },
        );
      },
      index: index,
      cells: [
        DataCell(
          getCenterText(role.name),
        ),
        DataCell(
          getCenterText(role.description ?? ""),
        ),
        DataCell(
          Center(
            child: Container(
              width: 60,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                // maybe make it follow color scheme
                color: role.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(role.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          getCenterText(
            toDateString(role.createdAt?.getDateTimeInUtc())
          ),
        ),
        DataCell(
          Center(
            child: RoleActions(
              role: role,
            ),
          ),
        ),
      ],
    );
  }
}
