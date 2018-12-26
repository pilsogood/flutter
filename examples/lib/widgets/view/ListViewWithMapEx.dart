
import 'dart:async';
import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class ListViewMapEx extends StatefulWidget {
  @override
  _ListViewExt createState() => _ListViewExt();
}

class _ListViewExt extends State<ListViewMapEx> {

  String httpUrl = "https://api.tripgrida.com/api/test/m";
  List data; 

  Future<String> getData() async {
    http.Response response = await http.get(
      Uri.encodeFull(httpUrl),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState((){
        data = json.decode(response.body);
    });

    return "success!";    
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("ListView Example"), 
        backgroundColor:Colors.deepOrange
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 :data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Text(data[index]['name']),
          );
        },
      )
    );
  }
}