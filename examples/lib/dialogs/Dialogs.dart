import "package:flutter/material.dart";

class Dialogs{
  information(BuildContext context, String title, String description) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text(description)
              ],
            )
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: new Text('OK')
              )
          ]
        );
      }
    );
  } 

  wating(BuildContext context, String title, String description) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text(description)
              ],
            )
          ),
        );
      }
    );
  }

  _confirmResult(bool isYes, BuildContext context) {
    if(isYes) {
      print("Yes actin");
    } else {
      print("No actin");
      Navigator.pop(context);
    }
  }

  confirm(BuildContext context, String title, String description) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text(description)
              ],
            )
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => _confirmResult(false, context),
              child: new Text('Cancel')
            ),
            FlatButton(
              onPressed: () => _confirmResult(true, context),
              child: new Text('Ok')
            )
          ]
        );
      }
    );
  }
}