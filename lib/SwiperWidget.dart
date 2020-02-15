import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwipperWidget extends StatefulWidget {
  @override
  _SwipperWidgetState createState() => _SwipperWidgetState();
}

class _SwipperWidgetState extends State<SwipperWidget> {
  List<String> imagesList = [
    "https://images.pexels.com/photos/1793525/pexels-photo-1793525.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/415206/pexels-photo-415206.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/1670187/pexels-photo-1670187.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
  ];

  //Aşağı dogru gitmesini istersek
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    imagesList[index],
                    fit: BoxFit.cover,
                  );
                },
                autoplay: true,
                itemCount: imagesList.length,
                scrollDirection: Axis.vertical,
                pagination: new SwiperPagination(
                    alignment: Alignment.centerRight,
                    builder: SwiperPagination.fraction),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
