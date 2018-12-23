import "package:flutter/material.dart";

class ImageEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Image Examples"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Container(
            // color: Colors.blue,
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                new Container(
                 child: Column(
                  children: <Widget>[
                    new Image.asset(
                      'assets/images/dog.jpeg',
                      fit:BoxFit.contain,
                      width: 100.0, 
                    ),
                    new Text('Image.asset'),
                  ],
                ),
              )
            ]
           )
          ),
          new Container(
            // color: Colors.indigo,
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.center,
            // height:100.0,
            child: Column(
              children: <Widget>[
                new Image.network('http://ecotopia.hani.co.kr/files/attach/images/69/139/062/Husky_(1).jpg',
                  fit:BoxFit.cover,
                  width:100.0,
                ),
                new Text('Image.network')
              ],
              )
            
          ),
        ],
      ),
    );
  }
}