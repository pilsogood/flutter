import "package:flutter/material.dart";

class Loader2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Loader Example"),
      ),
      body: Center(
        child: LoaderPage()
      )
    );
  }
}

class LoaderPage extends StatefulWidget {
  @override
  _LoaderPage createState() => _LoaderPage();
}

class _LoaderPage extends State<LoaderPage> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;

  final double initialRadius = 30.0; 
  double radius = 0.0;


  @override
  void initState(){
    super.initState();
    //vsync make sure that no unecessary resource are used by our device
    controller = new AnimationController(duration: new Duration(seconds: 5), vsync: this);
    //curve is used to define how our animation behaves
    animation = new CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation.addListener((){
      //we call setState everytime when the animation value changes
      this.setState(() {});
    });
    animation.addStatusListener((AnimationStatus status){
    });
    /*to start the animation we use this but it shows animation
    only once i.e you have to restart app again n again*/
    //controller.forward(); /
    //use controller.repeat() to repeat your animation
    controller.repeat();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          color: Colors.deepOrange,
          height: 3.0,
          width: animation.value * 100.0,
        ),
        new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
        new Container(
          color: Colors.deepOrange,
          height: 3.0,
          width: animation.value * 75.0,
        ),
        new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
        new Container(
          color: Colors.deepOrange,
          height: 3.0,
          width: animation.value * 50.0,
        ),
      ],
    );
  }
}