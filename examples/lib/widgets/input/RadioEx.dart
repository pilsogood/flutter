import "package:flutter/material.dart";

class RadioEx extends StatefulWidget {
  @override
  _RadioEx createState() => _RadioEx();
}

class _RadioEx extends State<RadioEx> {

  int _value1 = 0;
  int _value2 = 0;

  void _radio1Changed(int value) => setState(() =>_value1 = value);
  void _radio2Changed(int value) => setState(() =>_value2 = value);

  Widget makeRadios() {
    List<Widget> list = new List<Widget>();

    for(int i=0; i<3; i++) {
      list.add(new Radio(value: i,groupValue: _value1,onChanged: _radio1Changed));
    }

    Row column = new Row(
     children: list
    );
   return column;
  }

  Widget makeRadioTiles() {
    List<Widget> list = new List<Widget>();

    for(int i=0; i<3; i++) {
      list.add(new RadioListTile(
          value: i,
          groupValue: _value2,
          onChanged: _radio2Changed,
          activeColor: Colors.orange,
          controlAffinity: ListTileControlAffinity.trailing,
          title: new Text('Items: '),
          subtitle: new Text('Sub Title'),
        )
      );
    }

    Column column = new Column(
     children: list
    );
   return column;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Radio Example"),
      ),
      body: Center(
       child: Column(
          children: <Widget>[
            makeRadios(),
            makeRadioTiles(),
          ]
        ),
      )
    );
  }
}