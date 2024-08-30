part of 'data_table_2.dart';

abstract class MyDataTableSource extends DataTableSource {
  List<DataColumn2> get columns;
  Widget get header;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get selectedRowCount => 0;

  Widget getCenterText(String text) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
