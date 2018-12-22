import 'package:flutter/material.dart';
import 'package:example/routes/Routes.dart';
import 'package:example/list/Category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Category(),
      routes: routes,
    );
  }
}

