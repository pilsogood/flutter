import 'dart:ui';
import 'package:flutter/material.dart';

class PaymentUiPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PaymentUiPage> {
  int _activeIndex = 0;
  int _totalCards = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        color: Colors.teal,
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, top: 20.0),
                    child: Container(
                      height: 200,
                      child: PageView.builder(
                        onPageChanged: ((_page) {
                          setState(() {
                            _activeIndex = _page;
                          });
                        }),
                        controller: PageController(viewportFraction: 0.8),
                        itemCount: _totalCards,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: creditCardView(index),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect creditCardView(index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.white.withOpacity(0.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(17.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/mastercard.png",
                          height: 40,
                        ),
                        Expanded(child: Column()),
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        /**
                         * This card are totally fictional if it matches with yours that's pure coincidence
                         * Resolve it yourself ¯\(°_o)/¯
                         */
                        children: <Widget>[
                          Text("5500", style: TextStyle(color: Colors.white, fontSize: 20)),
                          Expanded(child: Column()),
                          Text("4726", style: TextStyle(color: Colors.white, fontSize: 20)),
                          Expanded(child: Column()),
                          Text("9983", style: TextStyle(color: Colors.white, fontSize: 20)),
                          Expanded(child: Column()),
                          Text("1283", style: TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text("Card Holder $index", style: TextStyle(color: Colors.white, fontSize: 16)),
                        Expanded(child: Column()),
                        Text("Expires", style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Text("Tom Cruise", style: TextStyle(color: Colors.white, fontSize: 20)),
                          // yeah! I understand there is image of Pm Modi, who cares Tom Cruise might gave him his cards :P
                          Expanded(child: Column()),
                          Text("11/26", style: TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paginator() {
    var pager = <Widget>[];
    for (int i = 0; i <= (_totalCards - 1); i++) {
      pager.add(
        Opacity(
          opacity: _getOpacity(i),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(backgroundColor: Colors.white, radius: 5),
          ),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(top: 20.0, left: 40.0),
      child: Row(
        children: pager,
      ),
    );
  }

  double _getOpacity(int i) {
    if (i == _activeIndex) {
      return 1.0;
    }
    return 0.5;
  }
}
