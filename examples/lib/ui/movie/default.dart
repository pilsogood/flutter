import "package:flutter/material.dart";
import 'package:examples/ui/movie/models.dart';

class Rating extends StatelessWidget {
  Rating(this.datas);
  final Data datas;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        new Column(
          children: <Widget>[
          ],
        )
      ]
    );
  }
}