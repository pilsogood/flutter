import "package:flutter/material.dart";
import 'package:examples/ui/movie/models.dart';

class Profiles extends StatelessWidget {
  Profiles(this.peoples);
  final List<People> peoples;

  Widget _buildPeoples(BuildContext context, int index) {
     var people = peoples[index];

     return Padding(
       padding: const EdgeInsets.only(right: 16.0),
       child: Column(
         children: <Widget>[
           new CircleAvatar(
             backgroundImage: AssetImage(people.image),
             radius: 40.0,
           ),
           new Padding(
             padding: new EdgeInsets.only(top: 8.0),
             child: new Text(people.name)
            )
         ],
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
            'Peoples',
            style: textTheme.subhead.copyWith(fontSize: 18.0)
          )
        ),
        new SizedBox.fromSize(
          size: const Size.fromHeight(120.0),
          child: new ListView.builder(
            itemCount: peoples.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildPeoples,
          )
        )
      ]
    );
  }
}