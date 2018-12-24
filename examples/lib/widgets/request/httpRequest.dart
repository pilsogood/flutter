
import 'dart:async';
import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class HttpRequest extends StatefulWidget {
  @override
  _httpRequest createState() => _httpRequest();
}

class _httpRequest extends State<HttpRequest> {

  String httpUrl = "https://api.tripgrida.com/api/test/m";

  Future<String> getData() async {
    http.Response response = await http.get(
      Uri.encodeFull(httpUrl),
      headers: {
        "Accept": "application/json"
      }
    );

    List data = json.decode(response.body);
    int total = data.length;
    for(int i=0; i < total; i++){
      print(data[i]['name']);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new RaisedButton(
          child: new Text(
            "Get data",
            style: new TextStyle(
              color:Colors.deepOrange,
              fontStyle: FontStyle.italic,
              fontSize: 20.0
            ),
          ),
          onPressed: getData,
        ) 
      )
    );
  }
}