import "package:flutter/material.dart";
import 'dart:async';

class FloatingActionButtonEx extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<FloatingActionButtonEx> {
  String _value = '';
  void _onClicked() => setState(() => _value = new DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Scaffold(
        appBar: AppBar(
          title: new Text("DatePicker Example"),
        ),
        body: new Container(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text("TIME:"),
                new Text(_value, style: new TextStyle(color:Colors.blue))
              ],
            ),
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onClicked,
          mini: false,
          child: new Text("Click!")
        ),
      )
    );
  }
}