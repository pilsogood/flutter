import "package:flutter/material.dart";

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Second APP"),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            RaisedButton( 
              child: Text('Prev page'),
              // onPressed: () => Navigator.pushNamed(context, '/loader'),
              onPressed: () => Navigator.pop(context),
            ),
            RaisedButton( 
              child: Text('Loader'),
              onPressed: () => Navigator.pushNamed(context, '/loader'),
              // onPressed: () => Navigator.pop(context),
            ),
            RaisedButton( 
              child: Text('Home page2'),
              onPressed: () { 
                Navigator.of(context).pushNamed('/home');
              }
            ),    
          ],
        )
      )
    );
  }
}