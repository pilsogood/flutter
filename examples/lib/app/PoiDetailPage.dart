import 'package:examples/app/PoiListPage.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'dart:ui';
import 'dart:io';
import "package:flutter_map/flutter_map.dart";
import 'package:latlong/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

Color gradientStart = Color.fromRGBO(130, 84, 234 , 1); //Change start gradient color here
Color gradientMiddle = Color.fromRGBO(207, 139, 243 , 1); //Change end gradient color here
Color gradientEnd = Color.fromRGBO(215, 10, 215 , 1); //Change end gradient color here
Color mainColor = Color.fromRGBO(130, 84, 234, 1);
Color shadowColor = Color.fromRGBO(47, 92, 182, 0.2);
Color greyDarkColor = Color.fromRGBO(106, 106, 106, 1);
Color greyColor = Color.fromRGBO(230, 236, 240, 1);

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
    this.setState(() {
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
                    _contents(),
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
        _hr(),
        _descriptionBox(),
        // _hr(),
        _nearlySpot(),
        // _hr(),
        // _optionBox(),
        _hr(),
        _mapBox(),
        _hr(),
        _recommendPoiBox(),
      ],
    )
    ]
  )
  );
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
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
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

Widget _optionBox() {
  return new Container(
      // margin: EdgeInsets.fromLTRB(10.0,20.0,10.0,20.0),
      padding: EdgeInsets.fromLTRB(20.0,20.0,20.0,20.0),
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Padding(padding: EdgeInsets.all(20.0)),
          new Container(
            alignment: Alignment.topLeft,
            child: new Text(
              data.description,
              style: new TextStyle(
                fontSize: 12.0,
                color: Colors.black
              ),
            ),
          ),
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
  return Column(
    children: <Widget>[
      new Container(
        child: new Text(
          'LOCATION',
          style: new TextStyle(
            fontSize: 15.0,
            color: Colors.black,
            fontWeight: FontWeight.w900
          ),
        ),
      ),
      new Container(
        margin: EdgeInsets.all(20.0),
        height: 220.0,
        decoration: new BoxDecoration(
          border: new Border.all(width: 1.0, color: greyColor),
        ),
        child: new FlutterMap(
          options: new MapOptions(
            center: new LatLng(37.5556933, 126.8826586),
            zoom: 10.0,
          ),
          layers: [
            new TileLayerOptions(
              urlTemplate: "https://api.tiles.mapbox.com/v4/"
                           "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
              additionalOptions: {
                           'accessToken': 'pk.eyJ1IjoidHJpcGdyaWRhIiwiYSI6ImNpcHBzZnpscjA0bThmaW5vbDk5cWl3dW0ifQ.e99UYipJRSIq0eJ3--_AEg',
                           'id': 'mapbox.streets',
              },
            ),
            new MarkerLayerOptions(
              markers: [
                _marker(37.5556933, 126.8826586),
              ]          
            ),
          ],
        )
      ),
      new Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text("LOCATION & CONTACT",
             style: new TextStyle(
                fontSize: 13.0,
                color: greyDarkColor,
                fontWeight: FontWeight.w700
              ),
            ),
            _line(),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Icon(Icons.location_on, size: 12.0, color: Colors.black),
                  new Padding(padding:EdgeInsets.all(5)),
                  new Text("KORA"),
                ],
              )
            ),
            _line(),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Icon(Icons.local_phone , size: 12.0, color: Colors.black),
                  new Padding(padding:EdgeInsets.all(5)),
                  new Text("022312321"),
                ],
              )
            ),
            _line(),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Icon(Icons.local_post_office , size: 12.0, color: Colors.black),
                  new Padding(padding:EdgeInsets.all(5)),
                  new Text("pil@tripgrida.com"),
                ],
              )
            ),
            _line(),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Icon(Icons.home , size: 12.0, color: Colors.black),
                  new Padding(padding:EdgeInsets.all(5)),
                  new InkWell(
                    child: Text("https://www.tripgrida.com"),
                    onTap: () {
                      // _openMap(37.5556933, 126.8826586);
                      _launchWeb("https://www.tripgrida.com");
                    }
                  )
                ],
              )
            ),
            
            new Padding(padding: EdgeInsets.all(20.0)),
            new Text("MORE INFO",
             style: new TextStyle(
                fontSize: 13.0,
                color: greyDarkColor,
                fontWeight: FontWeight.w700
              ),
            ),
            _line(),
             new Container(
              child: new Row(
                children: <Widget>[
                  new Icon(Icons.credit_card  , size: 12.0, color: Colors.black),
                  new Padding(padding:EdgeInsets.all(5)),
                  new Text("US\$200/600"),
                ],
              )
            ),
          ],
        )
      )
    ], 
  );
}

