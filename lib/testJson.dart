import 'dart:convert';
import 'dart:io';
import 'package:calendar/utils/calendarDataUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/dataModel.dart';

class TestJson extends StatefulWidget {
  @override
  _TestJsonState createState() => _TestJsonState();
}

class _TestJsonState extends State<TestJson> {

  String ct = "ds";
  CalendarData calendarData = CalendarData();

  _onDone(){
    print("oke");

    setState(() {
      ct = calendarData.months[0].month.toString();
    });
  }


  @override
  void initState() {
      super.initState();
      print("initState");
      calendarData.streamController.done.then((value)=>{
        print("hahahahaha"+value.toString()),
        _onDone()
      });
  }

  @override
  Widget build(BuildContext context) {
    // String rawJson = '{"name":"Mary","age":30}';
    // WidgetsFlutterBinding.ensureInitialized();
    // Map<String, dynamic> map = jsonDecode(rawJson); // import 'dart:convert';
    //
    // String name = map['name'];
    // int age = map['age'];
    // print("Name: $name, age $age");
    //loadAsset();
    print("build-----");

    // calendarData.streamController.stream.listen((event) {
    //   print("hello" + event.toString());
    //   _onDone();
    // });
    return Scaffold(body: Container(color: Colors.deepPurple,
    child: Center(
      child: RaisedButton(
        child: Text(ct),
        onPressed: (){
       //   print(calendarData.months[0].month);
        //  print(ct);
          // print("Name: $name, age $age");
          // new File('assets/jsondata/data.json').readAsString().then((String contents) {
          //   print(contents);
          // }).catchError((){
          //   print("error");
          // });
        },
      ),
    ),));
  }
}
