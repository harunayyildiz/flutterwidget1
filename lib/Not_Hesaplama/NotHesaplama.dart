import 'package:flutter/material.dart';
class NotHesaplama extends StatefulWidget {
  @override
  _NotHesaplamaState createState() => _NotHesaplamaState();
}

class _NotHesaplamaState extends State<NotHesaplama> {
  String dersAdi;
  int dersKredi = 1;
  double dersHarfKredi = 4;
  List<Ders> tumDersler;
  double ortalama=0;
  static int sayac=0; //silme işlemi için
  //Formdan bir validation oluşturmak için FormKey tanımlamamız gerekiyor
  var formKey=GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    tumDersler=[];
    //initialize (ilk değerini atadık)
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //Klavye Çıkınca bir piksel hatası çıkıyor onu engellmeek için
      appBar: AppBar(
        title: Text("ORTALAMA HESAPLAMA"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(formKey.currentState.validate()){ //Eğer validate true ise kaydet
            formKey.currentState.save();
          }
        },
        child: Icon(Icons.add),
      ),
      body: bodyContent(),
    );
  }

  Widget bodyContent() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(10),
              child: formum(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: eklenenOgeler(),
            ),
          ),
        ],
      ),
    );
  }

  Widget formum() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "Ders Adı",
              hintText: "Ders Adını giriniz",
              border: OutlineInputBorder(),
            ),
            validator: (girilendeger) {
              if (girilendeger.length > 0) {
                return null;
                //herhangi validator hatası yoktur
              } else {
                return "Ders adını giriniz";
              }
            },
            onSaved: (kaydedilecekdeger) {
              dersAdi = kaydedilecekdeger; //DERS ADINI TUTUYORUZ
              //Yeni Bir ders Eklenince Classımıza o ders nesne olarak ekleniyor
              setState(() {
                tumDersler.add(Ders(dersAdi, dersHarfKredi, dersKredi));
                //her ders eklendiğinde ortalama sıfırlanması lazım
                ortalama=0;
                ortHesapla();
              });
              //değişikliğin algılanması için
              //Classımıza ekleniyor nesne olarak o da liste içinde
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin:EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                decoration:BoxDecoration(
                  border: Border.all(color: Colors.pink,width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
                //Dropdownun Defaultunda altı çizgilidir
                //Bu widgetla sarmalarsak çizgi ortadan kalkar
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    items: dersKredileriItems(),
                    value: dersKredi,
                    onChanged: (secilenKredi) {
                      setState(() {
                        dersKredi = secilenKredi; //DERSİN KREDİSİNİ TUTUYORUZ
                      });
                    },
                  ),
                ),
              ),
              Container(
                margin:EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(horizontal: 8,vertical:4),
                decoration:BoxDecoration(
                  border: Border.all(color: Colors.pink,width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<double>(
                    //türü ve value aynı olması gerek
                    items: dersHarfItems(),
                    value: dersHarfKredi,
                    onChanged: (secilenharf) {
                      setState(() {
                        dersHarfKredi = secilenharf;
                        debugPrint(dersHarfKredi.toString());
                        //SEÇİLEN HARFİN KREDİSİNİ TUTUYORUZ EKRANDA GÖSTERİLEN İSE items'ların valuesi
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
//            decoration: BoxDecoration(
//              border: BorderDirectional(
//                top:BorderSide(color:Colors.blue.shade100,width: 1),
//                bottom:BorderSide(color:Colors.blue.shade100,width: 1),
//              ),
//            ),
            width: double.infinity,
            child: Center(child: ortalamaYazi(),),
            //Text("Ortalama : $ortalama",style: TextStyle(fontSize: 20),)),
          ),
        ],
      ),
    );
  }


  List<DropdownMenuItem<int>> dersKredileriItems() {
    //Bu metod için tanımlı geçici liste tanımladık
    List<DropdownMenuItem<int>> krediler = [];
    for (int i = 1; i <= 10; i++) {
      krediler.add(
        DropdownMenuItem<int>(
          value: i,
          child: Text("$i Kredi"),
        ),
      );
    }
    return krediler;
  }

  Widget ortalamaYazi(){
    return RichText(
      textAlign: TextAlign.center,
      text:TextSpan(
          children: [
            TextSpan(text:"Ortalama : ",style: TextStyle(color: Colors.black,fontSize:17 ),),
            TextSpan(text: tumDersler.length==0 ? "":"${ortalama.toStringAsFixed(2)}",style: TextStyle(color: Colors.black,fontSize: 18),),
          ]
      ),
    );
  }

  List<DropdownMenuItem<double>> dersHarfItems() {
    List<DropdownMenuItem<double>> harfler = [];
    harfler.add(DropdownMenuItem<double>(child: Text("AA", style: TextStyle(fontSize: 20),), value: 4,));
    harfler.add(DropdownMenuItem<double>(child: Text("BA", style: TextStyle(fontSize: 20),), value: 3.5,));
    harfler.add(DropdownMenuItem<double>(child: Text("BB", style: TextStyle(fontSize: 20),), value: 3,));
    harfler.add(DropdownMenuItem<double>(child: Text("BC", style: TextStyle(fontSize: 20),), value: 2.5,));
    harfler.add(DropdownMenuItem<double>(child: Text("CC", style: TextStyle(fontSize: 20),), value: 2,));
    harfler.add(DropdownMenuItem<double>(child: Text("DC", style: TextStyle(fontSize: 20),), value: 1.5,));
    harfler.add(DropdownMenuItem<double>(child: Text("DD", style: TextStyle(fontSize: 20),), value: 1,));
    harfler.add(DropdownMenuItem<double>(child: Text("FF", style: TextStyle(fontSize: 20),), value: 0,));
    return harfler;
  }

  Widget eklenenOgeler() {
    return ListView.builder(itemBuilder: _listeElemanlari,itemCount: tumDersler.length,);
  }

  Widget  _listeElemanlari(BuildContext context,int index) {
    //Her öğe ekrana çalıştırılırken yazdırılıyor
    sayac++;
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(color:Color.fromARGB(100, 10*sayac,10, 10),),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Card(
        //Kaydırınca silme işlemini yapıcaz
        //Her kaydırma elemanınıa bir key vermemiz gerekiyor
        //sayac tanımladık çünkü keylerin sürekli farklı olması için
        child: Dismissible(
          key: Key(sayac.toString()),
          direction:DismissDirection.startToEnd, //silme tarafı
          onDismissed: (direction){ //silinen değere ne olsun
            setState(() {
              tumDersler.removeAt(index);
              ortHesapla();
            });
          },
          child: ListTile(
            leading: Icon(Icons.done,size: 34,color:Color.fromARGB(200, 10*sayac,10, 10),),
            trailing: Icon(Icons.chevron_right,size: 34,color:Color.fromARGB(200, 10*sayac,10, 10),),
            title: Text(tumDersler[index].ad,style: TextStyle(fontSize: 18),),
            subtitle: Text(tumDersler[index].kredi.toString()+":Kredi   "+"Harf Değeri: "+ tumDersler[index].harfDegeri.toString(),style: TextStyle(fontSize: 15),),
          ),
        ),
      ),
    );
  }

  void ortHesapla() {
    double toplamNot=0;
    double toplamKredi=0;
    for(var oankiders in tumDersler){
      var kredi=oankiders.kredi;
      var harfDegeri=oankiders.harfDegeri;
      toplamNot=toplamNot+(harfDegeri*kredi);
      toplamKredi=toplamKredi+kredi;
    }
    ortalama=toplamNot/toplamKredi;
  }
}

class Ders{
  String ad;
  double harfDegeri;
  int kredi;
  Ders(this.ad,this.harfDegeri,this.kredi);
}
