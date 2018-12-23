import "package:flutter/material.dart";

class TextEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Text Examples"),
      ),
      body: Center(
        child: 
        Text(
          "I'm Text ",
          style: new TextStyle(
            fontFamily: "Roboto",
            fontSize: 15.0,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          )
        ),
      )
    );
  }
}