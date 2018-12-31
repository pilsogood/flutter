import 'dart:async';
import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class ContentsPage extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<ContentsPage> {

  // List jsonString = ['dogs', 'cats', 'horses', 'fish'];
  // List jsonStringList = json.decode('{ "name": "John Smith", "email": "john@example.com" }');
  List jsonStringList = json.decode('["dogs", "cats", "horses", "fish"]');
  Map jsonStringMap = json.decode('{ "name":"test","value":"values"}');
  // Map<String, dynamic> user = json.decode(jsonString);


  Future<http.Response> fetchPhotos(http.Client client) async {
    return client.get('https://jsonplaceholder.typicode.com/photos');
  }

  Future<String> _loadAsJsonAsset() async {
    return await rootBundle.loadString('assets/json/list.json');
  }

  Future _loadToJson() async {
    String jsonString = await _loadAsJsonAsset();
    final jsonResponse = json.decode(jsonString);
    print(jsonResponse);

    Map<String, dynamic> user = jsonResponse;

    print('Howdy, ${user['name']}!');
    print('We sent the verification link to ${user['score']}.');

  }

  @override
  initState() {
    super.initState();
    _loadToJson();
    print('ab');
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body:  new Container(
        constraints: new BoxConstraints.expand(),
          child: new Stack(
          children: <Widget>[
            _getContent(),
          ],
        )
      )
    );
  }
}

Widget _getContent() {
  return new ListView(
    padding: new EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 32.0),
    children: <Widget>[
        
        new Container(
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          // color: Colors.white,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text('test')
            ],
          )
        )
    ],
  );
}
