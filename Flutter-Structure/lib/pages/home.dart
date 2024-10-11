import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double responsiveHeight = constraints.maxHeight;
            double responsiveWidth = constraints.maxWidth;
            return Center(
              child: Container(
                height: responsiveHeight * 0.31,
                width: responsiveWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DataTable(
                  border: TableBorder.all(width: 0.2),
                  columns: [
                    DataColumn(label: Text("")),
                    DataColumn(label: Text("1")),
                    DataColumn(label: Text("2")),
                    DataColumn(label: Text("3")),
                    DataColumn(label: Text("4")),
                  ],
                  rows: [

                    DataRow(cells: [
                      DataCell(Text("الاحد")),
                      DataCell(_fetchcontainer()),
                      DataCell(Container()),
                      DataCell(Text("A3")),
                      DataCell(Text("A4")),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("الاثنين")),
                      DataCell(Text("B1")),
                      DataCell(Text("B2")),
                      DataCell(Text("B3")),
                      DataCell(Text("B4")),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("الثلاثاء")),
                      DataCell(Text("B1")),
                      DataCell(Text("B2")),
                      DataCell(Text("B3")),
                      DataCell(Text("B4")),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("الاربعاء")),
                      DataCell(Text("B1")),
                      DataCell(Text("B2")),
                      DataCell(Text("B3")),
                      DataCell(Text("B4")),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("الاثنين")),
                      DataCell(Text("B1")),
                      DataCell(Text("B2")),
                      DataCell(Text("B3")),
                      DataCell(Text("B4")),
                    ]),
                    // يمكنك إضافة المزيد من الصفوف حسب الحاجة
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

 Container _fetchcontainer() {
    return Container(
     
      height: double.infinity,
      width: double.infinity,
      color: Colors.amber,
    );
  }
}
