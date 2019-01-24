import "package:flutter/material.dart";
import 'dart:convert';
import 'NetworkService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Session_page extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<Session_page> {

  String debugText = '';

  String _logInHost = "https://api.tripgrida.com/api/test/logIn";
  String _logOutHost = "https://api.tripgrida.com/api/test/logOut";
  String _logInfoHost = "https://api.tripgrida.com/api/test/logInfo";

  NetworkService network = new NetworkService();
  Cookie cookie = new Cookie();

  void _getStorage() {
    network.getMobileToken();
  }

  void  setDebugMessage(data) {
    setState(() {
      debugText = data;
    });
  }

  Future<dynamic>  _logInfo() async {
    var res = await network.get(_logInfoHost);
    if(res != null) {
      print(res['data']);
      setDebugMessage("info: ${res['data']['id']}");
    } else {
      setDebugMessage("empty");
    }
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
              SizedBox(height:25.0),
              Divider(),
              Text("${debugText}"),
              RaisedButton(
                child: Text(
                  "Log Info",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => _logInfo(),
              ),
            RaisedButton(
                child: Text(
                  "Get Storage",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => _getStorage(),
              ),
            ],
          ),
        )
      )
    );
  }
}