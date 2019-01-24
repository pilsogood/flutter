import "package:flutter/material.dart";
// import 'dart:async';
// import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/services.dart';
// import 'package:device_info/device_info.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

import 'NetworkService.dart';

import 'Session_page.dart';

class Session extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<Session> {


  String debugText = '';

  String _logInHost = "https://api.tripgrida.com/api/test/logIn";
  String _logOutHost = "https://api.tripgrida.com/api/test/logOut";
  String _logInfoHost = "https://api.tripgrida.com/api/test/logInfo";

  NetworkService network = new NetworkService();
  Cookie cookie = new Cookie();

  var _postData = {"id":"root", "password":"1234"};
  var _encode = Encoding.getByName("utf-8");
  
  void _getStorage() {
    network.getMobileToken();
  }

  void  setDebugMessage(data) {
    setState(() {
      debugText = data;
    });
  }

  Future<dynamic> _logIn() async {
    var res = await network.post(_logInHost, body: _postData, encoding: _encode);
    print(res);
    setDebugMessage(res['data']['id']);
    return res;
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

  Future<dynamic> _logOut() async {
    var res = await network.logOut(_logOutHost);
    // var res = await network.get(_logOutHost);
    // print(res);
    if(res != null) {
      setDebugMessage(res['data']);
      return res;
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
                  "Log In",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => _logIn(),
              ),
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
                  "Log Out",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => _logOut(),
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
              RaisedButton(
                child: Text(
                  "Move page",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new Session_page())),
              ),
            ],
          ),
        )
      )
    );
  }
}