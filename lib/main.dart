import 'package:flutter/material.dart';
import 'package:flutterwidget1/NoConnection.dart';

import 'Cark.dart';
import 'LinearGradient.dart';
import 'Not_Hesaplama/NotHesaplama.dart';
import 'SnackBarWidget.dart';
import 'SwiperWidget.dart';
import 'denememap.dart';
//import 'package:flutterwidget1/Not_Hesaplama/NotHesaplama.dart';import 'SwiperWidget.dart';
//import 'package:flutterwidget1/Cark.dart';
//import 'LinearGradient.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SwipperWidget(),
    );
  }
}
