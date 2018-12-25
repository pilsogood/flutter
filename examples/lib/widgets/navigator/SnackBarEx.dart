import "package:flutter/material.dart";

class SnackBarEx extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<SnackBarEx> {

  final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();
  void _showBottom() {
    _scaffoldstate.currentState.showSnackBar(new SnackBar(content: new Text('Hello world')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldstate,
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