_launchWeb(urls) async {
  String url = urls;
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch Maps';
  }
}


_launchMaps(lat,lng) async {
  String url = "https://www.google.com/maps/search/?api=1&query=${lat},${lng},17&query_place_id=PLACE_ID";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch Maps';
  }
}


_sendMail(nm) async {
    // Android and iOS
    String uri = "mailto:$nm?subject=Greetings&body=Hello%20World";
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
    throw 'Could not launch $uri';
    }
  }

  _openMap(lat,lng) async {
    // Android
    var url = "geo:$lat,$lng";
    if (Platform.isIOS) {
      // iOS
      url = "http://maps.apple.com/?ll=$lat,$lng";
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


Marker _marker(lat, lng) {
  return new Marker(
    width: 45.0,
    height: 45.0,
    point: new LatLng(lat, lng),
    builder: (ctx) =>
    new Container(
      child: new Image(image: AssetImage('assets/images/marker2.png')),
    ),
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
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: new Text(data.title, 
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

Widget _nearlySpot() {
  return Container(
      // margin: new EdgeInsets.only(top: 120.0),
      padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
      height: 250.0,
      child: new Column(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
            alignment: Alignment.topLeft,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Text(
                    data.title,
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black
                    ),
                  ),
                flex: 3,
              ),
              new Expanded(
                child: new Container(
                  alignment: Alignment.topRight,
                  child: new Text(
                      "See all",
                      style: new TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
                flex: 1,
              ),
            ],
           )
         ),
         new Expanded(
          child: new ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _spotCards(),
                _spotCards(),
                _spotCards(),
                _spotCards(),
                _spotCards(),
                _spotCards(),
                _spotCards(),
              ],
            )
          )
        ],
      )
  );
}



Widget _spotCards() {
  String title = "sdadasdasdasdasdasdadadsadssdadasdasdasdasdasdadadsads";
  String shortTitle = "";

  if (title.length > 28) {
        shortTitle = title.substring(0, 28)+"...";
  } else {
        shortTitle = title;
  }

  return  new Container(
    child: new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Expanded(
            child: new Container(
                child: new ClipRRect(
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0), 
                    topRight:  const Radius.circular(10.0)
                    ),
                  child: Image.network(
                    data.image,
                    width: 150.0,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
              ),
            ),
            flex: 3,
          ),
          new Expanded(
            child: new Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: new Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new ConstrainedBox(
                  constraints: new BoxConstraints(maxHeight: 50.0),
                  child :new Text(
                    shortTitle,
                    style: new TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    ),
                  ),  
                  new Padding(padding: EdgeInsets.all(3.0)),
                  new Container(
                    alignment: Alignment.topLeft,
                    child: new Text(
                      '\$100',
                        style: new TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                        ),
                      ),
                    ),
                ],
              ),
            ),
          flex: 3,
          ),
        ],
      ),
    ),
    width: 150.0,
    // height: 80.0,
    margin: new EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
    //  padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
    decoration: new BoxDecoration(
      color: new Color(0xFFFFFFFF),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(10.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: shadowColor,
          blurRadius: 8.0,
          offset: new Offset(0.0, 3.0),
        ),
      ],
    ),
  );
}


Widget _recommendPoiBox()  {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Padding(padding: EdgeInsets.all(20.0)),
        new Text("NEARBY",
          style: new TextStyle(
            fontSize: 15.0,
            color: Colors.black,
            fontWeight: FontWeight.w900
          ),
        ),
        new Padding(padding: EdgeInsets.all(10.0)),
        new Column(
          children: <Widget>[
              _spotListCards(),
              _spotListCards(),
              _spotListCards(),
              _spotListCards(),
              _spotListCards(),
              _spotListCards(),
              _spotListCards(),
              _spotListCards(),
              _spotListCards(),
              _spotListCards(),
              
          ] ,
        ),
        new Padding(padding: EdgeInsets.all(10.0)),
      ],
  );
}


// Widget _spotListCards() {
//   return  new Container(
//     child: new Text("test"),
//     height: 100.0,
//     padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
//   );
// }

Widget _spotListCards() {

  return new GestureDetector(
    onTap: (){
     
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
                      image: new NetworkImage( data.image),
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
                        data.title,
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
                        data.description,
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