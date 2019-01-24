import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String _token;
String _tokenValue = '';
class NetworkService {

  Cookie cookie = new Cookie();

  Future<bool> start() async {
    await Cookie.init();
    Cookie.localStorage.setString('userName','Bob');
    print('User name is: ${Cookie.localStorage.getString('userName')}');  //prints 'Bob'
  }

  final JsonDecoder _decoder = new JsonDecoder();
  final JsonEncoder _encoder = new JsonEncoder();

  Map<String, String> headers = {"content-type": "text/json"};
  Map<String, String> cookies = {};

  String _storageMobileToken ="token";
  String _storagePhpsessid ="sessid";

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> _getMobileToken() async {
    final SharedPreferences prefs = await _prefs;
    // _tokenValue = prefs.getString(_storageMobileToken) ?? '';
    await Cookie.init();
    _tokenValue = Cookie.localStorage.getString(_storageMobileToken) ?? '';
    print("Get Token: $_tokenValue");
    return _tokenValue;
  }

  // Shared Preferences gset storage data
  Future<bool> _setMobileToken(String token) async {
    // final SharedPreferences prefs = await _prefs;
    await Cookie.init();
    Cookie.localStorage.setString(_storageMobileToken,token);

    // return prefs.setString(_storageMobileToken, token);
  }

   // Shared Preferences gset storage data
  Future<bool> _delMobileToken() async {
    await Cookie.init();
    Cookie.localStorage.setString(_storageMobileToken, '');
  }

  getMobileToken() {
    _getMobileToken().then((value){
      print("getMobileToken: $value");
    });
  }

  setMobileToken(String token) {
    return _setMobileToken(token);
  }

  void _updateCookie(http.Response response) {
    String allSetCookie = response.headers['set-cookie'];

    if (allSetCookie != null) {

      var setCookies = allSetCookie.split(',');

      print("============================================================");
      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }
      print("============================================================");

      var _haeder = _generateCookieHeader();
      
      print("END SESSION: $_haeder");

      _setMobileToken(_haeder);
      headers['cookie'] = _haeder;
    }
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.length > 0) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        print("$key : $value");

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

  logOut(String host) {
    var result = this.get(host);
    if(result != null) {
      this._delMobileToken();
      return result;
    }
  }

  Future<dynamic> get(String url) {
    
    var result = null;

    _getMobileToken().then((value){
      print("header begin get: $value");
      headers['cookie'] = value;
    });

    return http.get(url, headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      // print("result get : $res");
      // _updateCookie(response);

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

    _getMobileToken().then((value){
      print("header begin get: $value");
      headers['cookie'] = value;
    });

    return http
        .post(url, body: _encoder.convert(body), headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      
      _updateCookie(response);

      if (statusCode < 200 || statusCode > 400 || json == null || res.isEmpty || res == null) {
        // throw new Exception("Error while fetching data");
        print("Error while fetching data");
      } else {
        result = _decoder.convert(res);
      }

      return result;

    });
  }

}

class Cookie {      
  static SharedPreferences localStorage;
  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }
}