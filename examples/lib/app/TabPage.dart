import "package:flutter/material.dart";

class TabPage extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<TabPage>  
  with SingleTickerProviderStateMixin {
 
  TabController controller;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = new TabController(vsync: this, length: 3);
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

    List<BottomNavigationBarItem> _items;
    String values = '';
    int _index = 0;

  @override
  void initState() {
    super.initState();
    _items = new List();
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.people), title: new Text('', style: TextStyle(fontSize: 8.0))));
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.weekend), title: new Text('', style: TextStyle(fontSize: 8.0))));
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.message), title: new Text('', style: TextStyle(fontSize: 8.0))));
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.work), title: new Text('', style: TextStyle(fontSize: 8.0))));
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.work), title: new Text('', style: TextStyle(fontSize: 8.0))));
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      persistentFooterButtons: <Widget>[
        new IconButton(icon: new Icon(Icons.timer), onPressed: () => {}),
        new IconButton(icon: new Icon(Icons.people), onPressed: () => {}),
        new IconButton(icon: new Icon(Icons.map), onPressed: () => {}),
      ],
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _items,
        fixedColor: Colors.blue,
        currentIndex: _index,
        onTap: (int item) {
          _index = item;
          setState(() {
             values = "Current value is: ${_index.toString()}";
          });
          print(values);
        },
      ),
      // bottomNavigationBar: new Material(
      //   color: Colors.deepOrange,
      //   child: new TabBar(
      //     controller: controller,
      //     tabs: <Tab>[
      //       new Tab(icon: new Icon(Icons.arrow_forward)),
      //       new Tab(icon: new Icon(Icons.arrow_downward)),
      //       new Tab(icon: new Icon(Icons.arrow_back)),
      //     ]
      //   ),
      // ),
      body: Container()  
    );
  }
}
