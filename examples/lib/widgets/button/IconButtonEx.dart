import "package:flutter/material.dart";

class IconButtonEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Icon Button Example"),
      ),
      body: Center(
        child: new IconButton(
            icon: const Icon(Icons.insert_emoticon),
            onPressed:iconButtonPressed,
            iconSize: 48.0,
            color: const Color(0xFF000000), 
          ),
      )
    );
  }
  void iconButtonPressed(){}
}