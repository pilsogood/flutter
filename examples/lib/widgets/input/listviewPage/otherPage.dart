import "package:flutter/material.dart";

class OtherPage extends StatelessWidget {
  final String title;
  OtherPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(title)
      ),
      body: Center(
        child: Text(title),
      )
    );
  }
}