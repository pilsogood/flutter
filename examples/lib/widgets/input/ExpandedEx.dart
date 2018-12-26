import "package:flutter/material.dart";

class ExpandedEx extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<ExpandedEx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Expanded Example"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Image from assets: "),
              new Image.asset("/assets/images/dog.jpeg"),
              new Text("Image from network: "),
              new Expanded(child: new Image.network("https://static.makeuseof.com/wp-content/uploads/2012/10/flutter-logo.jpg"))
            ],
          ),
        )
      )
    );
  }
}