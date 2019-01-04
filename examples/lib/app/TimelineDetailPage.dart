
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";

import "package:flutter_map/flutter_map.dart";
import 'package:latlong/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:ui';
import 'dart:io';

import 'package:examples/app/TimelinePage.dart';

Color gradientStart = Color.fromRGBO(130, 84, 234 , 1); 
Color gradientMiddle = Color.fromRGBO(207, 139, 243 , 1); 
Color gradientEnd = Color.fromRGBO(215, 10, 215 , 1); 
Color mainColor = Color.fromRGBO(130, 84, 234, 1);
Color shadowColor = Color.fromRGBO(47, 92, 182, 0.2);
Color greyDarkColor = Color.fromRGBO(106, 106, 106, 1);
Color greyColor = Color.fromRGBO(230, 236, 240, 1);
Color backgrounGreyColor = Color.fromRGBO(245, 245, 245, 1);
Color lineColor = const Color(0xD2D2E1ff);


class TimelineDetailPage extends StatefulWidget {

  final Db getDb;
  TimelineDetailPage({Key key, @required this.getDb}) : super(key: key);

  @override
  _AppStatus createState() => _AppStatus();
}

Db data = null;
double width = 400;

class _AppStatus extends State<TimelineDetailPage> {

  final double barHeight = 300.0; 

  final controller = ScrollController();
  double cWidth = 0.0;
  double itemHeight = 28.0;
  double itemsCount = 20;
  double screenWidth;
  
  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
    print(widget.getDb.title);
    print(widget.getDb.image);
  }

  onScroll() {
    setState(() {
     cWidth = controller.offset * screenWidth / (itemHeight * itemsCount);
    });
  }

  @override
  void dispose() {
    controller.removeListener(onScroll);
  }

  @override
  Widget build(BuildContext context) {

    data = widget.getDb;
    // width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: new Text("${data.title}"),
      ),
      body: new SafeArea(
        top:false,
        bottom:true,
        child: new ListView(
          children: <Widget>[
            _infoBox(),
            _infoBox(),
            _infoBox(),
            _infoBox(),
            _infoBox(),
            _infoBox(),
            _infoBox(),
             
          ]
        ),
      ),
    );
  }
}







Widget _infoBox() {
  return new Container(
      // margin: EdgeInsets.fromLTRB(10.0,20.0,10.0,20.0),
      padding: EdgeInsets.fromLTRB(20.0,20.0,20.0,20.0),
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            alignment: Alignment.topLeft,
            child: new Text(
              "PLAY / PARK",
              style: new TextStyle(
                fontSize: 12.0,
                color: Colors.black
              ),
            ),
          ),
          new Padding(padding: EdgeInsets.all(5.0)),
          new Container(
            // alignment: Alignment.topLeft,
            child: new Row(
              children: <Widget>[
              new Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    "${data.title} 대한민국대한민국대한민국대한민국대한민국대한민국대한민국대한민국대한민국대한민국대한민국대한민국",
                    style: new TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                ),
                flex: 4,
              ),
              new Expanded(
                child: new Stack(
                  children: <Widget>[
                    new Align(
                      alignment: AlignmentDirectional.topEnd,
                      child:
                        new RawMaterialButton(
                          onPressed: () {},
                          child: new Icon(
                            Icons.bookmark,
                            color: Colors.blue,
                            size: 20.0,
                          ),
                          shape: new CircleBorder(),
                          elevation: 4.0,
                          fillColor: Colors.white,
                          padding: const EdgeInsets.all(12.0),
                      ),
                    ),
                  ],
                ),
                flex: 1,
              ),
            ],
           )
         ),
         new Padding(padding: EdgeInsets.all(5.0)),
         new Container(
            alignment: Alignment.topLeft,
            child: new Text(
              "Top Choice",
              style: new TextStyle(
                fontSize: 11.0,
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w100
              ),
            ),
          ),
      ],
    )
  );
}

Widget _descriptionBox() {
  return new Container(
      // margin: EdgeInsets.fromLTRB(10.0,20.0,10.0,20.0),
      padding: EdgeInsets.fromLTRB(20.0,20.0,20.0,20.0),
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            alignment: Alignment.topLeft,
            child: new Text(
              data.description,
              style: new TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ),
          new Padding(padding: EdgeInsets.all(10.0)),
          new Container(
            alignment: Alignment.topLeft,
            child: new Text(
              data.description,
              style: new TextStyle(
                fontSize: 12.0,
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300
              ),
            ),
          ),
      ],
    )
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

Widget _hr() {
  return new Container(
    // width: 300.0,
    margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
    height: 0.8,
    color: greyColor,
  );
}
Widget _line() {
  return new Container(
    // width: 300.0,
    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
    height: 0.5,
    color: greyColor,
  );
}