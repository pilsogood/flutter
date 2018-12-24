import "package:flutter/material.dart";

class TestStore extends StatelessWidget {
  static String routeName = "testStore";

  @override 
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Welcome ma Store!!")
    );
  }
}

class App extends StatelessWidget {
  static String routeName = "testStore";

  @override 
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder> {
      TestStore.routeName: (BuildContext context) => new TestStore(),
    };

    return new MaterialApp(
      title: "Test Store",
      home: new SlidingMenu2Ex(title: "TEST PAGE"),
      routes: routes
    );
  }
}

class SlidingMenu2Ex extends StatefulWidget {
    final String title;
    SlidingMenu2Ex({Key key, this.title}) : super(key: key);

    @override
  _SlidingMenu2Ex createState() => _SlidingMenu2Ex();
}

class _SlidingMenu2Ex extends State<SlidingMenu2Ex> {

  @override
  Widget build(BuildContext context) {

    var headerText = new Text("headers");
    var header = new DrawerHeader(child: headerText);
    var item1Text = new Text("Stores");
    var item1Icon = new Icon(Icons.settings);

    var item1 = new ListTile(
      title: item1Text,
      leading: item1Icon,
      onTap: _onItem1Ontap
    );
    var children = [header, item1];
    var listView = new ListView(children: children);
    var drawer = new Drawer(child: listView);

    return Scaffold(
      appBar: AppBar(
        title: new Text("Sliding Menu Example"),
      ),
      body: Center(
          child: Text(''),
      ),
      drawer: drawer,
    );

  }
  void _onItem1Ontap() {
    Navigator.popAndPushNamed(context, TestStore.routeName);
  }
}