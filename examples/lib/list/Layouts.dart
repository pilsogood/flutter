import "package:flutter/material.dart";

class Layouts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text("Dialogs Example"),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs Example"),
              ),
            ],  
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/loader'),
                child: new Text("Loader Example"),
              ),
            ],  
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/gridview'),
                child: new Text("GridView Examples"),
              ),
            ],  
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/listview'),
                child: new Text("ListView Examples"),
              ),
            ],  
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/gridview'),
                child: new Text("Examples"),
              ),
            ],  
          ),
        ]
      ),
    );
  }
}
