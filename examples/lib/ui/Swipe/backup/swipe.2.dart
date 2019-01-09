import 'package:flutter/material.dart';

class Swipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Drag app"),
        ),
        body: HomePage(),
      ),
    );
  }
}


String _status = "";
List image = ['profile.jpg','dog.jpeg','intro-bg-2.jpg','intro-bg-3.jpg','intro-bg-7.jpg','intro-bg-4.jpg','intro-bg-5.jpg','intro-bg-6.jpg'];
String image1 = image[0];
String image2 = image[1];
bool animationStatus = false;
    

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>  
  with TickerProviderStateMixin {  
  
  AnimationController _controller;
  Animation _animation;

  CurvedAnimation curvedAnimation;
  Animation<Offset> _translationAnim;
  Animation<Offset> _moveAnim;
  Animation<double> _scaleAnim;

  double topd = 0.0;
  double leftd = 0.0;
  double rotated = 0.0;

  // List data = imageData;


  Offset position ;

  @override
  void initState() {
    super.initState();

    // _controller = new AnimationController(
    //     duration: new Duration(milliseconds: 1000), vsync: this);
    
    // _animation = new CurvedAnimation(
    //   parent: _controller,
    //   curve: new Interval(0.0, 1.0, curve: Curves.linear),
    // );

    // _controller = new AnimationController(duration: new Duration(milliseconds: 700), vsync: this);
    // _controller.addListener(() => setState(() {
    //   animationStatus = true;
    // }));
    // _controller.addStatusListener((AnimationStatus status)
    // {
    //   if(status == AnimationStatus.completed) _setcards();
    // });

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );

    curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _translationAnim = Tween(begin: Offset(0.0, 0.0), end: Offset(-1000.0, 0.0))
    .animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _scaleAnim = Tween(begin: 0.965, end: 1.0).animate(curvedAnimation);
    _moveAnim = Tween(begin: Offset(0.0, 0.05), end: Offset(0.0, 0.0))
    .animate(curvedAnimation);

  }

 Future<Null> _playAnimation() async {
    try {
      animationStatus = true;
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      animationStatus = false;
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onDragStart(BuildContext context, DragStartDetails start) {
    RenderBox getBox = context.findRenderObject();
    var local = getBox.globalToLocal(start.globalPosition);
    print(local.dx.toString() + "|" + local.dy.toString());
  }

  _onDragUpdate(BuildContext context, DragUpdateDetails update) {
    RenderBox getBox = context.findRenderObject();
    var local = getBox.globalToLocal(update.globalPosition);
    setState(() {
      topd = local.dy - 180;
      leftd = local.dx - 180;
      rotated = 220.0;
    });
  }

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double left = animationStatus ? (_controller.value * 100.0) : (width - (width * 0.9)) / 2 ;
    final double top = 20;
    final double height = MediaQuery.of(context).size.height;

    final double resetTop = 20;
    final double resetLeft = (width - (width * 0.9)) / 2;

    double x;
    double y;

    topd = (topd == 0) ? top : topd ;
    leftd = (leftd == 0) ? left : leftd;

    return
     Container(
       height:height ,
       width: width,
       child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      child: buttonsRow()
                    ),
                    Positioned( top: 20, left: left, 
                    child: (image.length > 0) ? _card(context, 0.0, image2) : _dummyCard(context),
                    ),
                    Positioned(
                      top: topd,
                      left: leftd,
                      child: 
                      GestureDetector(
                          onTap: () {
                            print("onTap");
                          },
                          onPanUpdate: (DragUpdateDetails details) {
                            print("onPanUpdate");
                          },
                          onPanEnd: (_) {
                            print("onPanEnd");
                                topd = resetTop;
                                leftd = resetLeft;
                                rotated = 0.0;
                                x = 0;
                                y = 0;
                          },
                          onHorizontalDragStart: (DragStartDetails start) {
                            print("onHorizontalDragStart");
                            _onDragStart(context, start);
                          },
                          onHorizontalDragUpdate: 
                          // _move,

                          (DragUpdateDetails update) {
                            // print("onHorizontalDragUpdate");
                                RenderBox getBox = context.findRenderObject();
                                var local = getBox.globalToLocal(update.globalPosition);

                                setState(() {
                                  x = local.dx;
                                  y = local.dy;

                                  if(150 > x) {
                                    print('LEFT');
                                    _status = 'LEFT';
                                  } else if(150 < x) {
                                    print('RIGHT');
                                    _status = 'RIGHT';
                                  } else {
                                  }

                                  topd = local.dy - 180;
                                  leftd = local.dx - 180;
                                  rotated = 220.0;
                                });

                            // setState(() {
                            //   rotated = 220.0;
                            // });

                          },

                          onHorizontalDragEnd: (DragEndDetails end) {

                            print("$x / $y");

                            setState(() {

                              if(x == null) {
                                topd = resetTop;
                                leftd = resetLeft;
                                rotated = 0.0;
                                x = 0;
                                y = 0;
                              }

                              if(150 > x) {
                                print('LEFT');
                                _status = 'LEFT';
                                _setcards();
                              } else if(150 < x) {
                                print('RIGHT');
                                _status = 'RIGHT';
                                _setcards();
                              } else {
                              }
                              
                              topd = resetTop;
                              leftd = resetLeft;
                              rotated = 0.0;
                              x = 0;
                              y = 0;
                    
                              // print("onHorizontalDragEnd");
                              
                              // print("LEFT");
                              // if(end.velocity.pixelsPerSecond.dx > -1000.0) {
                              //   print("RIGHT");
                              // } 

                            });
                          },
                          child: _card(context, rotated, image1),
                        ),

                      ),

                    // Positioned(
                    //   bottom: 0,
                      // child: buttonsRow()
                    // )
      
                  ],
                ),
     );
  
  
  }


  void _setcards() {
     if(image.length > 0) {
      image.removeAt(0);
    
      if(image.length == 1) {
        image1 = image[0];
        image2 = "tripgrida-logo.png";
      } else if(image.length == 0) {
        image1 = "tripgrida-logo.png";
      } else {
        image1 = image[0];
        image2 = image[1]; 
      }
     } else {
      image1 = "tripgrida-logo.png";
     }
     animationStatus = false;
  }

  Widget _dummyCard(BuildContext context) {
    
    final double width = MediaQuery.of(context).size.width * 0.9;
    final double height = MediaQuery.of(context).size.height * 0.65;
    
    return Container(
      height: height,
      width:  width,
      decoration: new BoxDecoration(
        color: Colors.black.withOpacity(0.2) ,
        // Colors.transparent,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(20.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: new Color.fromRGBO(60, 64, 67, 0.5),
            blurRadius: 10.0,
            offset: new Offset(0.0, 5.0),
          ),
        ],
      ),
    );
  }


  Widget _card(BuildContext context, rotated, image) {
    
    final double width = MediaQuery.of(context).size.width * 0.9;
    final double height = MediaQuery.of(context).size.height * 0.65;

    return new 
      Transform.rotate(
        angle: rotated,
        child: Container(
          height: height,
          width:  width,
          decoration: new BoxDecoration(
              color: Colors.black.withOpacity(0.2) ,
              // Colors.transparent,
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(20.0),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: new Color.fromRGBO(60, 64, 67, 0.5),
                  blurRadius: 10.0,
                  offset: new Offset(0.0, 5.0),
                ),
              ],
          ),
          
          child: new Stack
          (
            children: <Widget>
            [
              new SizedBox.expand
              (
                child: new Material
                (
                  borderRadius: new BorderRadius.circular(8.0),
                  clipBehavior: Clip.antiAlias,
                  child:  new Image.asset("assets/images/$image",
                    // (image == 0) ? 'assets/images/dog.jpeg' : 'assets/images/profile.jpg' , 
                    fit: BoxFit.cover) ,
                ),
              ),
              new Align
              (
                alignment: Alignment.bottomLeft,
                child: new Container
                (
                  padding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: new Column
                  (
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      new Center(child:Text(_status)),
                      new Text('Card number 0', style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w700)),
                      new Padding(padding: new EdgeInsets.only(bottom: 8.0)),
                      new Text('A short description.', textAlign: TextAlign.start, style: new TextStyle(color: Colors.white)),
                    ],
                  )
                ),
              )
            ],
          ),
        )
    );
  }


  Widget buttonsRow()
  {
    return new Container
    (
      height: 100.0,
      // margin: new EdgeInsets.symmetric(vertical: 15.0),
      child: 
      Container(
        child: new Row
        (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>
          [
            _circle(Icons.loop, Colors.yellow, 20.0),
            _circle(Icons.loop, Colors.red, 30.0),
            _circle(Icons.loop, Colors.green, 20.0),
            _circle(Icons.loop, Colors.blue, 30.0),
            _circle(Icons.loop, Colors.teal, 20.0),
            // _buttons(Icons.close, Colors.red, false),
            // _buttons(Icons.favorite, Colors.green, true),
            // _buttons(Icons.star, Colors.blue, false),
            // _buttons(Icons.access_alarm, Colors.teal, true),
          ],
        ),
      )
    );
  }
}

Widget _buttons(icon, color, mini) {
  return 
    Container(
    width: 70,
    child:
      FloatingActionButton(
        onPressed: () {},
        child: Icon(
          icon,
          color: color,
          size: 25.0
        ),
        mini: mini ? true : false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        elevation: 8.0, 
      ),
    );
}

Widget _circle(icon, color, size) {
  // return new MaterialButton(
  //   // splashColor: Colors.redAccent,
  //   minWidth: 70.0,
  //   onPressed: () {},
  //   child: Icon(
  //     icon,
  //     color: color,
  //     size: size
  //   ),
  //   shape: new CircleBorder(),
  //   elevation: 1.0,
  //   padding: const EdgeInsets.all(10.0),
  // );
  return 
  new 
  Container(
    width: 70,

    child: RawMaterialButton(
        splashColor: Colors.purpleAccent,
        shape: new CircleBorder(),
        elevation: 8.0,
        fillColor: Colors.white,
        padding: const EdgeInsets.all(10.0),
        onPressed: (){
        },
        child: Icon(
                  icon,
                  color: color,
                  size: size
        )
      )
  );

}

  

