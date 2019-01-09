import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dart:math';
import 'model.dart';

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
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}


class _HomePageState extends State<HomePage>  
  with TickerProviderStateMixin {  
  
  AnimationController _controller;
  Animation _animation;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              onPressed: () {},
            ),
            RoundIconButton.large(
              icon: Icons.clear,
              iconColor: Colors.red,
              onPressed: () {},
            ),
            RoundIconButton.small(
              icon: Icons.star,
              iconColor: Colors.green,
              onPressed: () {},
            ),
            RoundIconButton.large(
              icon: Icons.favorite,
              iconColor: Colors.purple,
              onPressed: () {},
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
      bottomNavigationBar: _buildBottombar(),
      body: ProfileCard()
    );
  }

}

// 카드 
class ProfileCard extends StatefulWidget {

  final Profile profile;
  ProfileCard({
    Key key,
    this.profile
  }) : super(key: key);

  @override
  _ProfileCardState createState() => new _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {

  Widget _buildBackground() {
    return new Image.asset(
      'assest/images/intro-bg-1.png',
      fit: BoxFit.cover
    );
  }

  Widget _buildProfile() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.8)
            ]
          )
        ),
        padding: EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    // widget.profile.name,
                    'Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0
                    )
                  ),
                  Text(
                    // widget.profile.bio,
                    'Bio',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0
                    )
                  ),
                ],
              )
            ),
            Icon(
              Icons.info,
              color: Colors.white
            )
          ],
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0x11000000),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(10.0),
        child: new Material(
          child: new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildBackground(),
              _buildProfile(),
            ],
          ),
        ),
      ),
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