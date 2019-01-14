import 'dart:async';
import 'dart:io';
import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Https extends StatefulWidget {

  List<User> users;
  Https({Key key, this.users}) : super(key: key);

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

    return ajaxGet().then((String responseBody) async {
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

  String getHost = "https://api.tripgrida.com/api/test/m";
  String postHost = "https://api.tripgrida.com/api/test/p";
  String _applicationId = "my_application_id";

  // var postData = {
  //   "homeTeam": {"team": "Team A"},
  //   "awayTeam": {"team": "Team B"}
  // };

  var postData = {"test":"tes"};

  Future<String> ajaxGet() async {
    var responseBody = '{"data":"", "status":"NOK"}';
    
    try {
      var response = await http.get(getHost,
        headers: {
          'X-DEVICE-ID': await _getDeviceIdentity(),
          'X-TOKEN': await _getMobileToken(),
          'X-APP-ID': _applicationId
        }
      );

      if(response.statusCode == 200) {
        responseBody = response.body;
        setDebugMessage(responseBody);
      }
    } catch (e) {
      throw new Exception("AJAX ERROR");
    }

    return responseBody;
  }

  Future<dynamic> ajaxPost(String postHost, var data) async {
    var responseBody =  json.decode('{"data":"", "status":"NOK"}');
    var body = utf8.encode(json.encode(data));

    try {
      var response = await http.post(Uri.encodeFull(postHost),
        body: body,
        headers: {
          'X-DEVICE-ID': await _getDeviceIdentity(),
          'X-TOKEN': await _getMobileToken(),
          'X-APP-ID': _applicationId,
          // 'Content-Type' : 'application/json; charset=utf-8'
        },
        //  encoding: Encoding.getByName("utf-8")
      );
    
      if(response.statusCode == 200) {
        responseBody = json.decode(response.body);
         print('json: ' + response.body);
          print('X-DEVICE-ID: ' + await _getDeviceIdentity());
          print('X-TOKEN: ' + await _getMobileToken() );
          print('X-APP-ID: ' + _applicationId );
          print('Status: ' + responseBody["status"] );
          
          Map<String, dynamic>  data = json.decode(response.body);
          print('data: ' + data["data"]["test"] );

          // if(responseBody["status"] == "TOKEN") {
          //   setDebugMessage(data["test"]);
          //   await _setMobileToken(data["test"]);
          // }
      }
    } catch(e) {
      throw new Exception("AJAX ERROR");
    }

    return responseBody;
  }



var data;
Future getImageUrl() async {
  // This is how http calls are done in flutter:
  HttpClient http = HttpClient();
  try {
    // Use darts Uri builder
    var uri = Uri.http('api.tripgrida.com', '/api/test/p');
    var request = await http.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    // The dog.ceo API returns a JSON object with a property
    // called 'message', which actually is the URL.
    data = json.decode(responseBody);
    print(data);
    return data;
  } catch (exception) {
    print(exception);
  }
}


Future _postData() async {

  var responseBody;
  var body = json.encode(postData);
  var users = [];
  
  try {
   await http.post(
      Uri.encodeFull(postHost), 
      body: body,
      headers: {
          'X-DEVICE-ID': await _getDeviceIdentity(),
          'X-TOKEN': await _getMobileToken(),
          'X-APP-ID': _applicationId,
          'Content-Type' : 'application/json; charset=utf-8'
      },
     ).then((response) {

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if(response.statusCode == 200) {
      // responseBody = json.decode(response.body);
      // Map<String, dynamic> data = json.decode(response.body);
      // List _list = data['data'];
      
      // if(data['status'] == 'TOKEN') {
      //   int total = _list.length;
      //   for(int s=0; s < total; s++) {
      //     print(_list[s]['name']);
      //   }
        // setDebugMessage(data['data']['test']);
      // }

      responseBody = json.decode(response.body);

      
      var _list = responseBody['data'] as List;
      List<User> users = _list.map((f) => User.fromJson(f)).toList();

      for(int i = 0; i < users.length; i++){
         users.add(users[i]);
      }

      return users;
    }
  });
  } catch(e) {
    throw new Exception("AJAX ERROR");
  }
}


  void jsonS() {
    var jsonString = '{"status":"TOKEN","data":{"test":"tes"}}';
    Map<String, dynamic> data = jsonDecode(jsonString);
    print("${data['data']['test']}");
  }



   void  setDebugMessage(data) {
     setState(() {
         debugText = data;
    });
   }

  final _users_add = [];

  @override
  Widget build(BuildContext context) {


    var futureBuilder = new FutureBuilder(
      future: _postData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: new Text("DatePicker Example"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              SizedBox(height:10.0),
              // Text(debugText,
              //   style: TextStyle(
              //     color:Colors.deepOrange,
              //     fontStyle: FontStyle.italic,
              //     fontSize: 20.0
              // )),
              // RaisedButton(
              //   child: Text(
              //     "SharedPreferences",
              //     style: TextStyle(
              //       color:Colors.deepOrange,
              //       fontStyle: FontStyle.italic,
              //       fontSize: 18.0
              //     ),
              //   ),
              //   onPressed: _getMobileToken,
              // ),
              // RaisedButton(
              //   child: Text(
              //     "GET",
              //     style: TextStyle(
              //       color:Colors.deepOrange,
              //       fontStyle: FontStyle.italic,
              //       fontSize: 18.0
              //     ),
              //   ),
              //   onPressed: ajaxGet,
              // ),
              // RaisedButton(
              //   child: Text(
              //     "POST1",
              //     style: TextStyle(
              //       color:Colors.deepOrange,
              //       fontStyle: FontStyle.italic,
              //       fontSize: 18.0
              //     ),
              //   ),
              //   // onPressed: () => ajaxPost(postHost, postData),
              //   onPressed: () => ajaxPost(postHost, postData),
              // ),
              RaisedButton(
                child: Text(
                  "POST2",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                // onPressed: () => ajaxPost(postHost, postData),
                onPressed:  _postData,
              ),
              // RaisedButton(
              //   child: Text(
              //     "Handshake",
              //     style: TextStyle(
              //       color:Colors.deepOrange,
              //       fontStyle: FontStyle.italic,
              //       fontSize: 18.0
              //     ),
              //   ),
              //   onPressed: handshake,
              // ),
              // RaisedButton(
              //   child: Text(
              //     "JSON",
              //     style: TextStyle(
              //       color:Colors.deepOrange,
              //       fontStyle: FontStyle.italic,
              //       fontSize: 18.0
              //     ),
              //   ),
              //   onPressed: jsonS,
              // )
              futureBuilder
              ],
            ),
        )
      )
    );
  }
}


    Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
      List<String> values = snapshot.data;
      return new ListView.builder(
          itemCount: values.length,
          itemBuilder: (BuildContext context, int index) {
            return new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(values[index]),
                ),
                new Divider(height: 2.0,),
              ],
            );
          },
      );

    }


class JsonData {
  final String status;
  List<User> data;

  JsonData({
    this.status,
    this.data
  });

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data': data
  };

  factory JsonData.fromJson(Map<String, dynamic> json ){
    var _list = json['data'] as List;
    List<User> users = _list.map((f) => User.fromJson(f)).toList();
 
    return new JsonData(
      status: json['status'],
      data: users
    );
  }
}

Widget _buildRow(User data) {
    return new ListTile(
      title: new Text(data.name),
    );
  }

class User {
  final int num;
  final String name;
  final int age;
  final String country;

  User({
    this.num,
    this.name,
    this.age,
    this.country
  });

  Map<String, dynamic> toJson() => {
      'num': num,
      'name': name,
      'age': age,
      'country': country
  };

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      num: json['num'],
      name: json['name'],
      age: json['age'],
      country: json['country'],
    );
  }
}