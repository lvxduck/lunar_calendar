import 'dart:math';

import 'package:calendar/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'homefragment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  List<Color> colors =[
    Color(0xff0068B1),
    Color(0xff008FC9),
    Color(0xff007C74),
    Color(0xffA94815),
    Color(0xffDBA11C),
    Color(0xffC00507),
  ];

  Color randomColor(){
    Random random = Random();
    return colors[random.nextInt(colors.length)];
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Color mainColor = randomColor();
    // Color mainColor = colors[4];

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: mainColor,
        ),
        home: HomeFragment());
  }
}


// class InfinityListView extends StatefulWidget {
//   @override
//   _InfinityListViewState createState() => _InfinityListViewState();
// }
//
// class _InfinityListViewState extends State<InfinityListView> {
//
//   ScrollController _scrollController = ScrollController() ;
//   int size = 12;
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
//         _getMoreData();
//       }
//     });
//   }
//
//   void _getMoreData() async{
//     await Future.delayed(Duration(seconds: 1),(){
//       print("get More Data");
//     });
//     print("OKE");
//     setState(() {
//       size+=5;
//     });
//   }
//
//   void delayIncrease (){
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//       body: Container(
//         child: Swiper(
//           autoplay: true,
//           itemCount: 4,
//           itemBuilder: (context,index){
//           return Text("hhaahah $index");
//         }),
//         // child: ListView.builder(
//         //   scrollDirection: Axis.horizontal,
//         //   controller: _scrollController,
//         //   itemCount: size+1,
//         //   itemBuilder: (context,index){
//         //     if(index==size){
//         //       return Container(
//         //         alignment: Alignment.center,
//         //         height: 100,
//         //         width: 200,
//         //         child: CircularProgressIndicator(
//         //           valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//         //         ),
//         //       );
//         //     }
//         //   return Container(
//         //     width: 100,
//         //     alignment: Alignment.center,
//         //     margin: EdgeInsets.all(8),
//         //     color: Colors.blue,
//         //     child: Text("HELLO $index", style: TextStyle(
//         //     ),),
//         //   );
//         // }),
//       ),
//     ));
//   }
// }
