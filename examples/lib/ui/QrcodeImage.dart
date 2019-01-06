import "package:flutter/material.dart";
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(QrcodeImage());

class QrcodeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
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
      body: new Container(
        margin: EdgeInsets.only(top:100.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new QrImage(
                data: "1234567890",
                size: 200.0,
              ),
            ],
          ),
        )
      )
    );
  }
}