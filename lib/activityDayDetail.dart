import 'package:calendar/utils/calendarDataUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityDayDetail extends StatefulWidget {
  final DateTime selectedDate;
  ActivityDayDetail({this.selectedDate});

  @override
  _ActivityDayDetailState createState() => _ActivityDayDetailState(selectedDate: selectedDate);
}

class _ActivityDayDetailState extends State<ActivityDayDetail> {

  DateTime selectedDate;
  _ActivityDayDetailState({this.selectedDate});

  CalendarData calendarData = CalendarData();
  List<dynamic> details;
  int itemCount1 = 2;
  int itemCount2 = 2;

  _buildCalenderPicker(BuildContext context) async {
    await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2022))
        .then((value) {
      if (value != null && value != selectedDate) {
        setState(() {
          selectedDate = value;
          int month = selectedDate.month;
          int day = selectedDate.day;
          details = calendarData.months[month - 1].dates[day - 1].details;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    int month = selectedDate.month;
    int day = selectedDate.day;
    details = calendarData.months[month - 1].dates[day - 1].details;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.6, 0.9],
              colors: [Colors.white, Colors.lightBlue[100], Colors.white],
            )),
            child: Column(
              children: [
              Container(
                child: RaisedButton(
                    elevation: 5,
                    padding:
                    EdgeInsets.only(left: 10, right: 3, top: 0, bottom: 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Theme.of(context).primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Chi tiết ngày " + DateFormat("dd/MM/yyyy").format(selectedDate),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        )
                      ],
                    ),
                    onPressed: () => _buildCalenderPicker(context))
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 7),
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        details[0]['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 20),
                      ),
                      Divider(
                        height: 16,
                        thickness: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: itemCount1,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(details[0]['value'][index]['name'].toString().replaceFirst(":", ""),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: FontWeight.bold),),
                                    width: 78,
                                    margin: EdgeInsets.only(right: 6),
                                  ),
                                  Flexible(
                                      child: Text(
                                          details[0]['value'][index]['value'],
                                      textAlign: TextAlign.justify,
                                      style: TextStyle( ),)
                                  )
                                ],
                              ),
                            );
                          }),
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          color: Theme.of(context).primaryColor,
                          onPressed: (){
                            setState(() {
                              itemCount1==2?itemCount1 = 12:itemCount1 = 2;
                            });
                          },
                          child: Text(itemCount1==12?"Thu hẹp":"Mở rộng",
                            style: TextStyle(color: Colors.white),)
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 7),
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        details[1]['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 20),
                      ),
                      Divider(
                        height: 16,
                        thickness: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(details[1]['value'][index]['name'].toString().replaceFirst(":", ""),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontWeight: FontWeight.bold),),
                                    width: 78,
                                    margin: EdgeInsets.only(right: 6),
                                  ),
                                  Flexible(
                                      child: Text(
                                        details[0]['value'][index]['value'],
                                        textAlign: TextAlign.justify,
                                        style: TextStyle( ),)
                                  )
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 7),
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        details[2]['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 20),
                      ),
                      Divider(
                        height: 16,
                        thickness: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                          details[2]['value']
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 7),
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        details[3]['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 20),
                      ),
                      Divider(
                        height: 16,
                        thickness: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(details[3]['value'][index]['name'].toString().replaceFirst(":", ""),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontWeight: FontWeight.bold),),
                                    width: 78,
                                    margin: EdgeInsets.only(right: 6),
                                  ),
                                  Flexible(
                                      child: Text(
                                        details[0]['value'][index]['value'],
                                        textAlign: TextAlign.justify,
                                        style: TextStyle( ),)
                                  )
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 7),
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        details[4]['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 20),
                      ),
                      Divider(
                        height: 16,
                        thickness: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                      Table(
                        border: TableBorder.symmetric(inside: BorderSide(width: 1)),
                        children: [
                          TableRow(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                child: Text(details[4]['value'][0]['name'].toString().replaceFirst(":", ""),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),),
                                width: 65,
                                margin: EdgeInsets.only(right: 6),
                              ),
                              Container(
                                padding: EdgeInsets.all(6),
                                child: Text(details[4]['value'][1]['name'].toString().replaceFirst(":", ""),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),),
                                width: 65,
                                margin: EdgeInsets.only(right: 6),
                              ),
                            ]
                          ),
                          TableRow(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                child: Text(
                                  details[0]['value'][0]['value'],
                                  textAlign: TextAlign.justify,
                                  style: TextStyle( )
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(6),
                                child: Text(
                                    details[0]['value'][0]['value'],
                                    textAlign: TextAlign.justify,
                                    style: TextStyle( )
                                ),
                              )
                            ]
                          )
                        ],
                      )
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   textDirection: TextDirection.ltr,
                      //   children: [
                      //     Container(
                      //       child: Text(details[4]['value'][index]['name'].toString().replaceFirst(":", ""),
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(fontWeight: FontWeight.bold),),
                      //       width: 65,
                      //       margin: EdgeInsets.only(right: 6),
                      //     ),
                      //     Flexible(
                      //         child: Text(
                      //           details[0]['value'][index]['value'],
                      //           textAlign: TextAlign.justify,
                      //           style: TextStyle( ),)
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 7),
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        details[5]['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 20),
                      ),
                      Divider(
                        height: 16,
                        thickness: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                      Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        border: TableBorder.all(),
                        columnWidths: {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(2)
                        },
                        children: [
                          TableRow(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: Text("Ngày xuất hành:",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  details[5]['value']['Ngày xuất hành:'],
                                  textAlign: TextAlign.justify,
                                  style: TextStyle( ),),
                              )
                            ]
                          ),
                          TableRow(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: Text("Hướng xuất hành:",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  details[5]['value']['Hướng xuất hành:'],
                                  textAlign: TextAlign.justify,
                                  style: TextStyle( ),),
                              )
                            ]
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 40,
                        child: Text("Giờ xuất hành:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                        )
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: itemCount2,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(details[5]['value']["Giờ xuất hành:"][index]['name'].toString().replaceFirst(":", ""),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.bold),),
                                      width: 78,
                                      margin: EdgeInsets.only(right: 6),
                                    ),
                                    Flexible(
                                        child: Text(
                                          details[5]['value']["Giờ xuất hành:"][index]['value'],
                                          textAlign: TextAlign.justify,
                                          style: TextStyle( ),)
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: (){
                          setState(() {
                            itemCount2==2?itemCount2 = 12:itemCount2 = 2;
                          });
                        },
                        child: Text(itemCount2==12?"Thu hẹp":"Mở rộng",
                        style: TextStyle(color: Colors.white),)
                      )
                    ],
                  ),
                ),
              ),
              ],
            )),
        ),
      ),
    );
  }

}
