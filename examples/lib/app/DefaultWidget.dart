import "package:flutter/material.dart";

class DatePickerEx extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<DatePickerEx> {
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

            ],
          ),
        )
      )
    );
  }
}