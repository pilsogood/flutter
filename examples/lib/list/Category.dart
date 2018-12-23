import "package:flutter/material.dart";

class Category extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text("Dialogs Example"),
        ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment:  MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Container(
                height: 35.0,
                padding: EdgeInsets.all(13.0),
                child: new Text('Layout'),
              )
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/text'),
                child: new Text("Text"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/icon'),
                child: new Text("Icon"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/image'),
                child: new Text("Image"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/card'),
                child: new Text("Card"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/iconbutton'),
                child: new Text("IconButton"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/dropdownbutton'),
                child: new Text("DropdownButton"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/popupmenubutton'),
                child: new Text("PopupMenuButton"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/raisedbutton'),
                child: new Text("RaisedButton"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/flatbutton'),
                child: new Text("FlatButton"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/flatactionbutton'),
                child: new Text("FloatingActionButton"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/checkbox'),
                child: new Text("Checkbox"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/radio'),
                child: new Text("Radio"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/slider'),
                child: new Text("Slider"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/switch'),
                child: new Text("Switch"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/textfield'),
                child: new Text("TextField"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/stack'),
                child: new Text("Stack"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/scafford'),
                child: new Text("Scaffold"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/sizedbox'),
                child: new Text("SizedBox"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/row'),
                child: new Text("Row"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/column'),
                child: new Text("Column"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/positioned'),
                child: new Text("Positioned"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/padding'),
                child: new Text("Padding"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/align'),
                child: new Text("Align"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/fractionaltranslation'),
                child: new Text("FractionalTranslation"),
              ),
              new RaisedButton(
              onPressed: () => Navigator.pushNamed(context, '/fractionallysizedbox'),
                child: new Text("FractionallySizedBox"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/expanded'),
                child: new Text("Expanded"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/divider'),
                child: new Text("Divider"),
              ),
              new RaisedButton(
              onPressed: () => Navigator.pushNamed(context, '/container'),
                child: new Text("Container"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/center'),
                child: new Text("Center"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/appbar'),
                child: new Text("AppBar"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/bottomnavigationbar'),
                child: new Text("BottomNavigationBar"),
              ),
              new RaisedButton(
              onPressed: () => Navigator.pushNamed(context, '/bottomnavigationbaritem'),
                child: new Text("BottomNavigationBarItem"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/tabbar'),
                child: new Text("TabBar"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/clipoval'),
                child: new Text("ClipOval"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/lineargradient'),
                child: new Text("LinearGradient"),
              ),
              new RaisedButton(
              onPressed: () => Navigator.pushNamed(context, '/opacity'),
                child: new Text("Opacity"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/radialgradient'),
                child: new Text("RadialGradient"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/rotatedbox'),
                child: new Text("RotatedBox"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/theme'),
                child: new Text("Theme"),
              ),
              new RaisedButton(
              onPressed: () => Navigator.pushNamed(context, '/gridviewcount'),
                child: new Text("GridViewCount"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/gridviewextent'),
                child: new Text("GridViewExtent"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/listview'),
                child: new Text("ListViewEx"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/singlechildscrollview'),
                child: new Text("SingleChildScrollViewEx"),
              ),
              new RaisedButton(
              onPressed: () => Navigator.pushNamed(context, '/gridviewcount'),
                child: new Text("GridViewCount"),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/gridviewextent'),
                child: new Text("GridViewExtent"),
              ),
            ],
          ),
        ]
      ),
    );
  }
}
