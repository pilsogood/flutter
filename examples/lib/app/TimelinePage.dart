import "package:flutter/material.dart";
import 'package:examples/app/TimelineDetailPage.dart';


Color gradientStart = Color.fromRGBO(130, 84, 234 , 1); 
Color gradientMiddle = Color.fromRGBO(207, 139, 243 , 1); 
Color gradientEnd = Color.fromRGBO(215, 10, 215 , 1); 
Color mainColor = Color.fromRGBO(130, 84, 234, 1);
Color shadowColor = Color.fromRGBO(47, 92, 182, 0.2);
Color greyDarkColor = Color.fromRGBO(106, 106, 106, 1);
Color greyColor = Color.fromRGBO(230, 236, 240, 1);
Color backgrounGreyColor = Color.fromRGBO(245, 245, 245, 1);
Color lineColor = const Color(0xD2D2E1ff);

class TimelinePage extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class Db {
  final int seq;
  final String profileImage;
  final String image;
  final String title;
  final String description;

  Db(this.seq, this.profileImage, this.image, this.title, this.description);
}

BuildContext context = null;

String profileImage = r"https://www.tripgrida.com/img/profile/1_1448624008.jpg";
String image = r"https://www.tripgrida.com/img/backgrounds/bg-cover-4.jpg";
List<Db> data = List.generate(100,(i) => Db(i, profileImage, image, 'title / $i', 'description $i'));

class _AppStatus extends State<TimelinePage> {
  
  @override
  Widget build(BuildContext c) {

    context = c;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: new Text("Timeline"),
      ),
      body: 
      new Container(
        color: backgrounGreyColor,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _list(100),
         ]
        )
      )
    );
  }
}

// 리스트 위젯 
Widget _list(count) {
  return new Expanded(
    child: new ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, i) {
        return _card2(i);
      }
    )
  );
}

// 카드형식 위젯
Widget _card1(index) {
  return new InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => 
          new TimelineDetailPage(
            getDb: data[index]
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
                  _profileImage(data[index].profileImage, 55.0, 55.0),
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
                            new Text(" · 12분전",
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              )
                            ),
                            new Expanded(
                              child: new Container(
                                alignment: Alignment.topRight,
                                child: new Text("MORE",
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
                              image: new NetworkImage(data[index].image),
                              fit: BoxFit.cover,
                            )
                          )
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    Icons.chat_bubble_outline,
                                    color: Colors.grey,
                                    size: 16.0,
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
                                    size: 16.0,
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
                                    size: 16.0,
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
                                    size: 16.0,
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


// 카드형식 위젯
Widget _card2(index) {
  return new InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => 
          new TimelineDetailPage(
            getDb: data[index]
          )
        )
      );
    },
    child: new Container(
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      // padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: shadowColor,
            blurRadius: 8.0,
            offset: new Offset(0.0, 0.0)
          )
        ]
      ),
      child : new Column(
        children: <Widget>[
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
                    _profileImage(data[index].profileImage, 55.0, 55.0),
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
                                  child: new Text("12분전",
                                    style: TextStyle(
                                      fontSize: 13.0,
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
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),

          new Container(
            margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            child: new Container(
              height: 180.0,
              decoration: new BoxDecoration(
                color: Colors.white,
                // borderRadius: new BorderRadius.circular(10.0),
                image : new DecorationImage(
                  image: new NetworkImage(data[index].image),
                  fit: BoxFit.cover,
                )
              )
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            padding: new EdgeInsets.all(10.0),
            child: new Text(
              "blablablablablablablablablablablablablablablablablablablablablablablabla",
              style: TextStyle(
                fontSize: 15.0,
              ),
              softWrap: true,
              overflow: TextOverflow.fade,
            )
          ),
          new Divider(),
          new Container(
            margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 20.0),
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
                        size: 16.0,
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
                        size: 16.0,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                        size: 16.0,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Icon(
                        Icons.share,
                        color: Colors.grey,
                        size: 16.0,
                      ),
                    ],
                  ),
                  flex: 1,
                ),
              ]
            )
          ),
        ]
      )
    )
  );
}


// 카드형식 위젯
Widget _cards(index) {
  return new GestureDetector(
    onTap: (){
      print("Container clicked ${data[index].image}");
      Navigator.push(context, MaterialPageRoute(builder: (context) => 
          new TimelineDetailPage(
              getDb: data[index]
          )
        )
      );
    },
    child: new Container(
      child: 
          new Column(
        children: <Widget>[


        new Container(
          height: 180.0,
          decoration: new BoxDecoration(
            color: Colors.white,
            image : new DecorationImage(
              image: new NetworkImage(data[index].image),
              fit: BoxFit.cover,
            )
          )
        ),
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
                        data[index].title,
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
                        data[index].description,
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
                    new Icon(Icons.favorite_border),
                    
                  ],
                )
              )
            ]
          ),
          // new Divider(
          //   color: const Color(0xD2D2E1ff),
          // ),
        ]
      )
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

// 구분 라인 위젯
Widget _titleLine() {
  return new Container(
    width: 80.0,
    height: 0.8,
    color: lineColor,
    margin: EdgeInsets.all(2.0),
  );
}

// 구분 라인 위젯
Widget _divider() {
  return new Container(
    width: 80.0,
    height: 0.8,
    color: lineColor,
    margin: EdgeInsets.all(2.0),
  );
}