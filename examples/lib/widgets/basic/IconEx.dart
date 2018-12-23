import "package:flutter/material.dart";

class IconEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Icon Example"),
      ),
      body: Center(
        child: new Icon(
          Icons.add,
          color: Colors.lime,
          // color: const Color(0xFF10104f),
          size: 50.0,
        )
      )
    );
  }
}