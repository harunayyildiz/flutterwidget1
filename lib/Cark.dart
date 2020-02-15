import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
  class CarkPage extends StatefulWidget {
  @override
  _CarkPageState createState() => _CarkPageState();
}
class _CarkPageState extends State<CarkPage> {
  int sayac=0; //verilen hak için tanımladım (StfulWidgetClass tanımladım)
  final StreamController _dividerController = StreamController<int>();
  final _wheelNotifier = StreamController<double>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffDDC3FF), elevation: 0.0),
      backgroundColor: Color(0xffDDC3FF),
      body:sayac<=5 ? Center(  //Hak=5 Tanımlandı
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: SpinningWheel(
                Image.network("https://i.imgyukle.com/2020/02/16/nNiJEy.png"),
                width: 310,
                height: 310,
                initialSpinAngle: _generateRandomAngle(),
                spinResistance: 0.6,
                canInteractWhileSpinning: false,
                dividers: 8,
                onUpdate: _dividerController.add,
                onEnd: _dividerController.add,
                secondaryImage:
                Image.network("https://i.imgyukle.com/2020/01/21/V8zv8S.png"),
                secondaryImageHeight: 110,
                secondaryImageWidth: 110,
                shouldStartOrStop: _wheelNotifier.stream,
              ),
// Diğer Dokunulma durumları için bu Fonksiyonlar kullanılabilir
//              onTap: (){
//                _wheelNotifier.sink.add(_generateRandomVelocity());
//              },
//              onLongPress: (){
//                _wheelNotifier.sink.add(_generateRandomVelocity());
//              },
//             onTapDown: (TapDownDetails details){
//
//             },
              onHorizontalDragStart: (DragStartDetails details){
                _wheelNotifier.sink.add(_generateRandomVelocity());
                setState(() {
                  sayac=sayac+1;
                });
              },
              onVerticalDragStart: (DragStartDetails details){
                _wheelNotifier.sink.add(_generateRandomVelocity());
                setState(() {
                  sayac=sayac+1;
                });
                debugPrint(sayac.toString());
              },
            ),
            SizedBox(height: 30),
            sayac>0 ?
            StreamBuilder( //ilk durumda ekranda bişey yazmaması için..
              stream: _dividerController.stream,
              builder: (context, snapshot) =>
              snapshot.hasData ? RouletteScore(snapshot.data) : Container(),
            ): Text("ÇEVİR",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 30),
          ],
        ),
      ): Center(child:Text("Hakkınız Bitmiştir.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
    );
  }
  @override
  void dispose() {
    _dividerController.close();
    _wheelNotifier.close();
    super.dispose();
  }
  double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;
  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}

class RouletteScore extends StatelessWidget {
  final int selected;
  final Map<int, String> labels = {
    1: '1000 PUAN KAZANDINIZ',
    2: '400 PUAN KAZANDINIZ',
    3: '800 PUAN KAZANDINIZ',
    4: '7000 PUAN KAZANDINIZ',
    5: '5000 PUAN KAZANDINIZ',
    6: '300 PUAN KAZANDINIZ',
    7: '2000 PUAN KAZANDINIZ',
    8: '100 PUAN KAZANDINIZ',
  };

  RouletteScore(this.selected);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('${labels[selected]}',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0)),
      ],
    );
  }
}