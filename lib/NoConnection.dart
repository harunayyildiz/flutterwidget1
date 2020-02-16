import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Noconnection extends StatefulWidget {
  @override
  _NoconnectionState createState() => _NoconnectionState();
}

class _NoconnectionState extends State<Noconnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFC8C8C8), Color(0xFF646464)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AlertDialog(
                contentPadding: EdgeInsets.only(right: 50,left: 50,top: 20,bottom: 20),
                title: Icon(Icons.network_check),
                backgroundColor: Colors.white70,
                content: Column(
                  children: <Widget>[
                    Text(
                      "LÜTFEN İNTERNET BAĞLANTINIZI\n KONTROL EDİNİZ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15),),
                    Container( width:15,height: 15,child: CircularProgressIndicator(backgroundColor: Colors.white70,strokeWidth: 1,)),
                    Padding(padding: EdgeInsets.only(top: 15),),
                    Text("SUNUCUYA BAĞLANILAMIYOR...", textAlign: TextAlign.center, style: TextStyle(fontSize: 14,),),
                   // Padding(padding: EdgeInsets.only(top: 5),),
                  ],
                ),
                actions: <Widget>[
                  Center(
                    child: FlatButton(
                      child: Text(
                        "ÇIKIŞ",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Platform.isIOS ? exit(0) : SystemNavigator.pop();
                        //Çıkış kodları Önerilen biçimde dart:io import etmeyi unutma!
                      },
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
