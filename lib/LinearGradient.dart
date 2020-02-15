import 'package:flutter/material.dart';

class Gradientt extends StatefulWidget {
  @override
  _GradienttState createState() => _GradienttState();
}

class _GradienttState extends State<Gradientt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.red,
                  Colors.blueAccent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
