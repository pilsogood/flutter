import "package:flutter/material.dart";

class Poster extends StatelessWidget {
  static const POSTER_RATIO = 0.7;

  Poster(this.image, {this.height = 100.0} );
  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;

    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(5.0),
      shadowColor: Colors.black45,
      elevation: 5.0,
      child: Image.asset(
          image,
          width: width,
          height: height,
          fit: BoxFit.cover,
        )
    );
  }
}
