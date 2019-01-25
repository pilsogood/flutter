import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'SessionService.dart';

class NetworkService {

  SessionService session = new SessionService();

  var _sessionId = 'cookie';

  final JsonDecoder _decoder = new JsonDecoder();
  final JsonEncoder _encoder = new JsonEncoder();

  Map<String, String> headers = {"content-type": "text/json"};

  final _encode = Encoding.getByName("utf-8");

  String _logInHost = "https://api.tripgrida.com/api/test/logIn";
  String _logOutHost = "https://api.tripgrida.com/api/test/logOut";
  String _logInfoHost = "https://api.tripgrida.com/api/test/logInfo";


  Future<dynamic> get(String url) async {
    
    var result = null;

    await session.getToken(_sessionId).then((value){
      headers['cookie'] = value;
    });

    return http.get(url, headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null || res.isEmpty || res == null) {
        // throw new Exception("Error while fetching data");
        print("Error while fetching data");
      } else {
        result = _decoder.convert(res);
      }

      return result;
    });
  }
 
  Future<dynamic> post(String url, {body, encoding}) {
     
     var result = null;

    session.getToken(_sessionId).then((value){
      headers['cookie'] = value;
    });

    return http
        .post(url, body: _encoder.convert(body), headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      
      session.updateCookie(response);

      if (statusCode < 200 || statusCode > 400 || json == null || res.isEmpty || res == null) {
        // throw new Exception("Error while fetching data");
        print("Error while fetching data");
      } else {
        result = _decoder.convert(res);
      }

      return result;

    });
  }


  // network method 


  Future<dynamic> logIn(body) async {
    var res = await post(_logInHost, body: body, encoding: _encode);
    return res;
  }

  Future<dynamic> logInfo() async {
    var res = await get(_logInfoHost);
     return res;
  }

  Future<dynamic> logOut() async {
    var res = await get(_logOutHost);
    session.delMobileToken(_sessionId);
    return res;
  }

}

