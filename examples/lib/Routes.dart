import "package:flutter/material.dart";

import "package:example/main.dart";
import "package:example/page/second.dart";
import "package:example/page/LoaderPage.dart";
import "package:example/page/DialogsPage.dart";
import "package:example/grid/GridViewPage.dart";
import "package:example/grid/ListViewPage.dart";

final routes = {
  '/home': (BuildContext context) => MyApp(),
  '/first': (BuildContext context) => DialogsPage(),
  '/second': (BuildContext context) => SecondPage(),
  '/loader': (BuildContext context) => LoaderPage(),
  '/dialogs': (BuildContext context) => DialogsPage(),
  '/gridview': (BuildContext context) => GridViewPage(),
  '/listview': (BuildContext context) => ListViewPage(),
};