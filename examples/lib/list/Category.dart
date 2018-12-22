import "package:flutter/material.dart";

class Category extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text("Dialogs Example"),
        ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment:  MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Container(
                height: 35.0,
                padding: EdgeInsets.all(13.0),
                child: new Text('Layout'),
              )
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/rows'),
                child: new Text("Row"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/columns'),
                child: new Text("Column"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/containers'),
                child: new Text("Container"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dialogs'),
                child: new Text("Dialogs"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/loader'),
                child: new Text("Loader"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/custommenu'),
                child: new Text("AppBar"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/custom'),
                child: new Text("Custom"),
              ),
              new RaisedButton(
              onPressed: () => Navigator.pushNamed(context, '/loader'),
                child: new Text("Loader"),
              ),
            ],
          ),
        ]
      ),
    );
  }
}
