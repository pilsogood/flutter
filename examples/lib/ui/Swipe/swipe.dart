import 'package:flutter/material.dart';
import 'package:examples/ui/Swipe/cards.dart';
import 'package:examples/ui/Swipe/matching.dart';
import 'package:examples/ui/Swipe/model.dart';

final MatchEngine matchEngine = MatchEngine(
  matches: demoProfiles.map((Profile profile) {
    return Matching(profile: profile);
  }).toList(),
);

class Swipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColorBrightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: new Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {  
  Widget _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(
          Icons.home,
          color : Colors.grey,
          size: 40.0
        ),
        onPressed: () {},
      ),
      title: Text("TINDER"),
      actions: <Widget> [
        IconButton(
          icon: Icon(
            Icons.chat_bubble,
            color : Colors.grey,
            size: 40.0
          ),
          onPressed: () {},
        )
      ]
    );
  }

  Widget _buildBottombar() {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: new Padding(
        padding: EdgeInsets.all(16.0),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RoundIconButton.small(
              icon: Icons.refresh,
              iconColor: Colors.orange,
              onPressed: () {
               
              },
            ),
            RoundIconButton.large(
              icon: Icons.clear,
              iconColor: Colors.red,
              onPressed: () { 
                 matchEngine.currentMatch.nope();
              },
            ),
            RoundIconButton.small(
              icon: Icons.star,
              iconColor: Colors.green,
              onPressed: () {
                 matchEngine.currentMatch.superlike();
              },
            ),
            RoundIconButton.large(
              icon: Icons.favorite,
              iconColor: Colors.purple,
              onPressed: () {
                 matchEngine.currentMatch.like();
              },
            ),
            RoundIconButton.small(
              icon: Icons.lock,
              iconColor: Colors.teal,
              onPressed: () {},
            ),
          ],
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: _buildAppbar(),
      body: new CardStack(
        matchEngine: matchEngine
      ),
      bottomNavigationBar: _buildBottombar(),      
    );
  }
}



class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final VoidCallback onPressed;

  RoundIconButton.large({
    this.icon,
    this.iconColor,
    this.onPressed
  }) : size = 60.0;

  RoundIconButton.small({
    this.icon,
    this.iconColor,
    this.onPressed
  }) : size = 50.0;

  RoundIconButton({
    this.icon,
    this.iconColor,
    this.size,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10.0
          )
        ]
      ),
      child: new RawMaterialButton(
        shape: CircleBorder(),
        elevation: 0.0,
        child: new Icon(
          icon,
          color: iconColor
        ),
        onPressed: onPressed,
        )
    );
  }
}