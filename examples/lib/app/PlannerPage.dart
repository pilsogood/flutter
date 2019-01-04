import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Color gradientStart = Color.fromRGBO(130, 84, 234 , 1); 
Color gradientMiddle = Color.fromRGBO(207, 139, 243 , 1); 
Color gradientEnd = Color.fromRGBO(215, 10, 215 , 1); 
Color mainColor = Color.fromRGBO(130, 84, 234, 1);
Color shadowColor = Color.fromRGBO(47, 92, 182, 0.2);
Color greyDarkColor = Color.fromRGBO(106, 106, 106, 1);
Color greyColor = Color.fromRGBO(230, 236, 240, 1);
Color backgrounGreyColor = Color.fromRGBO(245, 245, 245, 1);
Color lineColor = const Color(0xD2D2E1ff);

Color timelineCircleColor = const Color.fromRGBO(111, 193, 115, 1);
Color timelineLineColor = const Color.fromRGBO(229, 229, 209, 1);


class Db {
  final int seq;
  final String profileImage;
  final String image;
  final String title;
  final String description;

  Db(this.seq, this.profileImage, this.image, this.title, this.description);
}

String profileImage = r"https://www.tripgrida.com/img/profile/1_1448624008.jpg";
String image = r"https://www.tripgrida.com/img/backgrounds/bg-cover-4.jpg";
List<Db> data = List.generate(100,(i) => Db(i, profileImage, image, 'title / $i', 'description $i'));


class Task {
  final String name;
  final String category;
  final String time;
  final Color color;
  final bool completed;

  Task({this.name, this.category, this.time, this.color, this.completed});
}

List<Task> tasks = [
  new Task(
      name: "Catch up with Brian",
      category: "Mobile Project",
      time: "5pm",
      color: Colors.orange,
      completed: false),
  new Task(
      name: "Make new icons",
      category: "Web App",
      time: "3pm",
      color: Colors.cyan,
      completed: true),
  new Task(
      name: "Design explorations",
      category: "Company Website",
      time: "2pm",
      color: Colors.pink,
      completed: false),
  new Task(
      name: "Lunch with Mary",
      category: "Grill House",
      time: "12pm",
      color: Colors.cyan,
      completed: true),
  new Task(
      name: "Teem Meeting",
      category: "Hangouts",
      time: "10am",
      color: Colors.cyan,
      completed: true),
];

class PlannerPage extends StatefulWidget {
  final Task task;
  final double dotSize = 12.0;

  const PlannerPage({Key key, this.task}) : super(key: key);


  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<PlannerPage> 
  with TickerProviderStateMixin {

  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Planner Example"),
      ),
      body: new Container(
          child: new Column(
             children: <Widget>[
              new Expanded(
                child: _list(),
              )
             ]
          ),
        ),
    );
  }
}

Widget _list() {
  return new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
      return new Stack(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(left: 100.0),
            // margin: new EdgeInsets.all(20.0),
            child: new Container(
              // width: 300.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  _card(),
                ],
              ),
            ),
          ),
        new Positioned(
          top: 0.0,
          bottom: 0.0,
          left: 88.0,
          child: new Container(
            height: 200.0,
            width: 3.0,
            color: timelineLineColor,
          ),
        ),
        new Positioned(
          top: 27.0,
          left: 20.0,
          child: new Text(
            "1 Hours",
             style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
              ),
          )
        ),
        new Positioned(
          top: 20.0,
          left: 75.0,
          child: new Container(
            height: 30.0,
            width: 30.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: new Container(
              margin: new EdgeInsets.all(5.0),
              height: 20.0,
              width: 20.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: timelineCircleColor
              ),
            ),
          ),
        )
      ],
    );
  },
  itemCount: 5,
  );
}

Widget _card() {
  return new Container(
      child : new Column(
        children: <Widget>[
          new Container(
            // padding: EdgeInsets.all(5.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Container(
                    padding: new EdgeInsets.fromLTRB(0.0,10.0,0.0,10.0),
                    child: 
                    _poiImage(data[0].profileImage, 38.0, 38.0),
                    ),
                ),
                new Expanded(
                  flex: 3,
                  child: new Container(
                    margin: EdgeInsets.fromLTRB(2.0,8.0,0.0,0.0),
                    // height: 200,
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
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
                                  new Text("숙박 · Grand Hotel",
                                             style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold
                                              )
                                  ),
                                  new Padding(padding: EdgeInsets.all(3),),
                                  new Row(
                                    children: <Widget>[
                                      new Icon(Icons.location_on, size: 13.0, color: Colors.black),
                                      new Padding(padding: EdgeInsets.all(2),),
                                      new Text("seoul,repulic of korea",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300,
                                          color:greyDarkColor
                                        )
                                      ),
                                    ],
                                  ),
                                ],
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
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
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
        ]
      )
  );
}



// 라운드 프로필 사진 
Widget _poiImage(image, width, height) {
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
