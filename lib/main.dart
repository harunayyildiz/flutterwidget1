import 'package:flutter/material.dart';
//import 'package:flutterwidget1/Cark.dart';
//import 'LinearGradient.dart';
import 'SwiperWidget.dart';
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
