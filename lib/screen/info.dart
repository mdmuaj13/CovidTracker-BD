import 'package:covid/constants.dart';
import 'package:flutter/material.dart';

class AboutInfo extends StatelessWidget {
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
                    height: 100.0,
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
                                'About',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              Icon(Icons.clear_all)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: <Widget>[],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 118.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Center(child: Text('Application')),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('This is application is basic covid-19 tracker for Bangladesh region. \n\n' +
                              'Data collected from Johns Hopkin University. Bengali localization about to integrate.\n'),
                          Divider(
                            height: 20.0,
                          ),
                          Center(child: Text('Developer')),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Md. Mohaiminul Hasan",
                            style: cPositiveReportData.copyWith(
                                color: cGrandientColor1),
                          ),
                          Text("Web Developer & Flutter Developer",
                              style: TextStyle(
                                  fontSize: 16.0, color: cGrandientColor2)),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                              ),
                              Icon(Icons.mail_outline),
                              Text(
                                'iammuaj@gmail.com',
                                style: TextStyle(color: cGrandientColor1),
                              ),
                            ],
                          ),
                        ],
                      ),
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
}
