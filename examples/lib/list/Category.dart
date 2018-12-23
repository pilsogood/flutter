import "package:flutter/material.dart";

// 타이틀
class TitleText extends StatelessWidget {
	final String text;
	TitleText(this.text);

	Widget build(context) {
		return new Row(
      mainAxisAlignment:  MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Container(
          height: 35.0,
          padding: EdgeInsets.all(13.0),
          child: new Text(text, style: new TextStyle(fontSize: 15.0)),
        )
      ],
    );
	}
}
// 버튼 
class Raised extends StatelessWidget {
	final String title, link;
	Raised(this.title, this.link);

	Widget build(context) {
		return new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, link),
                child: new Text(title, style: new TextStyle(fontSize: 13.0)),
    );
  }
}

class Category extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text("Examples"),
        ),
      body: Column(
        children: <Widget>[
          new TitleText('Init'),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Raised("MaterialApp","/materialapp"),
              new Raised("Scaffold","/scafford"),
            ],
          ),

          new TitleText('Basic'),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Raised("Text","/text"),
              new Raised("Icon","/icon"),
              new Raised("Image","/image"),
              new Raised("Card","/card"),
            ],
          ),
          new TitleText('Buttons'),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Raised("IconButton","/iconbutton"),
              new Raised("Dropdown","/dropdownbutton"),
              new Raised("PopupMenu","/popupmenubutton"),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Raised("RaisedButton","/raisedbutton"),
              new Raised("FlatButton","/flatbutton"),
              new Raised("FloatingActionButton","/flatactionbutton"),
            ],
          ),
          new TitleText('Basic'),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Raised("Checkbox","/checkbox"),
              new Raised("Radio","/radio"),
              new Raised("Slider","/slider"),
              new Raised("Switch","/switch"),
            ],
          ),

          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Raised("Container","/container"),
              new Raised("Stack","/stack"),
              new Raised("Row","/row"),
              new Raised("Column","/column"),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Raised("TextField","/textfield"),
              new Raised("SizedBox","/sizedbox"),
              new Raised("Positioned","/positioned"),
              new Raised("Padding","/padding"),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Raised("Align","/align"),
              new Raised("FractionalTranslation","/fractionaltranslation"),
              new Raised("FractionallySizedBox","/fractionallysizedbox"),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Raised("Expanded","/expanded"),
              new Raised("Divider","/divider"),
              new Raised("Center","/center"),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Raised("AppBar","/appbar"),
              new Raised("BottomNavigationBar","/bottomnavigationbar"),
              new Raised("BottomNavigationBarItem","/bottomnavigationbaritem"),
              new Raised("TabBar","/tabbar"),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Raised("ClipOval","/clipoval"),
              new Raised("LinearGradient","/lineargradient"),
              new Raised("Opacity","/opacity"),
              new Raised("RadialGradient","/radialgradient"),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Raised("RotatedBox","/listview"),
              new Raised("Theme","/singlechildscrollview"),
              new Raised("GridViewCount","/gridviewcount"),
              new Raised("GridViewExtent","/gridviewextent"),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Raised("ListViewEx","/listview"),
              new Raised("SingleChildScrollViewEx","/singlechildscrollview"),
            ],
          ),
        ]
      ),
    );
  }
}
