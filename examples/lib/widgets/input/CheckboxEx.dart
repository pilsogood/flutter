import "package:flutter/material.dart";

class CheckboxEx extends StatefulWidget {
  @override
  _CheckboxEx createState() => _CheckboxEx();
}

class _CheckboxEx extends State<CheckboxEx> {

  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;

  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);
  void _value3Changed(bool value) => setState(() => _value3 = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Checkbox Example"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new Checkbox( 
              key:null,
              value: _value1,
              onChanged: _value1Changed,
            ),
            new Checkbox( 
              key:null,
              value: _value2,
              onChanged: (bool value) {
                setState((){
                  _value2 = value;
                  print(_value2);
                });
              }
            ),
            new CheckboxListTile(
                value: _value3,
                onChanged: _value3Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: new Text('Subtitle'),
                secondary: new Icon(Icons.archive),
                activeColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

}