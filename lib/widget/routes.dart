  import 'package:covid/screen/home.dart';
import 'package:covid/screen/record.dart';
import 'package:covid/screen/symptom.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes() {
    return {
      '/' : (context) => MainHome(),
      'record': (context) => Records(),
      'symtomps': (context) => Symptomps(),
    };
  }