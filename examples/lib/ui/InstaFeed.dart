import "package:flutter/material.dart";

void main() => runApp(InstaFeed());

class InstaFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.transparent,
      ),
      home: MyHomePage(title: 'Instagram Clone'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.title,
            ),
          ],
        ),

        leading: new IconButton(
          icon: new Icon(Icons.accessibility), onPressed: () {},
        ),
        actions: [
          new IconButton(icon: new Icon(Icons.add), onPressed: () => {}),
          new IconButton(icon: new Icon(Icons.remove), onPressed:  () => {}),
        ],
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[

            ],
          ),
        )
      )
    );
  }
}