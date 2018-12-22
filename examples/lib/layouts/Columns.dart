import "package:flutter/material.dart";

class Columns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Columns Example"),
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
