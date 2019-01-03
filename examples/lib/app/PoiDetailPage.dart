import 'package:examples/app/PoiListPage.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'dart:ui';

Color gradientStart = Color.fromRGBO(130, 84, 234 , 1); //Change start gradient color here
Color gradientMiddle = Color.fromRGBO(207, 139, 243 , 1); //Change end gradient color here
Color gradientEnd = Color.fromRGBO(215, 10, 215 , 1); //Change end gradient color here
Color mainColor = Color.fromRGBO(130, 84, 234, 1);
Color shadowColor = Color.fromRGBO(47, 92, 182, 0.2);

class PoiDetailPage extends StatefulWidget {
  final Db getDb;
  PoiDetailPage({Key key, @required this.getDb}) : super(key: key);

  @override
  _AppStatus createState() => _AppStatus();
}

Db data = null;
double width = 400;
class _AppStatus extends State<PoiDetailPage> {

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
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: new Text("${widget.getDb.title} Example"),
      // ),
      body: new SafeArea(
        top:false,
        bottom:true,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Flexible( 
              child: CustomScrollView(
                controller: controller,
                slivers: <Widget>[
                    _topBar(),
                    // _contents(widget.getDb),
                    // _peoplesList(),
                    _contents(),
                    // new Container(
                    //   child: new ListView(
                    //   children: <Widget>[
                    //       // _getHorizontalList(),
                    //     ],
                    //   ),
                    // ),
                    // _infoBox(),
                    // _optionBox(),
                    // _menuBox(),
                    // _analysisBox(),
                    // _mapBox(),
                    // _replyBox(),
                    // _recommendBox(),
                    // _recommendPoiBox(),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}


// Widget _topBar(data) {
//   return Container(
//     child: Column(
//       children: <Widget>[

//       ],
//     )
//   );
// }




Widget _contents() {
  return new SliverList(
    delegate: SliverChildListDelegate(<Widget>[
      new Column(            
      children: <Widget>[
        // _topButtons(),
        _infoBox(),
        _infoBox(),
        _optionBox(),
      ],
    )
    ]
  )
  );
}


Widget _topButtons() {
  return Container(
      // margin: new EdgeInsets.only(top: 120.0),
      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      height: 100.0,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          buttons,
          buttons,
          buttons,
          buttons,
        ],
      )
  );
}

final buttons = new Container(
  child: new Container(
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text('test',
        style: new TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          color: mainColor
        )
        ),
      ],
    ),
  ),
  width: 120.0,
  height: 80.0,
  margin: new EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
  //  padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
  decoration: new BoxDecoration(
    color: new Color(0xFFFFFFFF),
    shape: BoxShape.rectangle,
    borderRadius: new BorderRadius.circular(10.0),
    boxShadow: <BoxShadow>[
      new BoxShadow(
        color: shadowColor,
        blurRadius: 10.0,
        offset: new Offset(0.0, 5.0),
      ),
    ],
  ),
);


Widget _infoBox() {
  return new Container(
      margin: EdgeInsets.fromLTRB(10.0,20.0,10.0,20.0),
      padding: EdgeInsets.all(20.0),
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            alignment: Alignment.topLeft,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Text(
                    data.title,
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                flex: 3,
              ),
              new Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: new Icon(Icons.bookmark),
                ),
                flex: 1,
              ),
            ],
        )
      ),
      _hr(),
     ],
    )
  );
}

Widget _optionBox() {
  return Container(
    child: Column(
      children: <Widget>[
        
      ],
    )
  );
}

Widget _menuBox()  {
  return Container(
    child: Column(
      children: <Widget>[
        
      ],
    )
  );
}

Widget _analysisBox()  {
  return Container(
    child: Column(
      children: <Widget>[
        
      ],
    )
  );
}

Widget _mapBox()  {
  return Container(
    child: Column(
      children: <Widget>[
        
      ],
    )
  );
}

Widget _replyBox()  {
  return Container(
    child: Column(
      children: <Widget>[
        
      ],
    )
  );
}

Widget _recommendBox()  {
  return Container(
    child: Column(
      children: <Widget>[
        
      ],
    )
  );
}

Widget _recommendPoiBox()  {
  return Container(
    child: Column(
      children: <Widget>[
        
      ],
    )
  );
}


Widget _topBar()  {
return new SliverAppBar(
  pinned: true,
  expandedHeight: 300,
  floating: false,
  flexibleSpace: Stack(
    overflow: Overflow.clip, 
    children: <Widget>[
      new Container(
        decoration: new BoxDecoration(
            border: new Border.all(width: 1.0, color: Colors.transparent),
            // shape: BoxShape.circle,
            color: const Color(0xff7c94b6),
            image: new DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.black38.withOpacity(0.3), BlendMode.srcATop),
              image: new NetworkImage(data.image),
              fit: BoxFit.cover,
              alignment: Alignment(0.0, 1.0),
            ),
            // boxShadow: <BoxShadow>[
            //   BoxShadow(
            //     color: Colors.grey,
            //     offset: Offset(0.0, 5.0),
            //     blurRadius: 20.0,
            //   ),
            // ],
        ),
        child: 
          new Stack(
            children: <Widget>[
              Center(
                child: 
                new Text(data.title, 
                  style: new TextStyle(
                    fontStyle: FontStyle.italic, 
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        color: shadowColor,
                      ),
                      // Shadow(
                      //   offset: Offset(0.0, 0.0),
                      //   blurRadius: 8.0,
                      //   color: Color.fromARGB(125, 0, 0, 255),
                      // ),
                    ],
                  )
                ),
              ),
            ]
          )
        )
       ]
    ),
  );
}


Widget _profileImage() {
  return new Center(
    child: new Container(
      width: 80.0,
      height: 80.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: new NetworkImage("https://www.tripgrida.com/img/profile/1_1448624008.jpg")
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 0.0),
            blurRadius: 8.0,
            ),
        ],
      )
    ),
  );
}

Widget _peoplesList() {
  return new SliverList(
    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      
      return new ListTile(
        title: new Text('Name'),
        subtitle: new Text('subname'),
        leading: new CircleAvatar(
          backgroundImage:
            new NetworkImage("https://www.tripgrida.com/img/profile/1_1448624008.jpg"),
          )
       );
     }
    )
  );
}


Widget _hr() {
  return new Container(
    width: 100.0,
    height: 3,
    color: Colors.blueGrey,
    margin: EdgeInsets.fromLTRB(0.0,50.0,0.0,50.0),
  );
}
