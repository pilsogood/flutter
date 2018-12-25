import "package:flutter/material.dart";

class BottomSheetsEx extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<BottomSheetsEx> {

  void _showBottom() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('Some info here',
              style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: new Text("Close") 
              )
            ],
          )
        );
      }
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
              new RaisedButton(onPressed: _showBottom, child: new Text('Click me'),)
            ],
          ),
        )
      ),
    );
  }
}