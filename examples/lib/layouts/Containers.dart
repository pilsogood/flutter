import "package:flutter/material.dart";

class ContainerBox extends StatelessWidget {
  final String title;
  ContainerBox({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( 
            // constraints: BoxConstraints.expand(
            //   height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
            // ),
  
            // // foregroundDecoration: BoxDecoration(
            // //   image: DecorationImage(
            // //     image: NetworkImage('https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/1ibV/image/GdgCRRYDpKf_tTMFNuDU3QDe56g.jpg'),
            // //     centerSlice: Rect.fromLTRB(270.0, 180.0, 100.0, 200.0)
            // //   )
            // // ),
            // alignment: Alignment.center,
            margin: const EdgeInsets.all(10.0),
            color: const Color(0xFF00FF00),
            width: 20.0,
            height: 20.0,
            child: 
              new Text(
                    title, 
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    
              )
    );
  }
}

class Menus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row( 
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RaisedButton(
          child: new Text('test'),
          onPressed: () {
          },
        ),
         RaisedButton(
          child: new Text('test'),
          onPressed: () {
          },
        ),
      ],
    );
  }
}

class Containers extends StatefulWidget {
  @override
  ContainersState createState() {
    return new ContainersState();
  }
}

class ContainersState extends State<Containers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Container Example"),
      ),
      body: Column(
        children : <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // new Menus()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: (
                  new ContainerBox(title: 'start')
                ),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: (
                  new ContainerBox(title: 'center')
                ),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: (
                  new ContainerBox(title: 'end')
                ),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: (
                  new ContainerBox(title: 'spaceAround')
                ),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: (
                  new ContainerBox(title: 'spaceBetween')
                ),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: (
                  new ContainerBox(title: 'spaceEvenly')
                ),
              ),
            ]
          ),
        ]
      )
    );
  }
}


