import 'package:flutter/material.dart';
import 'Dialogs.dart';
// import 'dart:async';

class DialogActionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TITLE',
      theme: ThemeData(
        primarySwatch:  Colors.blue,
      ),
      home: new DialogAction(),
    );
  }
}

class DialogAction extends StatefulWidget {
  DialogAction({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DialogActionState createState() => _DialogActionState();
}

class _DialogActionState extends State<DialogAction> {
  Dialogs dialogs = new Dialogs();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                // onPressed: () => dialogs.information(context, "This", "Content"),
                onPressed: () {

                },
                child: new Text("Information TItle"),
              ),
            ],  
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     RaisedButton(
          //       onPressed: () async {
          //         dialogs.wating(context, "This", "Content");
          //         await Future.delayed(Duration(seconds: 2));
          //         Navigator.pop(context);
          //       },
          //       child: new Text("Wating TItle"),
          //     ),
          //   ]
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     RaisedButton(
          //       onPressed: () => dialogs.confirm(context, "This", "Content"),
          //       child: new Text("Confirm TItle"),
          //     ),
          //   ],  
          // ),
        ],
      ),
    );
  }
}