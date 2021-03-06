import 'package:covid/constants.dart';
import 'package:covid/data/http_service.dart';
import 'package:covid/model/corona.dart';
import 'package:covid/model/covid.dart';
import 'package:covid/screen/record.dart';
import 'package:covid/widget/myheader.dart';
import 'package:covid/widget/symptom_card.dart';
import 'package:flutter/material.dart'; 

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final HttpService httpService = HttpService();

  // var _dropdownValue = "Bangladesh";
  DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MyHeader(
                image: "assets/icons/coronadr.svg",
                bgImage: "assets/images/virus.png",
                topText: "Stay Home",
                bottomText: "Stay Safe",
              ),
              // dropdownMenu(),

              Padding(
                padding: EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Update For Covid-19 ",
                            style: cBlockTitleText,
                          ),
                          Text(
                            "Data source from Johns Hopkins CSSE",
                            style: cBlockDetailText.copyWith(fontSize: 12.0),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      Spacer(),
                      FlatButton(
                        child: Text("See Details"),
                        color: Colors.white,
                        textColor: cDetailColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: cDetailColor),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Records()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400],
                            offset: Offset(0, 0),
                            blurRadius: 1.0,
                          )
                        ]),
                    child: FutureBuilder(
                      future: httpService.getCovidData(),
                      builder: (BuildContext context,
                          AsyncSnapshot<Countrydatum> snapshot) {
                        if (snapshot.hasData) {
                          Countrydatum c = snapshot.data;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                height: 150,
                                width: 120,
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: cPositiveVLight,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Icon(
                                          Icons.favorite_border,
                                          size: 30.0,
                                          color: cPositive,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        c.totalRecovered.toString(),
                                        style: cPositiveReportData,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "Recovered",
                                        style: cPositiveReportType,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 150,
                                width: 120,
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: cWarningVLight,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 30.0,
                                          color: cWarning,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        c.totalActiveCases.toString(),
                                        style: cWarningReportData,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "Affected",
                                        style: cWarningReportType,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 150,
                                width: 120,
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: cDangerVLight,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          size: 30.0,
                                          color: cDanger,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        c.totalDeaths.toString(),
                                        style: cDangerReportData,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "Dead",
                                        style: cDangerReportType,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }

                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 18.0,right: 18.0),
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Last 24 hours",
                      style: cBlockTitleText,
                      textAlign: TextAlign.start,
                    ), 
                    Text(
                       httpService.getLastDate() ,
                      style: cBlockTitleText.copyWith(fontSize: 12.0,color: Colors.grey),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400],
                            offset: Offset(0, 0),
                            blurRadius: 1.0,
                          )
                        ]),
                    child: FutureBuilder(
                      future: httpService.getNewResult(),
                      builder: (BuildContext context,
                          AsyncSnapshot<Corona> snapshot) {
                        if (snapshot.hasData) {
                          Corona data = snapshot.data;
                          // String lastData = data.date.toIso8601String();
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                height: 150,
                                width: 120,
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: cPositiveVLight,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Icon(
                                          Icons.favorite_border,
                                          size: 30.0,
                                          color: cPositive,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        data.recovered.toString(),
                                        style: cPositiveReportData,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "Recovered",
                                        style: cPositiveReportType,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 150,
                                width: 120,
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: cWarningVLight,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 30.0,
                                          color: cWarning,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        data.confirmed.toString(),
                                        style: cWarningReportData,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "Affected",
                                        style: cWarningReportType,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 150,
                                width: 120,
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: cDangerVLight,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          size: 30.0,
                                          color: cDanger,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        data.deaths.toString(),
                                        style: cDangerReportData,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "Dead",
                                        style: cDangerReportType,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }

                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Symptoms",
                                style: cBlockTitleText,
                              ),
                            ],
                          ),
                          Spacer(),
                          FlatButton(
                            child: Text("See Details"),
                            color: Colors.white,
                            textColor: cDetailColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: cDetailColor),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, 'symtomps');
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/fever.png",
                          title: "Fever",
                        ),
                        SymptomCard(
                          image: "assets/images/caugh.png",
                          title: "Caugh",
                        ),
                        SymptomCard(
                          image: "assets/images/headache.png",
                          title: "Headache",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Prevention",
                            style: cBlockTitleText,
                          ),
                          Spacer(),
                          FlatButton(
                            child: Text("See Details"),
                            color: Colors.white,
                            textColor: cDetailColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: cDetailColor),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, 'prevention');
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 120.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          SymptomCard(
                            image: "assets/images/prev5.png",
                            title: "Wash hand",
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          SymptomCard(
                            image: "assets/images/prev4.png",
                            title: "Wear Mask",
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          SymptomCard(
                            image: "assets/images/prev1.png",
                            title: "Don't sneeze in palm of hand",
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          SymptomCard(
                            image: "assets/images/prev2.png",
                            title: "Sneeze into forearm",
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          SymptomCard(
                            image: "assets/images/prev6.png",
                            title: "Stay Home",
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );



  // Container dropdownMenu() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 30.0),
  //     height: 40.0,
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(25.0),
  //       border: Border.all(
  //         color: Colors.black26,
  //       ),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Row(
  //         children: <Widget>[
  //           Container(
  //             padding: EdgeInsets.all(4.0),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(25.0),
  //               color: Colors.deepPurple[100],
  //             ),
  //             child: SvgPicture.asset(
  //               "assets/icons/maps-and-flags.svg",
  //               color: Colors.deepPurple,
  //               height: 20,
  //             ),
  //           ),
  //           SizedBox(
  //             width: 10.0,
  //           ),
  //           Expanded(
  //             child: DropdownButton(
  //               value: _dropdownValue,
  //               style: TextStyle(
  //                 fontSize: 18.0,
  //                 color: cPrimaryColor,
  //               ),
  //               isExpanded: true,
  //               underline: SizedBox(),
  //               icon: SvgPicture.asset(
  //                 "assets/icons/dropdown.svg",
  //                 height: 10,
  //                 color: Colors.deepPurple[200],
  //               ),
  //               items: ['Bangladesh', 'World']
  //                   .map<DropdownMenuItem<String>>((String newvalue) {
  //                 return DropdownMenuItem<String>(
  //                   value: newvalue,
  //                   child: Text(newvalue),
  //                 );
  //               }).toList(),
  //               onChanged: (value) {
  //                 setState(() {
  //                   _dropdownValue = value;
  //                 });
  //               },
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

}


  }

