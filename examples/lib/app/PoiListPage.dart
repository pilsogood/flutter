import "package:flutter/material.dart";
import 'package:examples/app/PoiDetailPage.dart';

class PoiListPage extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<PoiListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Poi List"),
      ),
      body: 
      new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          new Expanded(
            child: new ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, i) {
                return _poiCard(context, i);
              }
            )
           )
         ]
        )
      )
    );
  }
}

Color lineColor = const Color(0xD2D2E1ff);
Color mainColor = const Color(0xff3C3261);

class Db {
  final int seq;
  final String image;
  final String title;
  final String description;

  Db(this.seq, this.image, this.title, this.description);
}

Widget _poiCard(context, index) {

  String image = r"https://www.tripgrida.com/img/backgrounds/bg-cover-4.jpg";
  // String image = r"https://www.tripgrida.com/img/default_img/main/main-5.jpg";
  List<Db> dbs = List.generate(100,(i) => Db(i, image, 'title / $i', 'description $i'));

  return new GestureDetector(
    onTap: (){
      print("Container clicked ${dbs[index].image}");
      Navigator.push(context, MaterialPageRoute(builder: (context) => 
          new PoiDetailPage(
              getDb: dbs[index]
          )
        )
      );
    },
    child: new Container(
      child: new Column(
        children: <Widget>[
        new Row(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(0),
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: Colors.white,
                    image: new DecorationImage(
                      image: new NetworkImage(image),
                      fit: BoxFit.cover
                    ),
                    boxShadow: [
                      new BoxShadow(
                        color: const Color(0xff3C3261),
                        blurRadius: 10.0,
                        offset: new Offset(0.0, 5.0)
                      )
                    ]
                    )
                  ),
                )
              ),
              new Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(15.0,0.0,15.0,0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        dbs[index].title,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Arvo',
                          fontWeight: FontWeight.bold,
                          color: mainColor
                        )
                      ),
                      new Padding(
                        padding: EdgeInsets.all(5.0),
                        child: _titleLine()
                      ),
                      new Text(
                        dbs[index].description,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Arvo',
                          color: mainColor
                        )),
                    ],
                  )
                )
              ),
              new Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    new Icon(Icons.favorite_border)
                  ],
                )
              )
            ]
          ),
          // new Divider(
          //   color: const Color(0xD2D2E1ff),
          // ),
          new Container(
            width:300.0,
            height: 0.5,
            color: lineColor,
            margin: EdgeInsets.all(5.0),
          )
        ]
      )
    ),
  );
}

Widget _titleLine() {
  return new Container(
    width: 80.0,
    height: 0.8,
    color: lineColor,
    margin: EdgeInsets.all(2.0),
  );
}