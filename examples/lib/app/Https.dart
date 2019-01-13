import "package:flutter/material.dart";
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


class Https extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<Https> {

  // var response = await http.get('https://www.myserver.com/api/mobile/handshake',
	// 			headers: {
	// 			  'X-DEVICE-ID': 'my_device_id',
	// 			  'X-TOKEN': '',
	// 			  'X-APP-ID': 'my_application_id'
	// 			});
				
  // if (response.statusCode == 200) {
  //   String token = response.body;
  // }


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

            ],
          ),
        )
      )
    );
  }
}