import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String _token;
String _tokenValue = '';

class Preferences {      
  static SharedPreferences localStorage;
  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }
}

class SessionService {

  Preferences preferences = new Preferences();

  Map<String, String> headers = {"content-type": "text/json"};
  Map<String, String> cookies = {};

  Future<String> getToken(String tokenName,) async {
    await Preferences.init();
    _tokenValue = Preferences.localStorage.getString(tokenName) ?? '';
    return _tokenValue;
  }

  // Shared Preferences gset storage data
  Future<bool> setToken(String tokenName, String tokenValue) async {
    await Preferences.init();
    Preferences.localStorage.setString(tokenName, tokenValue);
    return true;
  }

   // Shared Preferences gset storage data
  Future<bool> delMobileToken(String tokenName) async {
    await Preferences.init();
    Preferences.localStorage.setString(tokenName, '');
    return true;
  }

  void updateCookie(http.Response response) {
    String allSetCookie = response.headers['set-cookie'];

    if (allSetCookie != null) {

      var setCookies = allSetCookie.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      var _header = _generateCookieHeader();
      
      setToken('cookie', _header);
      headers['cookie'] = _header;
    }
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.length > 0) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

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

}

