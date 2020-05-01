import 'package:covid/screen/home.dart';
import 'package:covid/screen/prevention.dart';
import 'package:covid/screen/record.dart';
import 'package:covid/screen/symptom.dart';
import 'package:covid/screen/info.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes() {
    return {
      '/' : (context) => MainHome(),
      'record': (context) => Records(),
      'symtomps': (context) => Symptomps(),
      'prevention' : (context) => Prevention(),
      'info': (context) => AboutInfo(),
    };
  }