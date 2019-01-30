import "package:flutter/material.dart";

class TextInput extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("TextField Example"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[

          ],
        ),
      )
    );
  }
}