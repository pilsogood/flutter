import "package:flutter/material.dart";

// import 'package:qrcode_reader/qrcode_reader.dart';
// import 'dart:async';

void main() => runApp(QrcodeScan());

class QrcodeScan extends StatelessWidget {
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
  Future<String> _barcodeString;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('QRCode Reader Example'),
      ),
      body: new Column(
          children: <Widget>[
            new Center(
              child: new FutureBuilder<String>(
                  future: _barcodeString,
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return new Text(snapshot.data != null ? snapshot.data : '');
                  }
                )
              ),
          ],
        ),

      // floatingActionButton: new FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _barcodeString = new QRCodeReader()
      //           .setAutoFocusIntervalInMs(200)
      //           .setForceAutoFocus(true)
      //           .setTorchEnabled(true)
      //           .setHandlePermissions(true)
      //           .setExecuteAfterPermissionGranted(true)
      //           .scan();
      //     });
      //   },
      //   tooltip: 'Reader the QRCode',
      //   child: new Icon(Icons.add_a_photo),
      // ),
    );
  }


}