import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/widgets/actions.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/widgets/role.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
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
          role.name.centeredTextWidget(),
        ),
        DataCell(
          (role.description ?? "").centeredTextWidget(),
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
          (role.createdAt?.toCompactDateString ?? "").centeredTextWidget(),
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
