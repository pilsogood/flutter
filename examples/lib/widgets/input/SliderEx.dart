import "package:flutter/material.dart";

class SliderEx extends StatefulWidget {
  @override
  _SliderEx createState() => _SliderEx();
}

class _SliderEx extends State<SliderEx> {

  double _value = 0.0;
  void _setValue(double value) => setState(() => _value=value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Slider Example"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              new Text("Value: ${(_value * 100).round()}"),
              new Slider(value:_value,onChanged: _setValue,)
            ],            
          ),
        ),
      )
    );
  }
}