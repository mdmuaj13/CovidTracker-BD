import 'package:covid/data/http_service.dart';
import 'package:covid/model/covid.dart';
import 'package:flutter/material.dart';

class Records extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/bg.png",
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: FutureBuilder(
                  future: httpService.getCovidData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<Countrydatum> snapshot) {
                    if (snapshot.hasData) {
                      Countrydatum c = snapshot.data;
                      return Column(
                        children: <Widget>[
                          Text("Total case " + c.totalCases.toString()),
                          Text("Total death : " + c.totalDeaths.toString()),
                        ],
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              Container( 
                height: MediaQuery.of(context).size.height - 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
