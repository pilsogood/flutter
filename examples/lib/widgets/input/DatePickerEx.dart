import "package:flutter/material.dart";
import "dart:async";

class DatePickerEx extends StatefulWidget {
  @override
  _DatePickerEx createState() => _DatePickerEx();
}

class _DatePickerEx extends State<DatePickerEx> {

  String _value = '';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2019)
    );
    if(picked != null) setState(() { _value = picked.toString();});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("DatePicker Example"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(_value),
              new RaisedButton(
                onPressed: _selectDate,
                child: new Text("Click!")
              )
            ],
          ),
        )
      )
    );
  }
}