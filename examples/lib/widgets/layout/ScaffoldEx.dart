import "package:flutter/material.dart";

class ScaffoldEx extends StatelessWidget {
  final String title;
  // ScaffoldEx(this.title);
  ScaffoldEx({Key key, @required this.title}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(title),
      ),
      body: new Text(title+' page'),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Colors.blue,
          accentColorBrightness: Brightness.dark,
        ),
        child: FloatingActionButton(
          onPressed: () {

          },
          child: new Icon(Icons.accessibility)
        )
      ),
    );
  }
}