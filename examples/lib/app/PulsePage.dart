import 'dart:math';

import 'package:flutter/material.dart';

class SpritePainter extends CustomPainter {
  final Animation<double> _animation;

  SpritePainter(this._animation) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    Color color = new Color.fromRGBO(0, 117, 194, opacity);

    double size = rect.width / 2.5;
    double area = size * size;
    double radius = sqrt(area * value / 4);

    final Paint paint = new Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = new Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}

class PulsePage extends StatefulWidget {
  @override
  SpriteDemoState createState() => new SpriteDemoState();
}

class SpriteDemoState extends State<PulsePage>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  String profileImage = r"https://www.tripgrida.com/img/profile/1_1448624008.jpg";

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
    );
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: const Text('Pulse')),
      body: new CustomPaint(
        painter: new SpritePainter(_controller),
        child: Center(
          child: SizedBox.expand(
            child: _profileImage(profileImage, 100.0, 100.0)
          )
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _startAnimation,
        child: new Icon(Icons.play_arrow),
      ),
    );
  }


// 라운드 프로필 사진 
Widget _profileImage(image, width, height) {
  return new Center(
    child: new Container(
      width: width,
      height: height,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: new NetworkImage(image)
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(47, 92, 182, 0.2),
            offset: Offset(0.0, 0.0),
            blurRadius: 10.0,
            ),
        ],
      )
    ),
  );
}

}

void main() {
  runApp(
    new MaterialApp(
      home: new PulsePage(),
    ),
  );
}