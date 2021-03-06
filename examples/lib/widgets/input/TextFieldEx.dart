import "package:flutter/material.dart";

class TextFieldEx extends StatefulWidget {
  @override
  _TextFieldEx createState() => _TextFieldEx();
}
class _TextFieldEx extends State<TextFieldEx> {
  final myController = TextEditingController();
  String _value = '';
  
  void _onChanged(String value) { setState((){_value = "Changed:" +  value;});}
  void _onSubmit(String value) { setState((){_value = "Sumit:" + value; myController.text = '';});}

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("TextField Example"),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            Text('${_value}'),
            TextField(
              controller: myController,
              decoration: new InputDecoration(
                labelText: 'Input1',
                hintText: 'Hint1',
                icon: Icon(Icons.people)
              ),
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.text,
              onChanged: _onChanged,
              onSubmitted: _onSubmit,
            ),
            TextField(
              decoration: new InputDecoration(
                labelText: 'Input2',
                hintText: 'Hint2',
                icon: Icon(Icons.access_alarm)
              ),
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.number,
              onChanged: (String value){
                  setState(() {
                     _value = value;                  
                  });
              },
              onSubmitted: _onSubmit,
            ),
            IconButton(icon: new Icon(Icons.add_circle_outline),onPressed: () => _onSubmit(myController.text),),
          ],
        )
      )
    );
  }
}