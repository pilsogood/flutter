import "package:flutter/material.dart";
import 'package:splashscreen/splashscreen.dart';

class ProfilePage extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

// Color gradientStart = Colors.deepPurple[500]; //Change start gradient color here
// Color gradientEnd = Colors.purple[100]; //Change end gradient color here

Color gradientStart = Color.fromRGBO(131, 77, 155 , 1); //Change start gradient color here
Color gradientMiddle = Color.fromRGBO(207, 139, 243 , 1); //Change end gradient color here
Color gradientEnd = Color.fromRGBO(208, 78, 214 , 1); //Change end gradient color here

class _AppStatus extends State<ProfilePage> {
  
  final userId = TextEditingController();
  final userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      // appBar: AppBar(
      //     title: new Text('welcome'),
      //     automaticallyImplyLeading: false,
      // ),
      body:  new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                new CustomAppBar('test'),
                // new Container(
                //     padding: const EdgeInsets.all(0.0),
                //     alignment: Alignment.center,
                //     decoration: new BoxDecoration(
                //           color: const Color(0xff7c94b6),
                //           gradient: new LinearGradient(colors: [gradientStart, gradientEnd],
                //               begin: const FractionalOffset(0.5, 0.0),
                //               end: const FractionalOffset(0.0, 0.5),
                //               stops: [0.0,1.0],
                //               tileMode: TileMode.clamp
                //           ),
                //           image : new DecorationImage(
                //             colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                //             image: new AssetImage('assets/images/intro-bg-3.jpg'),
                //             fit: BoxFit.cover
                //           ),
                //       ),
                //       child: new Center(
                //         child: new Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: <Widget>[
                //           ],
                //         ),
                //       )
                //     )
            ],
      )
      
    );
  }
}


class CustomAppBar extends StatelessWidget {

  final String title;
  final double barHeight = 150.0; // change this for different heights 

  CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      // color: Colors.teal,
      decoration: new BoxDecoration(
        border: new Border.all(width: 0.0, color: Colors.transparent),
        // shape: BoxShape.circle,
        color: Colors.teal,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.0),
            blurRadius: 20.0,
          ),
       ],
      ),
      child: new Center(
        child: new Text(
          title,
          style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
