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

  final JsonDecoder _decoder = new JsonDecoder();
  final JsonEncoder _encoder = new JsonEncoder();

  Map<String, String> headers = {"content-type": "text/json"};
  Map<String, String> cookies = {};

  void _updateCookie(http.Response response) {
    String allSetCookie = response.headers['set-cookie'];

    if (allSetCookie != null) {

      var setCookies = allSetCookie.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      headers['cookie'] = _generateCookieHeader();
    }
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.length > 0) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires')
          return;

        this.cookies[key] = value;
      }
    }
  }

  String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.length > 0)
        cookie += ";";
      cookie += key + "=" + cookies[key];
    }

    return cookie;
  }

  Future<dynamic> get(String url) {
    return http.get(url, headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      _updateCookie(response);

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {body, encoding}) {
    return http
        .post(url, body: _encoder.convert(body), headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      _updateCookie(response);

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }
  
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
    return prefs.getString(_storageMobileToken) ?? 'token';
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
          await _setMobileToken(response["data"]["Cookie"]);
          setDebugMessage(response["data"]["Cookie"]);
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
    var headers;

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

      // print(response.body);
      var jsonData = json.decode(response.body);
      var usersData = jsonData["data"];

      responseBody = response.body;
      headers = response.headers;
      setState(() {
      _setMobileToken(headers['set-cookie']);
      });
      print(headers['set-cookie']);
      // setDebugMessage(headers);

     });

    return responseBody;
  }

  String sessionHost = "https://api.tripgrida.com/api/test/sessionGet";
  Future<String> ajaxGet() async {
    var responseBody = '{"data":"", "status":"NOK"}';
    var headers;

    var postData = {"id":"root", "password":"1234"};
    var body = json.encode(postData);
    String cookie = await _getMobileToken();
     print(cookie);

    await http.post(
      Uri.encodeFull(sessionHost), 
      body: body,
      headers: {
          // 'X-DEVICE-ID': await _getDeviceIdentity(),
          // 'X-TOKEN': await _getMobileToken(),
          // 'X-APP-ID': _applicationId,
          'Cookie' : cookie,
          'Content-Type' : 'application/json; charset=utf-8'
        },
      ).then((response) {

      print(response.statusCode);
      print(response.body);

      if (response.statusCode < 200 || response.statusCode > 400 || json == null || response.body.isEmpty) {
        return;
      }

      // var jsonData = json.decode(response.body);
      // var status = jsonData["status"];

      // responseBody = response.body;
      // headers = response.headers;
      // print("================");
      // print(headers);
      // print(cookie);
      // print(status);
      // setDebugMessage(headers);

     });

    return responseBody;
  }


  void  setDebugMessage(data) {
    setState(() {
      // debugText = data;
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
                  "Session Check",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => ajaxGet(),
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