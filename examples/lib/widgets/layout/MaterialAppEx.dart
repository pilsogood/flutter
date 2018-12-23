import "package:flutter/material.dart";
import "package:examples/widgets/layout/ScaffoldEx.dart";

class MaterialAppEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: ScaffoldEx(),
        // routes: ,
    );
  }
}