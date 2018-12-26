
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

import "dart:async";
import "dart:convert";
import "dart:io";

class ListViewWithListEx extends StatefulWidget {
  @override
  _ListViewExt createState() => _ListViewExt();
}

class _ListViewExt extends State<ListViewWithListEx> {

  Map _countries = new Map();

  void _getData() async {
    var url = 'http://country.io/names.json';
    var response = await http.get(url);

    if(response.statusCode == 200) {
      setState(() {
        _countries = json.decode(response.body);
        print("Loaded : ${_countries.length} countries");        
      });
    }
  }

  @override 
  void initState() {
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("ListView with Dart MAP Example"), 
        backgroundColor:Colors.deepOrange
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Text('Countries'),
            new Expanded(
              child: new ListView.builder(
                itemCount: _countries.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = _countries.keys.elementAt(index);
                  return new Row(
                    children: <Widget>[
                      new Text('${key} :'),
                      new Text(_countries[key]),
                    ],
                  );
                },
              )
            )
          ],
        )
      ),
    );
  }
}