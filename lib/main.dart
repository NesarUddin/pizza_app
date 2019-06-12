import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza Order',
      home: PizzaHome(),
      theme: ThemeData(primarySwatch: Colors.blueGrey, fontFamily: "slabo"),
    );
  }
}

class PizzaHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff000000));
    return Scaffold(
      body: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 50,right: 30),
      child: ListView(
        children: <Widget>[
          titleBar()
        ],
      ),
    );
  }
}

Widget titleBar(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      SizedBox(
        height: 70.0,
      ),
      Text(
        "Featured",
        style: TextStyle(fontWeight: FontWeight.w900,fontSize: 50),
      ),
      Text(
        "Food",
        style: TextStyle(fontWeight: FontWeight.w900,fontSize: 50),
      )
    ],
  );
}

