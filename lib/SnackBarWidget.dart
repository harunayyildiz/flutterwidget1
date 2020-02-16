import 'package:flutter/material.dart';
class SnanckBarWidget extends StatefulWidget {
  @override
  _SnanckBarWidgetState createState() => _SnanckBarWidgetState();
}

class _SnanckBarWidgetState extends State<SnanckBarWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body:Center(
        child: OutlineButton(
          highlightedBorderColor: Colors.black,
          //kenar çizgi rengi
          padding: EdgeInsets.only(right:30,left: 30,top: 10,bottom: 10),
          textColor: Colors.black,
          splashColor: Colors.white,
          onPressed: () {
           _scaffoldKey.currentState.showSnackBar(
               SnackBar(
             content: Row(
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(right: 20,left: 5),
                   child: Icon(Icons.sentiment_very_satisfied),
                 ),
                 Text("SnackBar!",style: TextStyle(fontSize: 20),),
               ],
             ),
             backgroundColor: Colors.black,
             duration: Duration(seconds: 1),
           ),);
          },
          child: Text(
            "Giriş",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }

}
