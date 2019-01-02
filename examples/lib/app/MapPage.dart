import "package:flutter/material.dart";
import "package:flutter_map/flutter_map.dart";
import 'package:latlong/latlong.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MapPage extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Map Example"),
      ),
      body: 
      new Container(
        child: Stack( 
          children: <Widget>[
            new FlutterMap(
              options: new MapOptions(
                center: new LatLng(51.5, -0.09),
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
                    _marker(51.5, -0.09),
                    _marker(51.6, -0.19),
                  ],
                ),
              ],
            ),
            new Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(0.0,
              MediaQuery.of(context).size.height * .60,0.0,0.0,),
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
                            return new Image.network(
                              "http://via.placeholder.com/288x188",
                              fit: BoxFit.fill,
                            );
                          },
                          itemCount: 10,
                          viewportFraction: 0.7,
                          scale: 0.9,
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
                child: new Image(image: AssetImage('assets/images/marker.png')),
              ),
            );
}