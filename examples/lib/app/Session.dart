import "package:flutter/material.dart";
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Session extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<Session> {
  String debugText = '';
  String _deviceIdentity = "";
  final DeviceInfoPlugin _deviceInfoPlugin = new DeviceInfoPlugin();

  // check device identity
  Future<String> _getDeviceIdentity() async {
    if(_deviceIdentity == '') {
      try {
        if(Platform.isAndroid) {
          AndroidDeviceInfo info = await _deviceInfoPlugin.androidInfo;
          _deviceIdentity = "DEVICE: ${info.device}, ID: ${info.id}";
        } else if(Platform.isIOS) {
          IosDeviceInfo info = await _deviceInfoPlugin.iosInfo;
          _deviceIdentity = "MODEL: ${info.model}, ID: ${info.identifierForVendor}";
        }
      } on PlatformException {
        _deviceIdentity = "unknown";
      }
    }
    setDebugMessage(_deviceIdentity);
    return _deviceIdentity;
  }

  // Shared Preferences get storage data
  String _storageMobileToken ="token";
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> _getMobileToken() async {
    final SharedPreferences prefs = await _prefs;
    String re = prefs.getString(_storageMobileToken) ?? '';
    setDebugMessage(re);
    return re;
  }

  // Shared Preferences gset storage data
  Future<bool> _setMobileToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(_storageMobileToken, token);
  }

  // handshake 
  Future<String> handshake() async {
    String _status = "ERROR";

    return ajaxPost().then((String responseBody) async {
      Map response = json.decode(responseBody);
      _status = response['status'];
      switch (_status) {
        case "TOKEN":
          await _setMobileToken(response["data"]["X-Device-Id"]);
          setDebugMessage(response["data"]);
        break;
        case "REQUIRES_AUTHENTICATION":
          await _setMobileToken(response["data"]);
          setDebugMessage(response["data"]);
        break;
        case "INVALID":
          await _setMobileToken("");
        break;
      }
      return _status;
    }).catchError(() {
      return "ERROR";
    });
  }

  String host = "https://api.tripgrida.com/api/test/session";
  String _applicationId = "my_application_id";

  var postData = {"id":"root", "password":"1234"};

  Future<String> ajaxPost() async {
    var responseBody = '{"data":"", "status":"NOK"}';
    
    var body = json.encode(postData);
    await http.post(
      Uri.encodeFull(host), 
      body: body,
      headers: {
          'X-DEVICE-ID': await _getDeviceIdentity(),
          'X-TOKEN': await _getMobileToken(),
          'X-APP-ID': _applicationId,
          'Content-Type' : 'application/json; charset=utf-8'
      },
     ).then((response) {

      if (response.statusCode < 200 || response.statusCode > 400 || json == null || response.body.isEmpty) {
        return;
      }

       print(response.body);
       var jsonData = json.decode(response.body);
       var usersData = jsonData["data"];

       responseBody = response.body;
       setDebugMessage(responseBody);

     });

    return responseBody;
  }


  void  setDebugMessage(data) {
    setState(() {
      debugText = data;
    });
  }


  void _getInfo() {

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
              Text("${debugText}"),
              Divider(),
              RaisedButton(
                child: Text(
                  "GET INFO",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed:  _getDeviceIdentity,
              ),
              RaisedButton(
                child: Text(
                  "AJAX",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => ajaxPost(),
              ),
              RaisedButton(
                child: Text(
                  "SET TOKEN",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => handshake(),
              ),
              RaisedButton(
                child: Text(
                  "GET TOKEN",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => _getMobileToken(),
              ),
            ],
          ),
        )
      )
    );
  }
}