import 'dart:async';
import 'dart:io';
import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Https extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<Https> {

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
    return prefs.getString(_storageMobileToken) ?? '';
  }

  // Shared Preferences gset storage data
  Future<bool> _setMobileToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(_storageMobileToken, token);
  }

  // handshake 
  Future<String> handshake() async {
    String _status = "ERROR";

    return ajaxGet("handshake").then((String responseBody) async {
      Map response = json.decode(responseBody);
      _status = response['status'];
      switch (_status) {
        case "REQUIRES_AUTHENTICATION":
          await _setMobileToken(response["data"]);
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

  String host = "https://api.tripgrida.com/api/test/m";
  String _applicationId = "my_application_id";

  Future<String> ajaxGet(String serviceName) async {
    var responseBody = '{"data":"", "status":"NOK"}';
    
    try {
      var response = await http.get(host,
        headers: {
          'X-DEVICE-ID': await _getDeviceIdentity(),
          'X-TOKEN': await _getMobileToken(),
          'X-APP-ID': _applicationId
        }
      );

      if(response.statusCode == 200) {
        responseBody = response.body;
      }
    } catch (e) {
      throw new Exception("AJAX ERROR");
    }

    return responseBody;
  }

  Future<Map> ajaxPost(String serviceName, Map data) async {
    var responseBody = '{"data":"", "status":"NOK"}';

    try {
      var response = await http.post(host,
        body: json.encode(data),
        headers: {
          'X-DEVICE-ID': await _getDeviceIdentity(),
          'X-TOKEN': await _getMobileToken(),
          'X-APP-ID': _applicationId,
          'Content-Type' : 'application/json; charset=utf-8'
        }
      );
    
      if(response.statusCode == 200) {
        responseBody = response.body;

        if(responseBody["status"] == "TOKEN") {
          // await mid.setMo
        }

      }
    } catch(e) {
      throw new Exception("AJAX ERROR");
    }

    return responseBody;
  }


   void  setDebugMessage(data) {
     setState(() {
         debugText = data;
    });
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
              SizedBox(height:10.0),
              Text(debugText,
                style: TextStyle(
                  color:Colors.deepOrange,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0
              )),
              RaisedButton(
                child: Text(
                  "SharedPreferences",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: _getMobileToken,
              ),
              RaisedButton(
                child: Text(
                  "GET",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: _getDeviceIdentity,
              ),
              RaisedButton(
                child: Text(
                  "POST",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: _getDeviceIdentity,
              ),
              RaisedButton(
                child: Text(
                  "Handshake",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: handshake,
              )
              ],
            ),
        )
      )
    );
  }
}