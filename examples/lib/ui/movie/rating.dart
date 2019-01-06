import "package:flutter/material.dart";
import 'package:examples/ui/movie/models.dart';

class Rating extends StatelessWidget {
  Rating(this.datas);
  final Data datas;

  Widget _buildRatingBar(ThemeData theme) {
    var stars = <Widget>[];

    for(var i=1; i<=5; i++) {
      var color = i <= datas.star ? theme.accentColor : Colors.black12;
      var star = Icon(
        Icons.star,
        color: color,
      );

      stars.add(star);
    }

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var ratingStyle = textTheme.caption.copyWith(color: Colors.black45);

    var numberRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Text(datas.rating.toString(),
          style: textTheme.title.copyWith(
            fontWeight: FontWeight.w400,
            color: theme.accentColor
          )
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 4.0),
          child: new Text('Ratings',style: ratingStyle)
        )
      ],
    );

    var starRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildRatingBar(theme),
        new Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 4.0),
          child: new Text('Grating',style: ratingStyle)
        )
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        numberRating,
        SizedBox(height: 16.0,),
        starRating,
      ]
    );
  }
}