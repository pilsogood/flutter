import "package:flutter/material.dart";
import 'package:examples/app/SettingsDetailPage.dart';
import 'package:examples/app/SettingsSearchPage.dart';

class SettingsPage extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}


class _AppStatus extends State<SettingsPage> {
  
  bool _alreadySaved = false;
  
  final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();
  void _showBottom() {
    _scaffoldstate.currentState.showSnackBar(new SnackBar(content: new Text('Hello world')));
  }

  @override
  Widget build(BuildContext context) {
  
    void _clicked(Choice choice) {
       setState(() {
          print("$choice");
       });
    }

    void _onChanged() { 
      setState(() {
        if(_alreadySaved == false) {
          _alreadySaved = true;
        } else {
          _alreadySaved = false;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: new Text("Settings"),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new SettingsSearchPage()))
          ),
          PopupMenuButton<Choice>(
            onSelected: _clicked,
            itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
            },
          )
        ]
      ),
      body: new Container(
        padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
        child: new ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
              onTap: () => _onChanged(),
              trailing: new Container(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                child:  new Icon(
                (_alreadySaved == true) ? Icons.favorite : Icons.favorite_border,
                color: (_alreadySaved == true) ? Colors.red: null,
              )
              )
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => new SettingsDetailPage())),
              trailing: Text('CLICK'),
            ),
            Divider(),
            ],
          ),
        ),
      );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice> [
  const Choice(title: "menu1", icon: Icons.search),
  const Choice(title: "menu2", icon: Icons.security),
];