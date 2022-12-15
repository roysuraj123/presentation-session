import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/table_controller.dart';

class TableView extends GetView<TableController> {
  const TableView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('TableView'),
          centerTitle: true,
        ),
        body: controller.userList.isNotEmpty
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical, child: _createDataTable())
            : const Center(child: CircularProgressIndicator()),
      );
    });
  }

  _createDataTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _createRow(),
      columnSpacing: 2,
      border: TableBorder.all(color: Colors.green),
      dataRowColor: MaterialStateProperty.all(Colors.amber),
      checkboxHorizontalMargin: 2,
    );
  }

  List<DataRow> _createRow() {
    return controller.userList.map((element) {
      return DataRow(
        cells: [
          DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              element.name.toString(),
              textAlign: TextAlign.center,
            ),
          )),
          DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              element.email.toString(),
              textAlign: TextAlign.center,
            ),
          )),
          DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              element.phone.toString(),
              textAlign: TextAlign.center,
            ),
          )),
          DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              element.createdAt!.toIso8601String().substring(0, 10),
              textAlign: TextAlign.center,
            ),
          )),
        ],
      );
    }).toList();
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(
          label: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Name",
          textAlign: TextAlign.center,
        ),
      )),
      const DataColumn(
          label: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Email",
          textAlign: TextAlign.center,
        ),
      )),
      const DataColumn(
          label: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Phone",
          textAlign: TextAlign.center,
        ),
      )),
      const DataColumn(
          label: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Created At",
          textAlign: TextAlign.center,
        ),
      )),
    ];
  }
}
