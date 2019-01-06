import "package:flutter/material.dart";
import 'package:examples/ui/movie/models.dart';

// Widgets
import 'package:examples/ui/movie/header.dart';
import 'package:examples/ui/movie/contents.dart';

import 'package:examples/ui/movie/pictures.dart';
import 'package:examples/ui/movie/profiles.dart';

class Detail extends StatelessWidget {
  Detail(this.datas);
  final Data datas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            Header(datas),
            new Padding(
              padding: const EdgeInsets.all(20.0),
              child:  Contents(datas.description)
            ),
            new Divider(),
            Pictures(datas.pictures),
            new Divider(),
            Profiles(datas.peoples),
            new Divider(),
          ],
        )
      )
    );
  }
}