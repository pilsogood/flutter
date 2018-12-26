
import 'dart:async';
import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class ListViewWithMapEx extends StatefulWidget {
  @override
  _ListViewExt createState() => _ListViewExt();
}

class _ListViewExt extends State<ListViewWithMapEx> {

  List _pets = ['dogs', 'cats', 'horses', 'fish'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("ListView with Darts List Example"), 
        backgroundColor:Colors.deepOrange
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Text('Pets'),
            new Expanded(
              child: new ListView.builder(
                itemCount: _pets.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Row(
                    children: <Widget>[
                      new Text(_pets.elementAt(index)),
                    ],
                  );
                },
              )
            )
          ],
        )
      )
    );
  }
}