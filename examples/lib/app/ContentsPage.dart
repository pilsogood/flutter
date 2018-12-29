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
          color: new Color(0xFF736AB7),
          child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            // _getToolbar(context),
          ],
        )
      )
    );
  }
}


Container _getBackground() {
  return new Container(
    child: new Image.asset('assets/images/intro-bg-2.jpg',
      fit: BoxFit.cover,
      alignment: Alignment(0.0, 1.0),
      height: 300.0
    ),
    constraints: new BoxConstraints.expand(height: 300.0),
  );
}

Container _getGradient() {
  return new Container(
    margin: new EdgeInsets.only(top: 200.0),
    height:110.0,
    decoration: new BoxDecoration(
      gradient: new LinearGradient(
        colors: <Color> [
          new Color(0x00736AB7),
          new Color(0xFF736AB7),
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
    padding: new EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 32.0),
    children: <Widget>[
        
        new Container(
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
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
        //  child: new Column(
        //    children: <Widget>[
        //      new Text('test'),
        //    ],
        //  ),
       ),
       height: 180.0,
      //  margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
       margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
       decoration: new BoxDecoration(
         color: new Color(0xFF333366),
         shape: BoxShape.rectangle,
         borderRadius: new BorderRadius.circular(20.0),
         boxShadow: <BoxShadow>[
           new BoxShadow(
             color: Colors.black12,
             blurRadius: 10.0,
             offset: new Offset(0.0, 10.0),
           ),
        ],
      ),
    );

// Container _getToolbar() {}


// class PlanetSummary extends StatelessWidget {
//   final Planet planet;
//   final bool horizontal;

//   PlanetSummary(this.planet, {this.horizontal = true});
//   PlanetSummary.vertical(this.planet): horizontal = false;

//   @override 
//   Widget build(BuildContext context) {

//     final planetThimbnail = new Container(
//       margin: new EdgeInsets.symmetric(
//         vertical: 16.0
//       ),
//       alignment: horizontal ? FractionalOffset.centerLeft : FractionalOffset.center ,
//       child: new Hero(
//         tag: "Planet-hero-${planet.id}",
//         child: new Image(
//           image: new AssetImage(planet.image),
//           height: 92.0,
//           width: 92.0,
//         ),
//       )
//     );

//     Widget _planetValue({String value, String image}) {
//       return new Container(
//         child: new Row(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             new Image.asset(image, height:12.0),
//             new Container(width: 8.0),
//             new Text(planet.gravity, style: Style.regularTextStyle)
//           ],
//         )
//       );
//     }

//   }
// }