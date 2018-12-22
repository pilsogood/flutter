import "package:flutter/material.dart";
import "package:example/loader/Loader.dart";

class LoaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Loader Example"),
      ),
      body: Center(
        child: Loader()
      )
    );
  }
}