import "package:flutter/material.dart";

class SimpleDialogEx extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

enum Answers{YES,NO,MAYBE}

class _AppStatus extends State<SimpleDialogEx> {

  String _value = '';
  void _setValue(String value) => setState(() => _value = value);

  Future _askUser() async {
    switch(
      await showDialog(
        context: context,
        child: new SimpleDialog(
            title: new Text('do you like flutter?'),
            children: <Widget>[
              new SimpleDialogOption(child: new Text('Yes!!'), onPressed: () { Navigator.pop(context, Answers.YES);},),
              new SimpleDialogOption(child: new Text('No!!'), onPressed: () { Navigator.pop(context, Answers.NO);},),
              new SimpleDialogOption(child: new Text('Maybe!!'), onPressed: () { Navigator.pop(context, Answers.MAYBE);},),
            ],
          ) 
        )
      ) {
        case Answers.YES:
          _setValue('YES');
          break;
        case Answers.NO:
          _setValue('NO');
          break;
        case Answers.MAYBE:
          _setValue('MAYBE');
          break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("BottomSheets Example"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(_value),
              new RaisedButton(onPressed: _askUser, child: new Text('Click me'),)
            ],
          ),
        )
      ),
    );
  }
}