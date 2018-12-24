import "package:flutter/material.dart";
import "package:examples/widgets/input/listviewPage/otherPage.dart";

class SlidingMenu1Ex extends StatefulWidget {
  @override
  _SlidingMenu1Ex createState() => _SlidingMenu1Ex();
}

class _SlidingMenu1Ex extends State<SlidingMenu1Ex> {

  String mainImage = "https://www.tripgrida.com/img/profile/1_1448624008.jpg";
  String otherImage = "https://www.tripgrida.com/img/profile/261_1444676018.jpg";

  void switchUser() {
    String backupString = mainImage;
    this.setState((){
      mainImage = otherImage;
      otherImage = backupString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Sliding Menu Example"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("pil"),
              accountEmail: new Text("pil@tripgrida.com"),
              currentAccountPicture: new GestureDetector(
                onTap: () => switchUser(),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(mainImage),
                )
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: () => switchUser(),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(otherImage),
                  )
                )
              ],
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage("https://www.tripgrida.com/img/resource/city/95/168/thumb_1024/2y0724f76fd0bdbb7b3536585uHFjikWnXzcKhEltrFj7Q5EvbQU0rjyC.jpg")
                )
              ),
            ),
            new ListTile(
              title: new Text("First Page"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("First Page")));
              }
            ),
            new ListTile(
              title: new Text("Second Page"),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("Second Page")));
              }
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.cancel),
              onTap: () {
                Navigator.of(context).pop();
              }
            ),
          ],
        )
      ),
      body: Center(
          child: Text('page'),
      )
    );
  }
}