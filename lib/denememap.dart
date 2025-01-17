//import 'package:location/location.dart';
//import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  List<Marker> allMarkers = [];
//  GoogleMapController _controller;
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    allMarkers.add(Marker(
//        markerId: MarkerId('myMarker'),
//        draggable: true,
//        onTap: () {
//          print('Marker Tapped');
//        },
//        position: LatLng(39.7702694,30.577631)));
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Maps'),
//      ),
//      body: Stack(
//          children: [Container(
//            height: MediaQuery.of(context).size.height,
//            width: MediaQuery.of(context).size.width,
//            child: GoogleMap(
//              initialCameraPosition:
//              CameraPosition(target: LatLng(39.7703354,30.4776494), zoom: 20.0),
//              markers: Set.from(allMarkers),
//              onMapCreated: mapCreated,
//            ),
//          ),
//            Align(
//              alignment: Alignment.bottomCenter,
//              child: InkWell(
//                onTap: movetoBoston,
//                child: Container(
//                  height: 40.0,
//                  width: 40.0,
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(20.0),
//                      color: Colors.green
//                  ),
//                  child: Icon(Icons.forward, color: Colors.white),
//                ),
//              ),
//            ),
//            Align(
//              alignment: Alignment.bottomRight,
//              child: InkWell(
//                onTap: movetoNewYork,
//                child: Container(
//                  height: 40.0,
//                  width: 40.0,
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(20.0),
//                      color: Colors.red
//                  ),
//                  child: Icon(Icons.backspace, color: Colors.white),
//                ),
//              ),
//            )
//          ]
//      ),
//    );
//  }
//
//  void mapCreated(controller) {
//    setState(() {
//      _controller = controller;
//    });
//  }
//
//  movetoBoston() {
//    _controller.animateCamera(CameraUpdate.newCameraPosition(
//      CameraPosition(target: LatLng(39.7703354,30.4776494), zoom: 20.0, bearing: 45.0, tilt: 45.0),
//    ));
//  }
//
//  movetoNewYork() {
//    _controller.animateCamera(CameraUpdate.newCameraPosition(
//      CameraPosition(target: LatLng(39.7703354,30.4776494), zoom: 16.0),
//    ));
//  }
//}