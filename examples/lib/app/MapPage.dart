import "package:flutter/material.dart";
import "package:flutter_map/flutter_map.dart";
import 'package:latlong/latlong.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:examples/app/MapSearchPage.dart';
import 'package:examples/app/PoiListPage.dart';

Color gradientStart = Color.fromRGBO(130, 84, 234 , 1); //Change start gradient color here
Color gradientMiddle = Color.fromRGBO(207, 139, 243 , 1); //Change end gradient color here
Color gradientEnd = Color.fromRGBO(215, 10, 215 , 1); //Change end gradient color here
Color mainColor = Color.fromRGBO(130, 84, 234, 1);
Color shadowColor = Color.fromRGBO(47, 92, 182, 0.2);


class MapPage extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class Menu {
  const Menu({this.category, this.title, this.icon});
  final String category;
  final String title;
  final IconData icon;
}

const List<Menu> menus = const <Menu> [
  const Menu(category: "search", title: "검색", icon: Icons.search),
  const Menu(category: "poi", title: "장소", icon: Icons.security),
];

class _AppStatus extends State<MapPage> {
 
  void _clicked(Menu menu) {
    setState(() {
      print("$menu");
    });
  }

  void _link(Menu menu) {
    switch(menu.category) {
      case 'search' :
          Navigator.push(context, MaterialPageRoute(builder: (context) => new MapSearchPage()));
        break;
      case 'poi' :
          Navigator.push(context, MaterialPageRoute(builder: (context) => new PoiListPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Map Example"),
        actions: <Widget> [
          PopupMenuButton<Menu>(
            onSelected: _link,
            itemBuilder: (BuildContext context) {
                return menus.map((Menu menu) {
                  return PopupMenuItem(
                    value: menu,
                    child: Text(menu.title),
                  );
                }).toList();
            },
          )
        ]
      ),
      body: 
      new Container(
        child: Stack( 
          children: <Widget>[
            new FlutterMap(
              options: new MapOptions(
                center: new LatLng(37.5556933, 126.8826586),
                zoom: 13.0,
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
                    _marker(37.5656933, 126.8726586),
                  ],
                ),
              ],
            ),
            new Container(
              // width:100.0,
              height: 80.0,
              child: _topButtons(),
            ),
            new Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(0.0,
              MediaQuery.of(context).size.height * .62,0.0,0.0,),
              // padding: EdgeInsets.all(10),
              // color: Colors.white,
              // height: 180.0,

              child: 
              new Container(
                height: 150.0,
                // width: 175.0,
                    child:
                    new Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return  new Container(
                                // margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 50.0),
                                child: new DecoratedBox(
                                  decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: new BorderRadius.circular(20.0),
                                  boxShadow: <BoxShadow>[
                                    new BoxShadow(
                                      color: new Color(0xFFF8E1FE),
                                      blurRadius: 10.0,
                                      offset: new Offset(0.0, 5.0),
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/intro-bg-5.jpg"),
                                    fit: BoxFit.fill,
                                  )
                                ),
                            ),
                            );
                          },
                          itemCount: 10,
                          viewportFraction: 0.5,
                          scale: 0.5,
                        ),
                ),
            )
          ]
        )
      ),
    );
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



Widget _topButtons() {
  return Container(
      // margin: new EdgeInsets.only(top: 120.0),
      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          buttons,
          buttons,
          buttons,
          buttons,
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
  width: 80.0,
  height: 70.0,
  margin: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
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
