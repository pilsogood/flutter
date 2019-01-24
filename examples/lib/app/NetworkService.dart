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
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> _getMobileToken() async {
    final SharedPreferences prefs = await _prefs;
    // _tokenValue = prefs.getString(_storageMobileToken) ?? '';
      await Cookie.init();
    _tokenValue = Cookie.localStorage.getString(_storageMobileToken) ?? '';
    print(_tokenValue);
    return _tokenValue;
  }

  // Shared Preferences gset storage data
  Future<bool> _setMobileToken(String token) async {
    // final SharedPreferences prefs = await _prefs;
    await Cookie.init();
    Cookie.localStorage.setString(_storageMobileToken,token);

    // return prefs.setString(_storageMobileToken, token);
  }

  getMobileToken() {
    print(_tokenValue);
    return _tokenValue;
  }

  setMobileToken(String token) {
    return _setMobileToken(token);
  }

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

     _setMobileToken(_generateCookieHeader());
      headers['cookie'] = _generateCookieHeader();
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

  Future<dynamic> get(String url) {
    
    _getMobileToken();
    
    if(_tokenValue.isNotEmpty) {
      print("header begin get: $_tokenValue");
      headers['cookie'] = _tokenValue;
    }

    return http.get(url, headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      print("result get : $res");
      _updateCookie(response);

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }

      if(res == null){
        throw new Exception("Unexpected end of input");
      }

      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {body, encoding}) {
     
    _getMobileToken();
    
    if(_tokenValue.isNotEmpty) {
      print("header begin post: $_tokenValue");
      headers['cookie'] = _tokenValue;
    }

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

}

class Cookie {      
  static SharedPreferences localStorage;
  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }
}