import "package:flutter/material.dart";
import "dart:async";

class AlertDialogEx extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<AlertDialogEx> {

  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text(message),
        actions: <Widget> [
          new RaisedButton(onPressed: () => Navigator.pop(context), child: new Text("OsssK!"))
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("BottomSheets Example"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("add widgets here"),
              new RaisedButton(onPressed: () =>_showAlert(context, 'HI!'), child: new Text('Click me'),)
            ],
          ),
        )
      ),
    );
  }
}