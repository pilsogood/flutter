import "package:flutter/material.dart";

class SettingsDetailPage extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}


class _AppStatus extends State<SettingsDetailPage> {
  
  bool _value1 = false;
  bool _value2 = false;

  void _onChanged1(bool value) => setState(() => _value1 = value);
  void _onChanged2(bool value) => setState(() => _value2 = value);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: new Text("Settings"),
      ),
      body: new Container(
        padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
        child: new ListView(
          children: <Widget>[
            _title(context,"기본설정"),
            _checkBox(context,"설정",_value1,_onChanged1),
            _checkBox(context,"옵션",_value2,_onChanged2),
            _checkBox(context,"옵션",_value2,_onChanged2),
            _checkBox(context,"옵션",_value2,_onChanged2),
            _checkBox(context,"옵션",_value2,_onChanged2),
            _checkBox(context,"옵션",_value2,_onChanged2),
            _checkBox(context,"옵션",_value2,_onChanged2),
            _checkBox(context,"옵션",_value2,_onChanged2),
            _checkBox(context,"옵션",_value2,_onChanged2),
            _checkBox(context,"옵션",_value2,_onChanged2),
          ]
        ),
      ),
    );
  }
}

Widget _title(context,title) {
  return new 
  Container(
    padding: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 0.5,
        ),
      ),
    ),
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          title,
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 12.0
          )
        ) 
      ],              
    )
  );
}

Widget _checkBox(context,title,value,event) {
  return new 
  Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 0.5,
        ),
      ),
    ),
    child:SwitchListTile(
      value: value,
      onChanged: event,
      title: new Text(
        title,
        style: new TextStyle(
        //  fontWeight: FontWeight.bold,
          color: Colors.black
      )               
      )
    ),
  );
}