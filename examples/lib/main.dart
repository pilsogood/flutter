import 'package:flutter/material.dart';
import 'package:examples/routes/Routes.dart';
import 'package:examples/list/Category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Examples',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Category(),
      routes: routes,
    );
  }
}

