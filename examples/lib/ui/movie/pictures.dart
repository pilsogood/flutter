import "package:flutter/material.dart";

class Pictures extends StatelessWidget {
  Pictures(this.pictures);
  final List<String> pictures;

  Widget _buildPictures(BuildContext context, int index) {
     var picture = pictures[index];
     return Padding(
       padding: const EdgeInsets.only(right: 16.0),
       child: ClipRRect(
         borderRadius: BorderRadius.circular(4.0),
         child: Image.asset(
           picture,
           width: 160.0,
           height: 120.0,
           fit: BoxFit.cover
          )
       )
     );
  }
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: new Text(
            'Pictures',
            style: textTheme.subhead.copyWith(fontSize: 18.0)
          )
        ),
        new SizedBox.fromSize(
          size: const Size.fromHeight(100.0),
          child: new ListView.builder(
            itemCount: pictures.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildPictures,
          )
        )
      ]
    );
  }
}