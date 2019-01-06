import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() => runApp(QrcodeScan2());

class QrcodeScan2 extends StatelessWidget {
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
  
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      body: Column(
        children: <Widget>[
          new Expanded(
            child: 
            new Stack(
              children: <Widget>[
                QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
                new Center(
                 child: new Container(
                    margin: new EdgeInsets.all(50.0),
                    height:259.0,
                    width: 250.0,
                    color: Color.fromRGBO(255, 255, 255, 0.2)
                  )
                )
              ],
            ),
            flex: 4,
          ),
          Expanded(
            child: Text("This is the result of scan: $qrText"),
            flex: 1,
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    final channel = controller.channel;
    controller.init(qrKey);
    channel.setMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case "onRecognizeQR":
          dynamic arguments = call.arguments;
          setState(() {
            qrText = arguments.toString();
          });
      }
    });
  }

}



