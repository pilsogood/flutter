import "package:flutter/material.dart";

class Intro extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP',
      home: new Scaffold(
      appBar: AppBar(
        title: new Text("App Example"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[

            ],
          ),
        )
      )
    )
    );
  }
}