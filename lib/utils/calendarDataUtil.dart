
import 'dart:async';
import 'dart:convert';

import 'package:calendar/models/dataModel.dart';
import 'package:flutter/services.dart';

class CalendarData{

  List<Month> months;
  List<dynamic> idioms;

  StreamController streamController;

  void _loadAsset() async {
    await rootBundle.loadString('assets/jsondata/data.json').then((String contents) {
      Map jsonResult = json.decode(contents);
      Data data = Data.fromJson(jsonResult);
      this.months = data.months;
      this.idioms = jsonResult['idiom'];
      // streamController.sink.
      streamController.close();
      return;
    });
  }

  CalendarData._calendarData(){
     streamController = new StreamController<int>.broadcast();
     _loadAsset();
     print("hello");
  }

  static final CalendarData _instance = CalendarData._calendarData();

  factory CalendarData(){
    return _instance;
  }

}