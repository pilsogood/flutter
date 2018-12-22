import "package:flutter/material.dart";
import "package:examples/menu/CustomAppBar.dart";

class CustomAppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        children: <Widget>[
          new CustomAppBar('test')
        ]
      )
    );
  }
}