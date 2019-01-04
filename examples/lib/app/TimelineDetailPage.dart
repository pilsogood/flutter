
import 'package:flutter/cupertino.dart';
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
  Db data;
  TextEditingController _textController;

class _AppStatus extends State<TimelineDetailPage> {

  TextEditingController _textController = new TextEditingController();
  bool _isComposing = false; // make it true whenever the user is typing in the input field. 
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    data = widget.getDb;
    // width = MediaQuery.of(context).size.width;

    List<Widget> _replays = new List<Widget>();
    _replays.add(_reply());
    _replays.add(_reply());

    return Scaffold(
      appBar: AppBar(
        title: new Text("${data.title}"),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [ 
            new Flexible(
            // new Expanded(
              child: new ListView(
                  // shrinkWrap: true,
                  children: <Widget>[
                  _card(),
                   new Column(children: _replays,),
                  ]
              )
            ),
            new Divider(height: 1.0),
            new Container(
              decoration: new BoxDecoration(
                color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ]
        ),
      )
    );
  }
}


Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                },
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? new CupertinoButton(
                        child: new Text("Send"),
                        onPressed: () => {}
                      )
                    : new IconButton(
                        icon: new Icon(Icons.send),
                        onPressed: () => {}
                      )),
          ]),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
                  border:
                      new Border(top: new BorderSide(color: Colors.grey[200])))
              : null),
    );
  }



Widget _card() {
  return new Container(
      child : new Column(
        children: <Widget>[
           new Container(
            padding: EdgeInsets.fromLTRB(35.0,18.0, 0.0, 0.0),
            alignment: Alignment.topLeft,
            child: new Row(
              children: <Widget>[
                new Icon(Icons.favorite,color: Colors.grey,size: 12.0,),
                new Padding(padding: EdgeInsets.all(2),),
                new Text("@bill 님이 추천합니다",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ]
            )
           ),
          new Container(
            padding: EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Container(
                    padding: new EdgeInsets.all(5.0),
                    child: 
                    _profileImage(data.profileImage, 55.0, 55.0),
                    ),
                ),
                new Expanded(
                  flex: 4,
                  child: new Container(
                    margin: EdgeInsets.fromLTRB(0.0,10.0,10.0,0.0),
                    // height: 200,
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.fromLTRB(10.0,0.0,0.0,0.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text("@Seungpil",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  new Padding(padding: EdgeInsets.all(3),),
                                  new Row(
                                    children: <Widget>[
                                      new Icon(Icons.location_on, size: 13.0, color: Colors.black),
                                      new Padding(padding: EdgeInsets.all(2),),
                                      new Text("Seoul, Repulic of Korea",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w300,
                                          color:greyDarkColor
                                        )
                                      ),
                                    ],
                                  ),
                                 
                                ],
                              ),
                              new Expanded(
                                child: new Container(
                                  alignment: Alignment.topRight,
                                  child: new InkWell(
                                    child: new Icon(Icons.settings, size: 18.0, color: Colors.grey),
                                    onTap: _showBottom
                                  )
                                ),
                                flex: 4,
                              ),
                            ],
                          )
                        ),
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),

          new Container(
            margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            padding: new EdgeInsets.all(15.0),
            child: new Text(
              "blablablablablablablablablablablablablablablablablablablablablablablabla",
              style: TextStyle(
                fontSize: 18.0,
              ),
              softWrap: true,
              overflow: TextOverflow.fade,
            )
          ),

          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Container(
              height: 300.0,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0),
                image : new DecorationImage(
                  image: new NetworkImage(data.image),
                  fit: BoxFit.cover,
                )
              )
            ),
          ),
          new Divider(),
          new Container(
            padding: EdgeInsets.fromLTRB(20.0,5.0, 20.0, 5.0),
            alignment: Alignment.topLeft,
            child: new Column(
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text("2018년 01월 03일 09:20 오전 에",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                   ),
                   new Text("Tripgrida for Android",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blueGrey,
                      )
                    ),
                 ]
               ),
               new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
    
                    new Text("을 통해 기록",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      )
                    ),
                  ]
                 )
              ],
            ),
          ),
          new Divider(),
          new Container(
            padding: EdgeInsets.fromLTRB(20.0,5.0, 20.0, 5.0),
            alignment: Alignment.topLeft,
            child: new Column(
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text("6",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          new Padding(padding: EdgeInsets.all(2),),
                          new Text("리트윗",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                       ]
                    ),
                    new Padding(padding: EdgeInsets.all(8),),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("26",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                        ),
                        new Padding(padding: EdgeInsets.all(2),),
                        new Text("마음에 들어요",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                         )
                      ]
                    ),
                 ]
               ),
              ]
            )
          ),
          new Divider(),
          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.grey,
                        size: 25.0,
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                new Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Icon(
                        Icons.repeat,
                        color: Colors.grey,
                        size: 25.0,
                      ),
                      new Padding(padding: EdgeInsets.all(2.0),),
                    ],
                  ),
                  flex: 1,
                ),
                new Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                        size: 25.0,
                      ),
                      new Padding(padding: EdgeInsets.all(2.0),),
                    ],
                  ),
                  flex: 1,
                ),
                new Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Icon(
                        Icons.share,
                        color: Colors.grey,
                        size: 25.0,
                      ),
                    ],
                  ),
                  flex: 1,
                ),
              ]
            )
          ),
          new Divider(),
        ]
      )
  );
}




