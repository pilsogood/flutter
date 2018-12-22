import "package:flutter/material.dart";

class CustomAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 60.0;

  CustomAppBar(this.title);


  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    final TextStyle textStyle = Theme.of(context).textTheme.display2;

    Row toolbar = new Row(
      children: <Widget>[
        new Icon(Icons.arrow_back, color: Colors.white),
        // new Icon(Icons.menu),
        new Expanded(
          child: 
          new Text(title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25.0,
            )
          ),
        ),
        new Icon(Icons.arrow_forward, color: Colors.white)
      ]
    );


    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            const Color(0xFF3366FF),
            const Color(0xFF00CCFF),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp
        ),
        color: Colors.blue,
        shape: BoxShape.rectangle,
        // borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(  
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 3.0),
          )
        ]
      ),
      child: toolbar
    );
  }
}