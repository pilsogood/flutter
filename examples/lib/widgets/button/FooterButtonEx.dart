import "package:flutter/material.dart";

class FooterButtonEx extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<FooterButtonEx> {
  String _value = '';
  void _onCLick(String value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Icon Button Example"),
      ),
      persistentFooterButtons: <Widget>[
        new IconButton(icon: new Icon(Icons.timer), onPressed: () => _onCLick('Button1')),
        new IconButton(icon: new Icon(Icons.people), onPressed: () => _onCLick('Button2')),
        new IconButton(icon: new Icon(Icons.map), onPressed: () => _onCLick('Button3')),
      ],
      body: Container(
        padding: new EdgeInsets.all(30.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(_value)
          ],
          ),)
      )
    );
  }
}