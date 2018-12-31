import "package:flutter/material.dart";

class Category extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}
class _AppState extends State<Category> {

  Widget makeTitle(title) {
    return new Row(
      mainAxisAlignment:  MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Container(
          height: 35.0,
          padding: EdgeInsets.all(13.0),
          child: new Text(title, style: new TextStyle(fontSize: 15.0)),
        )
      ],
    );
  }  

  Widget makeRaisedButton(context, title, link) {
    return new RaisedButton(
                onPressed: () => Navigator.pushNamed(context, link),
                child: new Text(title, style: new TextStyle(fontSize: 13.0)),
    );
  }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: new Text("Examples"),
//         ),
//       body: 
//       new Container(
//         child: new Center(
//           child: new Column(
//             children: <Widget>[
//               new Text('${jsonStringMap["name"]}'),
//               new FlatButton(
//                 child: new Text('sssd'),
//                 onPressed: () => _loadToJson,
//               )
          
//             ],
//           )
          
          
//         )
//       )
//     //   new GridView.builder(
//     //     itemCount: _pets.length,
//     //     gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//     //     crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 3),
//     //     itemBuilder: (BuildContext context, int index) {
//     //       return new GridTile(
//     //         child: new Card(
//     //           color: Colors.blue.shade200,
//     //           child: new Center(
//     //             child: new Text('tile $index ${_pets.elementAt(index)}'),
//     //           )
//     //         ),
//     //      );
//     //   }
//     // ),
//   );
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text("Examples"),
        ),
      body: new SingleChildScrollView(
      child: new Column(
        children: <Widget>[

          makeTitle('App'),
          // Container(
          //   child: 
          //    new GridView.count(
          //       crossAxisCount: 4,
          //       children: new List<Widget>.generate(16, (index) {
          //         return new GridTile(
          //           child: new Card(
          //             color: Colors.blue.shade200,
          //             child: new Center(
          //               child: new Text('tile $index'),
          //             )
          //           ),
          //         );
          //       }),
          //     ),
          // ),

          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
               makeRaisedButton(context,"App","/intro"),
               makeRaisedButton(context,"Tr","/tr"),
            ],
          ),

          // makeTitle('Effects'),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"Typing","/typing"),
          //      makeRaisedButton(context,"Fade","/fade"),
          //   ],
          // ),
          // makeTitle('Init'),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"MaterialApp","/materialapp"),
          //      makeRaisedButton(context,"Scaffold","/scafford"),
          //   ],
          // ),
          // makeTitle('Basic'),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"Text","/text"),
          //      makeRaisedButton(context,"Icon","/icon"),
          //      makeRaisedButton(context,"Image","/image"),
          //      makeRaisedButton(context,"Card","/card"),
          //   ],
          // ),
          // makeTitle('Buttons'),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //     makeRaisedButton(context,"IconButton","/iconbutton"),
          //      makeRaisedButton(context,"Dropdown","/dropdownbutton"),
          //      makeRaisedButton(context,"PopupMenu","/popupmenubutton"),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //     makeRaisedButton(context,"Switch","/switch"),
          //      makeRaisedButton(context,"Slider","/slider"),
          //      makeRaisedButton(context,"DatePicker","/datepicker"),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"RaisedButton","/raisedbutton"),
          //      makeRaisedButton(context,"FlatButton","/flatbutton"),
          //      makeRaisedButton(context,"FooterButton","/footerbutton"),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"FloatingActionButton","/flatactionbutton"),
          //      makeRaisedButton(context,"FloatingActionButtonCenter","/flatactionbuttoncenter"),
          //   ],
          // ),
          // makeTitle('Basic'),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"Sliding1","/slidingmenu1"),
          //      makeRaisedButton(context,"Sliding2","/slidingmenu2"),
          //   ],
          // ),
          // makeTitle('Loader'),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"Loader1","/loader1"),
          //      makeRaisedButton(context,"Loade2","/loader2"),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"Container","/container"),
          //      makeRaisedButton(context,"Stack","/stack"),
          //      makeRaisedButton(context,"Row","/row"),
          //      makeRaisedButton(context,"Column","/column"),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"TextField","/textfield"),
          //      makeRaisedButton(context,"SizedBox","/sizedbox"),
          //      makeRaisedButton(context,"Positioned","/positioned"),
          //      makeRaisedButton(context,"Padding","/padding"),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"Align","/align"),
          //      makeRaisedButton(context,"FractionalTranslation","/fractionaltranslation"),
          //      makeRaisedButton(context,"FractionallySizedBox","/fractionallysizedbox"),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"Expanded","/expanded"),
          //      makeRaisedButton(context,"Divider","/divider"),
          //      makeRaisedButton(context,"Center","/center"),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"AppBar","/appbar"),
          //      makeRaisedButton(context,"TabBar","/tabbar"),
          //      makeRaisedButton(context,"ChangingIcon","/changingicon"),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"BottomNavigationBar","/bottomnavigationbar"),
              //  makeRaisedButton(context,"BottomNavigationBarItem","/bottomnavigationbaritem"),
          //      makeRaisedButton(context,"BottomSheets","/bottomsheets"),
          //      makeRaisedButton(context,"SnackBar","/snackbar"),
          //   ],
          // ),
          // makeTitle('Request'),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"HttpRequest","/httprequest"),
          //      makeRaisedButton(context,"JsonStorage","/jsonstorage"),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"ClipOval","/clipoval"),
          //      makeRaisedButton(context,"LinearGradient","/lineargradient"),
          //      makeRaisedButton(context,"Opacity","/opacity"),
          //      makeRaisedButton(context,"RadialGradient","/radialgradient"),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
              //  makeRaisedButton(context,"RotatedBox","/listview"),
              //  makeRaisedButton(context,"Theme","/singlechildscrollview"),
              //  makeRaisedButton(context,"GridViewCount","/gridviewcount"),
              //  makeRaisedButton(context,"GridViewExtent","/gridviewextent"),
              //  makeRaisedButton(context,"HorizontalListViewEx","/horizontallistview"),
              //  makeRaisedButton(context,"HorizontalListViewFullEx","/horizontallistviewfull"),
              //   makeRaisedButton(context,"ListViewEx","/listview"),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"ListViewWithListEx","/listviewwithlist"),
          //      makeRaisedButton(context,"ListViewWithMapEx","/listviewwithmap"),
          //      makeRaisedButton(context,"SingleChildScrollViewEx","/singlechildscrollview"),
          //   ],
          // ),

          // makeTitle('Dialogs'),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"AlertDialog","/alertdialog"),
          //      makeRaisedButton(context,"SimpleDialog","/simpledialog"),
          //   ],
          // ),
          // makeTitle('Chat'),
          // Row(
          //   mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //      makeRaisedButton(context,"Chat","/chat"),
          //      makeRaisedButton(context,"Map","/map"),
          //   ],
          // ),
        ]
      ),
      )
    );
  }
}
