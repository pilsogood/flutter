import "package:flutter/material.dart";

class ScaffoldEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Scaffold Example"),
      ),
      body: new Text('Scaffold page'),
    );
  }
}