import "package:flutter/material.dart";

class Contents extends StatelessWidget {
  Contents(this.description);
  final String description;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          'Description',
          style: textTheme.subhead.copyWith(fontSize: 18.0)
        ),
        new SizedBox(height: 8.0),
        new Text(
          description,
          style: textTheme.body1.copyWith(fontSize: 16.0,color: Colors.black45)
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text(
              'more',
              style: textTheme.body1.copyWith(fontSize: 16.0,color: theme.accentColor)
            ),
            new Icon(
              Icons.keyboard_arrow_down,
              size: 18.0,
              color:  theme.accentColor
            )
          ],
        )
      ],
    );
  }
}