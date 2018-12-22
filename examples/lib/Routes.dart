import "package:flutter/material.dart";

import "package:examples/main.dart";
import "package:examples/page/second.dart";
import "package:examples/page/LoaderPage.dart";
import "package:examples/page/DialogsPage.dart";
import "package:examples/grid/GridViewPage.dart";
import "package:examples/grid/ListViewPage.dart";

final routes = {
  '/home': (BuildContext context) => MyApp(),
  '/first': (BuildContext context) => DialogsPage(),
  '/second': (BuildContext context) => SecondPage(),
  '/loader': (BuildContext context) => LoaderPage(),
  '/dialogs': (BuildContext context) => DialogsPage(),
  '/gridview': (BuildContext context) => GridViewPage(),
  '/listview': (BuildContext context) => ListViewPage(),
};