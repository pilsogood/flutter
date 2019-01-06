import "package:flutter/material.dart";
import 'package:examples/ui/movie/models.dart';

import 'package:examples/ui/movie/bannerImage.dart';
import 'package:examples/ui/movie/poster.dart';
import 'package:examples/ui/movie/rating.dart';

class Header extends StatelessWidget {
  Header(this.datas);
  final Data datas;

  List<Widget> _buildCategory(TextTheme textTheme) {
    return datas.categories.map((category) {
      return Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(category),
          labelStyle: textTheme.caption,
          backgroundColor: Colors.black12,
        )
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var information = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          datas.title,
          style: textTheme.title
        ),
        SizedBox(height: 8.0),
        Rating(datas),
        SizedBox(height: 8.0),
        new Row(children: _buildCategory(textTheme),) 
      ],
    );

    return Stack(
      children: [
        new Padding(
          padding: const EdgeInsets.only(bottom: 160.0),
          child: BannerImage(datas.image),
        ),
        new Positioned(
          bottom: 20.0,
          left: 15.0,
          right: 15.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Poster(
                datas.image,
                height: 175.0
              ),
              SizedBox(width: 16.0),
              new Expanded(child: information)
            ],
          )
        ),
      ]
    );
  }
}