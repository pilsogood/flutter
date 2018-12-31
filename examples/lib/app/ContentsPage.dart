import "package:flutter/material.dart";

class ContentsPage extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

// Color gradientStart = Colors.deepPurple[500]; //Change start gradient color here
// Color gradientEnd = Colors.purple[100]; //Change end gradient color here

Color gradientStart = Color.fromRGBO(131, 77, 155 , 1); //Change start gradient color here
Color gradientMiddle = Color.fromRGBO(207, 139, 243 , 1); //Change end gradient color here
Color gradientEnd = Color.fromRGBO(208, 78, 214 , 1); //Change end gradient color here

class _AppStatus extends State<ContentsPage> {
  
  final userId = TextEditingController();
  final userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body:  new Container(
        constraints: new BoxConstraints.expand(),
          color: new Color(0xFFFFFFFF),
          child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            // _getContent(),
            _getHorizontalList(),
            _getVerricalList(),
          ],
        )
      )
    );
  }
}


Container _getBackground() {
  return new Container(
    decoration: new BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(20.0),
    ),
    child: new Image.asset('assets/images/intro-bg-3.jpg',
      fit: BoxFit.cover,
      alignment: Alignment(0.0, 1.0),
      height: 300.0,
    ),
    constraints: new BoxConstraints.expand(height: 230.0),
  );
}

Container _getGradient() {
  return new Container(
    margin: new EdgeInsets.only(top: 120.0),
    height:110.0,
    decoration: new BoxDecoration(
      gradient: new LinearGradient(
        colors: <Color> [
          new Color(0x00FFFFFF),
          new Color(0xFFFFFFFF),
        ],
        stops: [0.0, 0.9],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(0.0, 1.0)
      )
    ),
  );
}

Widget _getContent() {
  return new ListView(
    padding: new EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 32.0),
    children: <Widget>[
        
        new Container(
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          // color: Colors.white,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              planetCard,
              new Separator(),
            ],
          )
        )
    ],
  );
}

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 18.0,
        color: new Color(0xff00c6ff)
    );
  }
}

final planetCard = new Container(
       child: new Container(
         child: new Column(
           children: <Widget>[
             new Text('test'),
           ],
         ),
       ),
       width: 280.0,
      //  height: 150.0,
       margin: new EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 20.0),
      //  padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
       decoration: new BoxDecoration(
         color: new Color(0xFFFFFFFF),
         shape: BoxShape.rectangle,
         borderRadius: new BorderRadius.circular(20.0),
         boxShadow: <BoxShadow>[
           new BoxShadow(
             color: new Color(0xFFF8E1FE),
             blurRadius: 10.0,
             offset: new Offset(0.0, 10.0),
           ),
        ],
    ),
  );



Widget _getHorizontalList() {
  return Container(
    margin: new EdgeInsets.only(top: 120.0),
    padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    height: 200.0,
    child: new ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        planetCard,
        planetCard,
        planetCard,
        planetCard,
      ],
    )
  );
}



final planetCard2 = new Container(
       child: new Container(
         child: new Column(
           children: <Widget>[
             new Text('test'),
           ],
         ),
       ),
       width: 280.0,
       height: 80.0,
      //  height: 150.0,
       margin: new EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
      //  padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
       decoration: new BoxDecoration(
         color: new Color(0xFFFFFFFF),
         shape: BoxShape.rectangle,
         borderRadius: new BorderRadius.circular(20.0),
         boxShadow: <BoxShadow>[
           new BoxShadow(
             color: new Color(0xFFF8E1FE),
             blurRadius: 10.0,
             offset: new Offset(0.0, 10.0),
           ),
        ],
    ),
  );


Widget _getVerricalList() {
  return Container(
      margin: new EdgeInsets.only(top: 280.0),
    padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    // height: 200.0,
    child: new ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        planetCard2,
        planetCard2,
        planetCard2,
        planetCard2,
      ],
    )
  );
}