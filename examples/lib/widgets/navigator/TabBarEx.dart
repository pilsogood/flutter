import "package:flutter/material.dart";
import "package:examples/widgets/navigator/tabBarPage/tab1.dart" as tab1;
import "package:examples/widgets/navigator/tabBarPage/tab2.dart" as tab2;
import "package:examples/widgets/navigator/tabBarPage/tab3.dart" as tab3;

class TabBarEx extends StatefulWidget {
  @override
  _TabBarEx createState() => new _TabBarEx();
}

class _TabBarEx extends State<TabBarEx> with SingleTickerProviderStateMixin {
  
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("TabBar Example"),
        backgroundColor: Colors.deepOrange,
        bottom: new TabBar(
        controller: controller,
        tabs: <Tab> [
          new Tab(icon: new Icon(Icons.arrow_forward)),
          new Tab(icon: new Icon(Icons.arrow_downward)),
          new Tab(icon: new Icon(Icons.arrow_back)),
        ]
        )
      ),
      bottomNavigationBar: new Material(
        color: Colors.deepOrange,
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.arrow_forward)),
            new Tab(icon: new Icon(Icons.arrow_downward)),
            new Tab(icon: new Icon(Icons.arrow_back)),
          ]
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
            new tab1.tab1(),
            new tab2.tab2(),
            new tab3.tab3(),
        ]
      ),
    );
  }
}