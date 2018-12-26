import "package:flutter/material.dart";
import 'package:splashscreen/splashscreen.dart';

class Intro extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            const Color(0xFFffffff),
            const Color(0xFF2e0a0a),
            const Color(0xFF000000),
          ],
          stops: [0.1,0.8,1.0,],
        ),
      ),
      child: SplashScreen(
      seconds: 5, 
      navigateAfterSeconds: new AfterSplash(),
      title: 
        new Text('Welcome to TRIPGRIDA',
          style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        )
      ), 
      image: new Image.network("https://www.tripgrida.com/img/resource/city/95/168/thumb_1024/2y0724f76fd0bdbb7b3536585uHFjikWnXzcKhEltrFj7Q5EvbQU0rjyC.jpg"),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("Clicked!"),
      loaderColor: Colors.red,
      ),
    );
  }
}
      

class AfterSplash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: new Text('welcome'),
          automaticallyImplyLeading: false,
      ),
      body: new Center(
          child: new Text("Succeeded!",
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          )
        ),
      )
    );
  }
}