Widget _reply() {
  return new InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => 
          new TimelineDetailPage(
            getDb: data
          )
        )
      );
    },
    child: new Column(
      children: <Widget>[
        new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: new Container(
                  padding: new EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                  child: 
                  _profileImage(data.profileImage, 55.0, 55.0),
                  ),
              ),
              new Expanded(
                flex: 4,
                child: new Container(
                  margin: EdgeInsets.fromLTRB(0.0,10.0,10.0,0.0),
                  // height: 200,
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Text("@seungpil",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            // new Text(" · 12분전",
                            //   style: TextStyle(
                            //     fontSize: 13.0,
                            //     fontWeight: FontWeight.w500,
                            //     color: Colors.grey,
                            //   )
                            // ),
                            new Expanded(
                              child: new Container(
                                alignment: Alignment.topRight,
                                child: new Text(" · 12분전",
                                   style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  )
                                ),
                              ),
                              flex: 4,
                            ),
                          ],
                        )
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                        child: new Text(
                          "blablablablablablablablablablablablablablablablablablablablablablablabla",
                          style: TextStyle(
                            fontSize: 15.0,
                          )
                        )
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 15.0),
                        child: new Container(
                          height: 180.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(10.0),
                            image : new DecorationImage(
                              image: new NetworkImage(data.image),
                              fit: BoxFit.cover,
                            )
                          )
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(10.0,5.0,10.0,5.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    Icons.chat_bubble_outline,
                                    color: Colors.grey,
                                    size: 15.0,
                                  ),
                                ],
                              ),
                              flex: 1,
                            ),
                            new Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    Icons.repeat,
                                    color: Colors.grey,
                                    size: 15.0,
                                  ),
                                  new Padding(padding: EdgeInsets.all(2.0),),
                                  new Text("100",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    )
                                  )
                                ],
                              ),
                              flex: 1,
                            ),
                            new Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    Icons.favorite_border,
                                    color: Colors.grey,
                                    size: 15.0,
                                  ),
                                  new Padding(padding: EdgeInsets.all(2.0),),
                                  new Text("23",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    )
                                  )
                                ],
                              ),
                              flex: 1,
                            ),
                            new Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    Icons.share,
                                    color: Colors.grey,
                                    size: 15.0,
                                  ),
                                ],
                              ),
                              flex: 1,
                            ),
                          ]
                        )
                      ),
                    ],
                  )
                ),   
              ),
            ],
          )
        ),
        new Divider()
      ],
    )
  );
}


// 라운드 프로필 사진 
Widget _profileImage(image, width, height) {
  return new Center(
    child: new Container(
      width: width,
      height: height,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: new NetworkImage(image)
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadowColor,
            offset: Offset(0.0, 0.0),
            blurRadius: 10.0,
            ),
        ],
      )
    ),
  );
}

void _showBottom() {
   showModalBottomSheet(context: context,
     builder: (builder) {
       return new Column(
         mainAxisSize: MainAxisSize.min,
         children: <Widget>[
           new ListTile(
             leading: new Icon(Icons.music_note),
             title: new Text('Music'),
             onTap: () => {}         
           ),
           new ListTile(
             leading: new Icon(Icons.photo_album),
             title: new Text('Photos'),
             onTap: () => {}         
           ),
           new ListTile(
             leading: new Icon(Icons.videocam),
             title: new Text('Video'),
             onTap: () => {}          
           ),
         ],
       );
     }
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

