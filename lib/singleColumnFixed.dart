import 'package:flutter/material.dart';

class Single_Column extends StatelessWidget {
  const Single_Column();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Single Column"
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Row(
              children: [
                // Fixed first column
                Container(
                  width: 120, // Width of the first column
                  child: DataTable(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    columns: [
                      DataColumn(
                        label: Text('Column A'),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      100,
                          (index) => DataRow(cells: [
                        DataCell(Text('A' * (10 - index % 10))),
                      ]),
                    ),
                  ),
                ),
                // Scrollable columns
                Container(
                  width: MediaQuery.of(context).size.width - 130,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      columns: [
                        DataColumn(
                          label: Text('Column B'),
                        ),
                        DataColumn(
                          label: Text('Column C'),
                        ),
                        DataColumn(
                          label: Text('Column D'),
                        ),
                        DataColumn(
                          label: Text('Column NUMBERS'),
                          numeric: true,
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        100,
                            (index) => DataRow(cells: [
                          DataCell(Text('B' * (10 - (index + 5) % 10))),
                          DataCell(Text('C' * (15 - (index + 5) % 10))),
                          DataCell(Text('D' * (15 - (index + 10) % 10))),
                          DataCell(Text(((index + 0.1) * 25.4).toStringAsFixed(2))) // Display with two decimal places
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
