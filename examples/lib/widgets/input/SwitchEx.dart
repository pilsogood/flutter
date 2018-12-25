import "package:flutter/material.dart";

class SwitchEx extends StatefulWidget {
  @override
  _SwitchEx createState() => _SwitchEx();
}

class _SwitchEx extends State<SwitchEx> {

  bool _value1 = false;
  bool _value2 = false;

  void _onChanged1(bool value) => setState(() => _value1 = value);
  void _onChanged2(bool value) => setState(() => _value2 = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Switch Example"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(30.0),
        child: new Center(
         child: new Column(
           children: <Widget>[
             new Switch(value: _value1, onChanged: _onChanged1),
             new SwitchListTile(
               value: _value2,
               onChanged: _onChanged2,
               title: new Text(
                 "hello!",
                 style: new TextStyle(
                   fontWeight: FontWeight.bold,
                   color: Colors.orange
                 )
                 )
             )
           ], 
         ),
       ),
      )
    );
  }
}