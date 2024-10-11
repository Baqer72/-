import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/report.dart';

class Tablee extends StatefulWidget {
  const Tablee({super.key});

  @override
  State<Tablee> createState() => _TableState();
}

class _TableState extends State<Tablee> {
  List<dynamic> tableList = [];
  List<Report> reports = [];

  @override
  void initState() {
    super.initState();
    fetch();
    fetchReports();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double responsiveHeight = constraints.maxHeight;
              double responsiveWidth = constraints.maxWidth;

              return Column(
                children: [
                  SizedBox(
                    height: responsiveHeight * 0.4,
                    child: Center(
                      child: Container(
                        height: responsiveHeight * 0.3,
                        width: responsiveWidth * 0.96,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(0, 248, 248, 248),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(61, 0, 0, 0)
                                    .withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(1, 3),
                              ),
                            ]),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: responsiveHeight * 0.3,
                              width: responsiveWidth * 0.96,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildHeader(
                                      responsiveWidth, responsiveHeight),
                                  _buildDayRow("الاحد", 0, responsiveWidth,
                                      responsiveHeight),
                                  _buildDayRow("الاثنين", 5, responsiveWidth,
                                      responsiveHeight),
                                  _buildDayRow("الثلاثاء", 10, responsiveWidth,
                                      responsiveHeight),
                                  _buildDayRow("الاربعاء", 15, responsiveWidth,
                                      responsiveHeight),
                                  _buildDayRow("الخميس", 20, responsiveWidth,
                                      responsiveHeight),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: responsiveHeight * 0.6,
                    width: responsiveWidth,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.1,
                            color: const Color.fromARGB(255, 177, 177, 177)),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: const Color.fromARGB(255, 247, 247, 247)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            "التبليغات",
                            style:
                                TextStyle(fontSize: 24, fontFamily: "arabic"),
                          ),
                        ),
                        SizedBox(
                          height: responsiveHeight * 0.53,
                          child: ListView.builder(
                            itemCount: reports.length,
                            itemBuilder: (BuildContext context, int index) {
                              final report = reports[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 16.0, right: 8, left: 8),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            child: Container(
                                              width: responsiveWidth * 0.8,
                                              height: responsiveHeight * 0.3,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Text(
                                                      report.title,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                          fontFamily: "arabic"),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Text(
                                                      report.description,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey,
                                                          fontFamily: "arabic"),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: TextButton(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text("إغلاق"),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: responsiveHeight * 0.15,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color.fromARGB(
                                                    255, 0, 0, 0)
                                                .withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: Offset(1, 3),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          report.mainAttachment == ""
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Container(
                                                      height: responsiveHeight *
                                                          0.135,
                                                      width: responsiveHeight *
                                                          0.135,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              225,
                                                              151,
                                                              222),
                                                    ),
                                                  ),
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image.network(
                                                      "https://k80sowk80c808s4cogk0woc0.158.220.126.158.sslip.io/${report.mainAttachment}",
                                                      fit: BoxFit.cover,
                                                      height: responsiveHeight *
                                                          0.135,
                                                      width: responsiveHeight *
                                                          0.135,
                                                    ),
                                                  ),
                                                ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  report.title,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  report.description,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    ]);
  }

  Widget _buildHeader(double responsiveWidth, double responsiveHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
          child: Container(
            width: responsiveWidth * 0.1,
            height: responsiveHeight * 0.05,
            decoration: BoxDecoration(border: Border.all(width: 0.2)),
            child: Center(child: Text("")),
          ),
        ),
        Row(
          children: List.generate(5, (index) {
            List<String> time = [
              "10:00-12:00",
              "12:00-2:00",
              "2:00-4:00",
              "4:00-6:00",
              "6:00-8:00"
            ];
            return Container(
              width: responsiveWidth * 0.172,
              height: responsiveHeight * 0.05,
              decoration: BoxDecoration(border: Border.all(width: 0.2)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${index + 1}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "${time[index]}",
                      style: TextStyle(fontSize: 8),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  
  

  Widget _buildDayRow(String dayName, int startIndex, double responsiveWidth,
      double responsiveHeight) {
    return Row(
      children: [
        Container(
          width: responsiveWidth * 0.1,
          height: responsiveHeight * 0.05,
          decoration: BoxDecoration(border: Border.all(width: 0.2)),
          child: Center(child: Text(dayName, style: TextStyle(fontSize: 12))),
        ),
        ..._buildStudyMaterialsRow(
            startIndex, responsiveWidth, responsiveHeight),
      ],
    );
  }

  List<Widget> _buildStudyMaterialsRow(
      int startIndex, double responsiveWidth, double responsiveHeight) {
    List<Widget> containers = [];
    for (int i = 0; i < 5; i++) {
      if (startIndex + i < tableList.length) {
        var material = tableList[startIndex + i];
        containers.add(
          _fetchContainer(
            material['materialName'] ?? '',
            responsiveWidth * 0.172,
            responsiveHeight * 0.05,
            material['doctorName'] ?? '',
            material['studyHall'] ?? '',
            material['color'] ?? '#FFFFFF',
          ),
        );
      } else {
        containers.add(_fetchContainer('', responsiveWidth * 0.172,
            responsiveHeight * 0.05, '', '', '#FFFFFF'));
      }
    }
    return containers;
  }

  Container _fetchContainer(String materialName, double w, double h,
      String doctorName, String studyHall, String colorHex) {
    Color color = Color(int.parse(colorHex.replaceFirst("#", "0xff")));
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        border: Border.all(width: 0.1),
        color: color,
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Center(
                child: Wrap(children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(materialName,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 8)))
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(studyHall, style: TextStyle(fontSize: 4)),
                  Text(doctorName, style: TextStyle(fontSize: 4)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetch() async {
    const url =
        "http://k80sowk80c808s4cogk0woc0.158.220.126.158.sslip.io/api/dayofweek_table";
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<dynamic> allMaterials = [];

      for (var day in data) {
        allMaterials.addAll(day['studyMaterials']);
      }

      setState(() {
        tableList = allMaterials;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchReports() async {
    const url =
        "https://k80sowk80c808s4cogk0woc0.158.220.126.158.sslip.io/api/reports";
    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri);
      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        List<Report> fetchedReports = [];

        for (var item in data['data']) {
          fetchedReports.add(Report.fromJson(item));
        }

        setState(() {
          reports = fetchedReports;
        });
      } else {
        throw Exception('Failed to load reports');
      }
    } catch (error) {
      print("Error fetching reports: $error");
    }
  }
}
