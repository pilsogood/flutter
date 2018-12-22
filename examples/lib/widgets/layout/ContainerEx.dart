import "package:flutter/material.dart";

class ContainerEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("First APP"),
      ),
      body: Center(
        child: RaisedButton( 
          child: Text('Next page'),
          onPressed: () => Navigator.pushNamed(context, '/second'),
        ),
      )
    );
  }
}