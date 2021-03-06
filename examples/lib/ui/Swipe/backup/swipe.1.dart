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

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>  
  with SingleTickerProviderStateMixin {
  
  AnimationController _buttonController;
  Animation<double> _animation;

  Animation<double> rotate;
  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;
  int flag = 0;

  double topd = 0.0;
  double leftd = 0.0;
  double rotated = 0.0;

  // List data = imageData;
  List selectedData = [];

  Offset position ;

  @override
  void initState() {
    super.initState();

    _buttonController = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);
    
    _animation = new CurvedAnimation(
      parent: _buttonController,
      curve: new Interval(0.0, 1.0, curve: Curves.linear),
    );

  }

  @override
  void dispose() {
    _buttonController.dispose();
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
    final double left = (width - (width * 0.9)) / 2;
    final double top = 20;
    final double height = MediaQuery.of(context).size.height;

    final double resetTop = 20;
    final double resetLeft = (width - (width * 0.9)) / 2;

    double x;
    double y;
    

    String acceptedData = "";

    topd = (topd == 0) ? top : topd ;
    leftd = (leftd == 0) ? left : leftd;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Container(
              child: Stack(
                children: <Widget>[
                    Positioned(
                    top: topd,
                    left: leftd,

                    child: 
                    
                    // Draggable(
                    //   child: _card(context, false, 0),
                    //   feedback: _card(context, true, 0),
                    //   onDraggableCanceled: (Velocity velocity, Offset offset){
                    //     // setState(() => position = offset);
                    //     print(offset.toString());
                    //   },
                    //   childWhenDragging:  _card(context, false ,1),
                    //   data: "1"
                    // ),

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

                          if(150 > x) {
                            print('LEFT');
                          } else if(350 < x) {
                            print('RIGHT');
                          } else {
                            topd = resetTop;
                            leftd = resetLeft;
                            rotated = 0.0;
                            x = 0;
                            y = 0;
                          }

                
                          // print("onHorizontalDragEnd");
                          
                          // print("LEFT");
                          // if(end.velocity.pixelsPerSecond.dx > -1000.0) {
                          //   print("RIGHT");
                          // } 

                       


                    
                        });
                      },
                      child: _card(context, rotated, 0),
                    ),


                  ),
                    
                  // Positioned(
                  //   left:0,
                  //   child: DragTarget(
                  //       builder: (context, accepted, rejected) => Container(
                  //         height: height,
                  //         width: 85.0,
                  //         color: Color.fromRGBO(255, 255, 255, 0),
                  //       ),
                  //       onLeave: (String data) {
                  //         setState(() => _status = "OOOO");
                  //         print(acceptedData + ": LEFT");
                  //       },
                  //       onWillAccept: (String data) {
                  //         setState(() => _status = "OOOO");
                  //         return true;
                  //       },
                  //       onAccept: (String data) {
                  //         acceptedData = data;  
                  //         setState(() => _status = "OOOO");
                  //         print(acceptedData + ": LEFT");
                  //         swipeLeft();
                  //       }
                  //     )
                  // ),
                  // Positioned(
                  //   right:0,
                  //   child: DragTarget(
                  //       builder: (context, accepted, rejected) => Container(
                  //         height: height,
                  //         width: 85.0,
                  //         color:  Color.fromRGBO(255, 255, 255, 0),
                  //       ),
                  //       onLeave: (String data) {
                  //         setState(() => _status = "LIKE");
                  //         print(acceptedData + ": RIGHT");
                  //         swipeRight();
                  //       },
                  //       onWillAccept: (String data) {
                  //         setState(() => _status = "LIKE");
                  //         swipeRight();
                  //         return true;
                  //       },
                  //       onAccept: (String data) {
                  //         acceptedData = data;  
                  //         setState(() => _status = "LIKE");
                  //         print(acceptedData + ": RIGHT");
                  //         swipeRight();
                  //       }
                  //     )
                  // ),
                ],
              ),
            ),
          ),
          buttonsRow()
      ],
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
                  child:  new Image.asset(
                    (image == 0) ? 'assets/images/dog.jpeg' : 'assets/images/profile.jpg' , 
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
                      new Text(_status),
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
      child: new Row
      (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>
        [
          new FloatingActionButton
          (
            mini: true,
            onPressed: () {},
            backgroundColor: Colors.white,
            child: new Icon(Icons.loop, color: Colors.yellow),
          ),
          new Padding(padding: new EdgeInsets.only(right: 8.0)),
          new FloatingActionButton
          (
            onPressed: () {},
            backgroundColor: Colors.white,
            child: new Icon(Icons.close, color: Colors.red),
          ),
          new Padding(padding: new EdgeInsets.only(right: 8.0)),
          new FloatingActionButton
          (
            onPressed: () {},
            backgroundColor: Colors.white,
            child: new Icon(Icons.favorite, color: Colors.green),
          ),
          new Padding(padding: new EdgeInsets.only(right: 8.0)),
          new FloatingActionButton
          (
            mini: true,
            onPressed: () {},
            backgroundColor: Colors.white,
            child: new Icon(Icons.star, color: Colors.blue),
          ),
        ],
      ),
    );
  }

}

