import "package:flutter/material.dart";

class FloatingActionButtonCenterEx extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<FloatingActionButtonCenterEx> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: new BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 4.0,
          hasNotch:true,
          color: Colors.red,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {
                  _scaffoldKey.currentState
                  .showBottomSheet((context) => Container(
                    color: Colors.red,
                    height: 250.0,
                    child: Container()
                  ));
                },
              )
            ],
          )
        ),
        // body: new Container(
        //   child: new Center(
        //     child: new Column(
        //       children: <Widget>[

        //       ],
        //     ),
        //   )
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          onPressed: () {
          },
        ),
      )
    );
  }
}