import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

void main() => runApp(new Https());

class Https extends StatefulWidget {
  @override
  AppStatus createState() => AppStatus();
}

class AppStatus extends State<Https> {

  var cacheddata = new Map<int, Data>();
  var offsetLoaded = new Map<int, bool>();

  int _total = 0;

  @override
  void initState() {
    _getTotal().then((int total) {
      setState(() {
        _total = total;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var listView = new ListView.builder(
        itemCount: _total,
        itemBuilder: (BuildContext context, int index) {
          Data data = _getData(index);
          return new ListTile(
            title: new Text(data.value),
          );
        }
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Request Test"),
      ),
      body: listView,
    );
  }

  Future<List<Data>> _getDatas(int offset, int limit) async {

    String jsonString = await _getJson(offset, limit);
    List list = json.decode(jsonString) as List;

    var datas = new List<Data>();
    list.forEach((element) {
      Map map = element as Map;
      datas.add(new Data.fromMap(map));
    });

    return datas;
  }

  Future<String> _getJson(int offset, int limit) async {
    String json = "[";

    for (int i= offset; i < offset + limit; i++) {
      String id = i.toString();
      String value = "value ($id)";
      json += '{ "id":"$id", "value":"$value" }';
      if (i < offset + limit - 1) {
        json += ",";
      }
    }

    json += "]";

    await new Future.delayed(new Duration(seconds: 1));

    return json;
  }


  Data _getData(int index) {
    Data data = cacheddata[index];
    if (data == null) {
      int offset = index ~/ 5 * 5;
      if (!offsetLoaded.containsKey(offset)) {
        offsetLoaded.putIfAbsent(offset, () => true);
        _getDatas(offset, 5)
            .then((List<Data> datas) => _updateDatas(offset, datas));
      }
      data = new Data.loading();
    }

    return data;
  }

  Future<int> _getTotal() async {
    return 1000;
  }

  void _updateDatas(int offset, List<Data> datas) {
    setState((){
      for (int i=0; i < datas.length; i++) {
        cacheddata.putIfAbsent(offset + i, () => datas[i]);
      }
    });
  }
}

class Data {
  String id;
  String value;

  Data.loading() {
    value = "Loading...";
  }

  Data.fromMap(Map map) {
    id = map['id'];
    value = map['value'];
  }
}