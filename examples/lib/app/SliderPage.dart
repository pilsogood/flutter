import "package:flutter/material.dart";
import 'package:intro_slider/intro_slider.dart';

class SliderPage extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}


class _AppStatus extends State<SliderPage> {

  List<Slide> slides = new List();

  @override 
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: 'A',
        description: 'A description',
        pathImage: 'assets/images/intro-bg-5.jpg',
        backgroundColor: Color(0xfff5a623)
      ),
    );

   slides.add(
      new Slide(
        title: 'A',
        description: 'A description',
        pathImage: 'assets/images/intro-bg-6.jpg',
        backgroundColor: Color(0xff203152),
        colorBegin: Color(0xffFFFACD),
        colorEnd: Color(0xffFF6347),
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );

   slides.add(
      new Slide(
        title: 'A',
        description: 'A description',
        pathImage: 'assets/images/intro-bg-7.jpg',
        backgroundColor: Color(0xff9932CC)
      ),
    );
  }

  void onDonePress() {}
  void onSkipPress() {}

  @override
  Widget build(BuildContext context) {

    return new IntroSlider(
      slides:  this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress
    );
  }
}

