import "package:flutter/material.dart";
import 'package:examples/ui/movie/api.dart';

import 'package:examples/ui/movie/detail.dart';

void main () => runApp(Movies());

class Movies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TITLE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.purple
      ),
      home: Detail(datas)
    );
  }
}