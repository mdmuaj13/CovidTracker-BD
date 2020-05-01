import 'package:covid/data/http_service.dart';
import 'package:covid/model/corona.dart';
import 'package:covid/model/covid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class Records extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  final HttpService httpService = HttpService();
  var _dropdownValue = "Bangladesh";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Colors.deepPurple,
                Color(0xFFb6198a),
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/bg.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Text(
                                'Records ',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              Icon(Icons.notifications)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Container(),
                              Positioned(
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/3feet.png",
                                    width: 250.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // dropdownList(),
                  Container(
                    height: MediaQuery.of(context).size.height - 175.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: FutureBuilder(
                      future: httpService.getCovidData(),
                      builder: (BuildContext context,
                          AsyncSnapshot<Countrydatum> snapshot) {
                        if (snapshot.hasData) {
                          // Countrydatum c = snapshot.data;
                          return Column(
                            children: <Widget>[
                              Text(
                                "Timeline",
                                style: cBlockTitleText,
                              ),
                              Container(
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0.0, 5.0),
                                        blurRadius: 15.0,
                                        color: Colors.blueGrey)
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                            child: Text(
                                          "Date",
                                          style: cPositiveReportType,
                                        )),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: cWarningVLight,
                                        child: Center(
                                            child: Text(
                                          "Affected",
                                          style: cWarningReportType,
                                        )),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: cPositiveVLight,
                                        child: Center(
                                            child: Text(
                                          "Recovered",
                                          style: cPositiveReportType,
                                        )),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: cDangerVLight,
                                        child: Center(
                                            child: Text(
                                          "Dead",
                                          style: cDangerReportType,
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              timelineFutureBuilder(),
                            ],
                          );
                        }
                        return Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container dropdownList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      height: 40.0,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: Colors.black26,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.deepPurple[100],
              ),
              child: SvgPicture.asset(
                "assets/icons/maps-and-flags.svg",
                color: Colors.deepPurple,
                height: 20,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: DropdownButton(
                value: _dropdownValue,
                style: TextStyle(
                  fontSize: 18.0,
                  color: cPrimaryColor,
                ),
                isExpanded: true,
                underline: SizedBox(),
                icon: SvgPicture.asset(
                  "assets/icons/dropdown.svg",
                  height: 10,
                  color: Colors.deepPurple[200],
                ),
                items: ['Bangladesh', 'World']
                    .map<DropdownMenuItem<String>>((String newvalue) {
                  return DropdownMenuItem<String>(
                    value: newvalue,
                    child: Text(newvalue),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _dropdownValue = value;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<Corona>> timelineFutureBuilder() {
    return FutureBuilder(
      future: httpService.getCoronaData(),
      builder: (BuildContext context, AsyncSnapshot<List<Corona>> snapshot) {
        if (snapshot.hasData) {
          List<Corona> data = snapshot.data;

          return Expanded(
            child: ListView.builder(
                reverse: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var date = DateTime.parse(data[index].date.toIso8601String());
                  print(date.toString() + data[index].deaths.toString());
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100.0,
                    margin: EdgeInsets.only(bottom: 15.0),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: cPositiveVLight,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(2, 0),
                          color: Colors.grey
                        )
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                DateFormat.d()
                                    .format(data[index]
                                        .date
                                        // .subtract(Duration(days: 1))
                                        )
                                    .toString(),
                                style: cPositiveReportData,
                              ),
                              Text(
                                DateFormat.MMMM()
                                        .format(data[index].date)
                                        .toString() +
                                    ", " +
                                    DateFormat.y()
                                        .format(data[index].date)
                                        .toString(),
                              ),
                            ],
                          ),
                          Text(data[index].active.toString(),
                              style: cWarningReportData),
                          Text(
                            data[index].recovered.toString(),
                            style: cPositiveReportData,
                          ),
                          Text(
                            data[index].deaths.toString(),
                            style: cDangerReportData,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        }
        return Center(
            child: LinearProgressIndicator(
          backgroundColor: cGrandientColor1,
          valueColor: AlwaysStoppedAnimation<Color>(cGrandientColor2),
        ));
      },
    );
  }
}

class RightSideClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// Text(
//   'Total Cases',
//   style: cPositiveReportData,
// ),
// Padding(
//   padding: const EdgeInsets.all(14.0),
//   child: Container(
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey[400],
//             offset: Offset(0, 0),
//             blurRadius: 1.0,
//           )
//         ]),
//     child: Row(
//       mainAxisAlignment:
//           MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         SizedBox(
//           height: 150,
//           width: 120,
//           child: Container(
//             padding: EdgeInsets.all(10.0),
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.all(2.0),
//                   decoration: BoxDecoration(
//                     color: cPositiveVLight,
//                     borderRadius:
//                         BorderRadius.circular(20),
//                   ),
//                   child: Icon(
//                     Icons.favorite_border,
//                     size: 30.0,
//                     color: cPositive,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5.0,
//                 ),
//                 Text(
//                   c.totalRecovered.toString(),
//                   style: cPositiveReportData,
//                 ),
//                 SizedBox(
//                   height: 5.0,
//                 ),
//                 Text(
//                   "Recovered",
//                   style: cPositiveReportType,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 150,
//           width: 120,
//           child: Container(
//             padding: EdgeInsets.all(10.0),
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.all(2.0),
//                   decoration: BoxDecoration(
//                     color: cWarningVLight,
//                     borderRadius:
//                         BorderRadius.circular(20),
//                   ),
//                   child: Icon(
//                     Icons.add,
//                     size: 30.0,
//                     color: cWarning,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5.0,
//                 ),
//                 Text(
//                   c.totalActiveCases.toString(),
//                   style: cWarningReportData,
//                 ),
//                 SizedBox(
//                   height: 5.0,
//                 ),
//                 Text(
//                   "Affected",
//                   style: cWarningReportType,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 150,
//           width: 120,
//           child: Container(
//             padding: EdgeInsets.all(10.0),
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.all(2.0),
//                   decoration: BoxDecoration(
//                     color: cDangerVLight,
//                     borderRadius:
//                         BorderRadius.circular(20),
//                   ),
//                   child: Icon(
//                     Icons.clear,
//                     size: 30.0,
//                     color: cDanger,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5.0,
//                 ),
//                 Text(
//                   c.totalDeaths.toString(),
//                   style: cDangerReportData,
//                 ),
//                 SizedBox(
//                   height: 5.0,
//                 ),
//                 Text(
//                   "Dead",
//                   style: cDangerReportType,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
