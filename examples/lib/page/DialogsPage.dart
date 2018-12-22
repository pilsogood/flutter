import "package:flutter/material.dart";
import "package:examples/dialogs/Dialogs.dart";

class DialogsPage extends StatelessWidget {
  final Dialogs dialogs = new Dialogs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text("Dialogs Example"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => dialogs.information(context, "Information Dialog", "Information Dialog Content"),
                  child: new Text("Information Dialog"),
                ),
              ],  
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () async {
                    dialogs.wating(context, "Wating Dialog", "Wating Dialog Content");
                    await Future.delayed(Duration(seconds: 2));
                    Navigator.pop(context);
                  },
                  child: new Text("Wating Dialog"),
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => dialogs.confirm(context, "Confirm Dialog", "Confirm Dialog Content"),
                  child: new Text("Confirm Dialog"),
              ),
            ],  
          ),
        ]
      ),
    );
  }
}
