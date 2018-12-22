import "package:flutter/material.dart";
import "package:example/dialogs/Dialogs.dart";

class DialogsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialogs Examples',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: DialogsHome(title: 'Dialogs Examples'),
    );
  }
}

class DialogsHome extends StatefulWidget {
  DialogsHome({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DialogsHome createState() => _DialogsHome();

}

class _DialogsHome extends State<DialogsHome> {
  Dialogs dialogs = new Dialogs();


  Future<bool> _onBackPressed() async {
    final alertDialog = AlertDialog(        
      content: Text("Do you really want to quit the application?"),
      actions: <Widget>[
        FlatButton(
          child: Text('Yes'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text('No'),
          onPressed: () => Navigator.of(context).pop(),          
        )
      ],
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => alertDialog
    );
  }

  @override
  Widget build(BuildContext context) {

    // Row toolbar = new Row(
    //   children: <Widget>[
    //     new Icon(Icons.arrow_back),
    //     new Icon(Icons.menu),
    //     new Expanded(child: new Text(widget.title)),
    //     new Icon(Icons.arrow_forward)
    //   ]
    // );

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: new Text(widget.title),
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
      ),
    );
  }
}

