import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    Key? key,
    required this.columns,
    required this.rows,
    required this.sortIndex,
    required this.sortAscending,
  }) : super(key: key);
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final int sortIndex;
  final bool sortAscending;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: DataTable(
          sortAscending: sortAscending,
          sortColumnIndex: sortIndex,
          showBottomBorder: true,
          showCheckboxColumn: true,
          columns: columns,
          rows: rows,
        ),
      ),
    );
  }
}
