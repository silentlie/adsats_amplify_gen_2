import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/actions.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/staff_view.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class StaffDataSource extends DataTableSource {
  StaffDataSource({required this.sortedData, required this.context});
  List<Staff> sortedData;
  BuildContext context;

  @override
  int get rowCount => sortedData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final staff = sortedData[index];
    return DataRow2.byIndex(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return StaffView(
              staff: staff,
            );
          },
        );
      },
      index: index,
      cells: [
        DataCell(
          staff.firstName.centeredTextWidget(),
        ),
        DataCell(
          staff.lastName.centeredTextWidget(),
        ),
        DataCell(
          staff.email.centeredTextWidget(),
        ),
        DataCell(
          (staff.aircraft?.map((e) => e.aircraft!.name).join(', ') ?? "")
              .centeredTextWidget(),
        ),
        DataCell(
          (staff.roles?.map((e) => e.role!.name).join(', ') ?? "")
              .centeredTextWidget(),
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
                color: staff.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(staff.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          (staff.createdAt?.toCompactDateString ?? "").centeredTextWidget(),
        ),
        DataCell(
          Center(
            child: StaffActions(
              staff: staff,
            ),
          ),
        ),
      ],
    );
  }
}
