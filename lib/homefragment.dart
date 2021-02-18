import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:calendar/activityDayDetail.dart';
import 'package:calendar/models/dataModel.dart';
import 'package:calendar/utils/calendarDataUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  DateTime selectedDate = DateTime.now();
  CalendarData calendarData = CalendarData();

  // data
  int lunarDay;
  String weekDay;
  String monthString;
  String lunarDetail1;
  String lunarDetail2;
  String currentTime;
  List<String> lunarDetails;
  List<dynamic> idioms;
  int randomIdiom;

  _onLoadDataDone() {
    // int currentDay = DateTime.now().day;
    // int currentMonth = DateTime.now().month;
    idioms = calendarData.idioms;
    Random random = new Random();
    randomIdiom = random.nextInt(idioms.length);
    Date currentDate =
        calendarData.months[selectedDate.month - 1].dates[selectedDate.day - 1];
    setState(() {
      lunarDetails = currentDate.lunarDetail;
      DateTime lunar = DateFormat("dd/MM/yyyy").parse(currentDate.lunarDate);
      lunarDay = lunar.day;
      lunarDetail1 = currentDate.lunarDetail1;
      lunarDetail2 = currentDate.lunarDetail2;
      weekDay = getStringWeekDay(selectedDate.weekday);
      monthString = getStringMonth(lunar.month);
    });
  }

  @override
  void initState() {
    super.initState();
    currentTime = DateFormat("hh:mm").format(selectedDate);
    int x =  selectedDate.hour;
    Timer.periodic(Duration(minutes: 1), (timer){
      setState(() {
        currentTime = DateFormat("hh:mm").format(DateTime.now());
      });
    });

    calendarData.streamController.done.then((value) => {_onLoadDataDone()});
  }

  String getStringWeekDay(int weekDay) {
    switch (weekDay) {
      case 1:
        return "THỨ HAI";
      case 2:
        return "THỨ BA";
      case 3:
        return "THỨ BỐN";
      case 4:
        return "THỨ NĂM";
      case 5:
        return "THỨ SÁU";
      case 6:
        return "THỨ BẢY";
      case 7:
        return "CHỦ NHẬT";
      default:
        return "";
    }
  }

  String getStringMonth(int month){
    switch(month){
      case 1: return "  THÁNG MỘT";
      case 2: return "  THÁNG HAI";
      case 3: return "  THÁNG BA";
      case 4: return "  THÁNG BỐN";
      case 5: return "  THÁNG NĂM";
      case 6: return "  THÁNG SÁU";
      case 7: return "  THÁNG BẢY";
      case 8: return "  THÁNG TÁM";
      case 9: return "  THÁNG CHÍN";
      case 10: return "  THÁNG MƯỜI";
      case 11: return "  THÁNG M.MỘT";
      case 12: return "  THÁNG M.HAI";
      default: return "";
    }
  }

  String getStringHour(int hour){
    if(hour==23||hour==0) return "Giờ Tý";
    if(hour==1||hour==2) return "Giờ Sửu";
    if(hour==3||hour==4) return "Giờ Dần";
    if(hour==5||hour==6) return "Giờ Mão";
    if(hour==7||hour==8) return "Giờ Thìn";
    if(hour==9||hour==10) return "Giờ Tỵ";
    if(hour==11||hour==12) return "Giờ Ngọ";
    if(hour==13||hour==14) return "Giờ Mùi";
    if(hour==15||hour==16) return "Giờ Thân";
    if(hour==17||hour==18) return "Giờ Dậu";
    if(hour==19||hour==20) return "Giờ Tuất";
    if(hour==21||hour==22) return "Giờ Hợi";
  }

  _buildCalenderPicker(BuildContext context) async {
    await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2020),
            lastDate: DateTime(2022))
        .then((value) {
      if (value != null && value != selectedDate) {
        // setState(() {
          selectedDate = value;
          _onLoadDataDone();
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 6, bottom: 8),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.6, 0.9],
                  colors: [Colors.white, Colors.lightBlue[100], Colors.white])),
          child: Column(
            children: [
              Center(
                child: ButtonTheme(
                  height: 28,
                  child: RaisedButton(
                      elevation: 5,
                      padding:
                          EdgeInsets.only(left: 8, right: 2, top: 0, bottom: 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Theme.of(context).primaryColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(DateFormat("dd/MM/yyyy").format(selectedDate),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                      onPressed: () => _buildCalenderPicker(context)),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(selectedDate.day.toString(),
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  offset: Offset(6.0, 4.0),
                                  blurRadius: 8.0,
                                  color: Color.fromARGB(190, 180, 180, 180),
                                ),
                              ],
                              fontSize: 180,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(bottom: 24),
                      width: 300,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            idioms==null?"":"   "+idioms[randomIdiom]["value"],
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: Colors.purple),
                          ),
                          Container(
                            padding: EdgeInsets.all(6),
                            alignment: Alignment.bottomRight,
                            child: Text(
                              idioms==null?"":idioms[randomIdiom]["author"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                // color: Colors.teal,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(" TÀI LỘC ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            height: 4,
                            thickness: 3,
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                    )),
                    Expanded(
                        child: Container(
                      // margin: EdgeInsets.symmetric(horizontal: 6),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Text(weekDay==null?"":weekDay,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ), onPressed: () {  },
                      ),
                    )),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "GIỜ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            height: 4,
                            thickness: 3,
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                height: 110,
                // color: Colors.amberAccent,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(left: 15,top: 8),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: lunarDetails==null?0:lunarDetails.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text(
                              lunarDetails[index][0].toUpperCase() +lunarDetails[index].substring(1),
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }),
                    )),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstOut),
                            image: AssetImage("assets/image/pic1.png"),
                            fit: BoxFit.scaleDown,
                          )
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          lunarDay==null?"":lunarDay.toString(),
                          style: TextStyle(
                              fontSize: 74,
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(top: 18, bottom: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(currentTime==null?"":currentTime,
                            style: TextStyle(
                                fontSize: 28,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            getStringHour(selectedDate.hour),
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                height: 80,
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only( bottom: 10, left: 20, right: 20),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ActivityDayDetail(selectedDate: selectedDate)),
                                  );
                                },
                                child: Text(
                                  "Chi tiết",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(monthString==null?"":monthString,
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(lunarDetail1 == null?"":lunarDetail1,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(lunarDetail2 == null?"":lunarDetail2,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
