import 'package:covid/widget/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19',
      theme: ThemeData( 
        // textTheme: TextTheme(body1: TextStyle(fontFamily: "Poppins")),
        // fontFamily: "Poppins",
        primarySwatch: Colors.blue,
      ), 
      initialRoute: '/',
      routes: routes(),
    );
  }


} 