import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";

void main() => runApp(DismissibleList());

class DismissibleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dismissible Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Colors.transparent,
      ),
      home: MyHomePage(title: 'Dismissible Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> items = new List<String>.generate(30, (i) => "Items ${i+1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title)
      ),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, int index) {
          
               return new SlideMenu(
                  child: new ListTile(
                    title: new Container(child: new Text("Drag me")),
                  ),
                  menuItems: <Widget>[
                    new Container(
                      child: new IconButton(
                        icon: new Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    ),
                    new Container(
                      child: new IconButton(
                        icon: new Icon(Icons.info),
                        onPressed: () {},
                      ),
                    ),
                  ],
                );

          // return new Dismissible(
          //   key: new Key(items[index]),
          //   onDismissed: (DismissDirection direction) {
          //     if(direction == DismissDirection.endToStart) {
          //       setState(() {
          //         items.removeAt(index);
          //       });
          //     }

          //   },
          //   background: new Container(color: Colors.red),
          //   child: new ListTile(
          //     title: new Text('${items[index]}'),
          //   )
          // );


        },
      )
    );
  }
}



class SlideMenu extends StatefulWidget {
  final Widget child;
  final List<Widget> menuItems;

  SlideMenu({this.child, this.menuItems});

  @override
  _SlideMenuState createState() => new _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu> 
  with SingleTickerProviderStateMixin {
    
  AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = new Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(-0.2, 0.0)
    ).animate(new CurveTween(curve: Curves.decelerate).animate(_controller));

    return new GestureDetector(
      onHorizontalDragUpdate: (data) {
        // we can access context.size here
        setState(() {
          _controller.value -= data.primaryDelta / context.size.width;
        });
      },
      onHorizontalDragEnd: (data) {
        if (data.primaryVelocity > 2500)
          _controller.animateTo(.0); //close menu on fast swipe in the right direction
        else if (_controller.value >= .5 || data.primaryVelocity < -2500) // fully open if dragged a lot to left or on fast swipe to left
          _controller.animateTo(1.0);
        else // close if none of above
          _controller.animateTo(.0);
      },
      child: new Stack(
        children: <Widget>[
          new SlideTransition(position: animation, child: widget.child),
          new Positioned.fill(
            child: new LayoutBuilder(
              builder: (context, constraint) {
                return new AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return new Stack(
                      children: <Widget>[
                        new Positioned(
                          right: .0,
                          top: .0,
                          bottom: .0,
                          width: constraint.maxWidth * animation.value.dx * -1,
                          child: new Container(
                            color: Colors.black26,
                            child: new Row(
                              children: widget.menuItems.map((child) {
                                return new Expanded(
                                  child: child,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}