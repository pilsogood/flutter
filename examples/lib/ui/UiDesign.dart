import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class UiDesign extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UiDesign> {

  // https://mycolor.space/gradient3
  // https://www.grabient.com/
  // https://webkul.github.io/coolhue/

  // Color gradient1 = Color.fromRGBO(255, 197, 134, 1.0);
  // Color gradient2 = Color.fromRGBO(255, 197, 134, 1.0);
  // Color gradient3 = Color.fromRGBO(255, 89, 135, 0.9);

  // Color gradient1 = Color.fromRGBO(249, 73, 182, 0.1);
  // Color gradient2 = Color.fromRGBO(249, 73, 182, 0.1);
  // Color gradient3 = Color.fromRGBO(255, 139, 139, 0.2);

  Color gradient1 = Color.fromRGBO(0, 196, 244, 1.0);
  Color gradient2 = Color.fromRGBO(0, 196, 244, 1.0);
  Color gradient3 = Color.fromRGBO(3, 96, 120, 0.9);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // bg0(),
          // bg1(),
          // bg2(),
          box1(),
          box2(),
          box3(),
          box4(),
          box5(),

        ],
      ),
    );
  }

  Widget bg0() {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: Container(
        height: 150.0,
        width: 150.0,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 200, 183, 1.0),
        ),
      ),
    );
  }
  Widget bg1() {
    return Positioned(
            bottom: 300.0,
            right: -10.0,
            child: Container(
              height: 500.0,
              width: 500.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(250),
                    bottomRight: Radius.circular(250),
                    topLeft: Radius.circular(250),
                    topRight: Radius.circular(250)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [gradient1,gradient2,gradient3],
                  tileMode: TileMode.repeated,
                ),
              ),
            ),
          );
    }

    Widget bg2() {
      return Positioned(
            bottom: 400.0,
            right: 100.0,
            child: Container(
              height: 400.0,
              width: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(250),
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [gradient1,gradient2,gradient3],
                ),
              ),
            ),
          );
    }

    Widget box1() {
      return Positioned(
            top: 50.0,
            left: 10.0,
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [gradient1,gradient2,gradient3],
                ),
              ),
              child: Center(
                child: Icon(Icons.arrow_back, color: Colors.white),
              )
            ),
          );
    }

    Widget box2() {
      return Positioned(
            top: 50.0,
            left: 70.0,
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [gradient1,gradient2,gradient3],
                ),
              ),
            ),
          );
    }

    Widget box3() {
      return Positioned(
            top: 50.0,
            left: 130.0,
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [gradient1,gradient2,gradient3],
                ),
              ),
            ),
          );
    }

    Widget box4() {
      return Positioned(
            top: 50.0,
            left: 190.0,
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [gradient1,gradient2,gradient3],
                ),
              ),
            ),
          );
    }
    Widget box5() {
      return Positioned(
            top: 50.0,
            left: 250.0,
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [gradient1,gradient2,gradient3],
                ),
              ),
            ),
          );
    }

    Widget shimmer() {
      return Positioned(
        top: 100.0,
        left: 50.0,
        child: SizedBox(
          width: 200.0,
          height: 100.0,
          child: Shimmer.fromColors(
            baseColor: Colors.red,
            highlightColor: Colors.yellow,
            child: Text(
              'Shimmer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight:
                FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

Widget shimmerBox() {
      return Positioned(
        top: 200.0,
        left: 50.0,
        child: SizedBox(
          width: 200.0,
          height: 100.0,
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: const SizedBox(
              width: 42.0,
              height: 42.0,
              child: const DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.grey
                ),
              ),
            ),
          ),
        ),
      );
    }

}