import "package:flutter/material.dart";

class AppBarEx extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<AppBarEx> {

  int _value = 0;

  void _add() => setState(() => _value++ );
  void _remove() => setState(() => _value-- );

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: new Text("AppBar Example"),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: _add),
          new IconButton(icon: new Icon(Icons.remove), onPressed: _remove),
        ],
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("${_value.toString()} 입니다"),
            ],
          ),
        )
      )
    );
  }
}