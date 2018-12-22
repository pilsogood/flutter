import "package:flutter/material.dart";

import "package:example/main.dart";

import "package:example/custom/Custom.dart";
import "package:example/custom/CustomAppMenu.dart";

import "package:example/layouts/Rows.dart";
import "package:example/layouts/Columns.dart";
import "package:example/layouts/Containers.dart";

import "package:example/page/second.dart";
import "package:example/page/LoaderPage.dart";
import "package:example/page/DialogsPage.dart";
import "package:example/grid/GridViewPage.dart";
import "package:example/grid/ListViewPage.dart";

// widgets
import "package:example/widgets/basic/FlutterLogoEx.dart";
import "package:example/widgets/basic/TextEx.dart";

import "package:example/widgets/assets/IconEx.dart";
import "package:example/widgets/assets/ImageEx.dart";

import "package:example/widgets/button/CardEx.dart";
import "package:example/widgets/button/DropdownButtonEx.dart";
import "package:example/widgets/button/FlatButtonEx.dart";
import "package:example/widgets/button/FloatingActionButtonEx.dart";
import "package:example/widgets/button/IconButtonEx.dart";
import "package:example/widgets/button/PopupMenuButtonEx.dart";
import "package:example/widgets/button/RaisedButtonEx.dart";

import "package:example/widgets/input/CheckboxEx.dart";
import "package:example/widgets/input/RadioEx.dart";
import "package:example/widgets/input/SliderEx.dart";
import "package:example/widgets/input/SwitchEx.dart";
import "package:example/widgets/input/TextFieldEx.dart";


import "package:example/widgets/layout/ColumnEx.dart";
import "package:example/widgets/layout/RowEx.dart";
import "package:example/widgets/layout/ContainerEx.dart";
import "package:example/widgets/layout/StackEx.dart";

import "package:example/widgets/layout/AlignEx.dart";
import "package:example/widgets/layout/CenterEx.dart";
import "package:example/widgets/layout/DividerEx.dart";
import "package:example/widgets/layout/ExpandedEx.dart";
import "package:example/widgets/layout/FractionallySizedBoxEx.dart";
import "package:example/widgets/layout/FractionalTranslationEx.dart";
import "package:example/widgets/layout/PaddingEx.dart";
import "package:example/widgets/layout/PositionedEx.dart";
import "package:example/widgets/layout/ScaffoldEx.dart";
import "package:example/widgets/layout/SizedBoxEx.dart";

import "package:example/widgets/navigator/AppBarEx.dart";
import "package:example/widgets/navigator/TabBarEx.dart";
import "package:example/widgets/navigator/TabBarViewEx.dart";
import "package:example/widgets/navigator/BottomNavigationBarEx.dart";
import "package:example/widgets/navigator/BottomNavigationBarItemEx.dart";

import "package:example/widgets/styling/ClipOvalEx.dart";
import "package:example/widgets/styling/LinearGradientEx.dart";
import "package:example/widgets/styling/OpacityEx.dart";
import "package:example/widgets/styling/RadialGradientEx.dart";
import "package:example/widgets/styling/RotatedBoxEx.dart";
import "package:example/widgets/styling/ThemeEx.dart";

import "package:example/widgets/view/GridViewCountEx.dart";
import "package:example/widgets/view/GridViewExtentEx.dart";
import "package:example/widgets/view/ListViewEx.dart";
import "package:example/widgets/view/SingleChildScrollViewEx.dart";


final routes = {
  '/home': (BuildContext context) => MyApp(),
  
  '/custom': (BuildContext context) => Custom(),
  '/custommenu': (BuildContext context) => CustomAppMenu(),

  '/rows': (BuildContext context) => Rows(),
  '/columns': (BuildContext context) => Columns(),
  '/containers': (BuildContext context) => Containers(),
  
  '/first': (BuildContext context) => DialogsPage(),
  '/second': (BuildContext context) => SecondPage(),
  '/loader': (BuildContext context) => LoaderPage(),
  '/dialogs': (BuildContext context) => DialogsPage(),
  '/gridview': (BuildContext context) => GridViewPage(),
  '/listview2': (BuildContext context) => ListViewPage(),

  // widget 

  '/flutterLogo': (BuildContext context) => FlutterLogoEx(),
  '/text': (BuildContext context) => TextEx(),

  '/icon': (BuildContext context) => IconEx(),
  '/image': (BuildContext context) => ImageEx(),

  '/card': (BuildContext context) => CardEx(),
  '/dropdownbutton': (BuildContext context) => DropdownButtonEx(),
  '/flatbutton': (BuildContext context) => FlatButtonEx(),
  '/flatactionbutton': (BuildContext context) => FloatingActionButtonEx(),
  '/iconbutton': (BuildContext context) => IconButtonEx(),
  '/popupmenubutton': (BuildContext context) => PopupMenuButtonEx(),
  '/raisedbutton': (BuildContext context) => RaisedButtonEx(),

  '/checkbox': (BuildContext context) => CheckboxEx(),
  '/radio': (BuildContext context) => RadioEx(),
  '/slider': (BuildContext context) => SliderEx(),
  '/switch': (BuildContext context) => SwitchEx(),
  '/textfield': (BuildContext context) => TextFieldEx(),

  '/stack': (BuildContext context) => StackEx(),
  '/scafford': (BuildContext context) => ScaffoldEx(),
  '/sizedbox': (BuildContext context) => SizedBoxEx(),
  '/row': (BuildContext context) => RowEx(),
  '/column': (BuildContext context) => ColumnEx(),
  '/positioned': (BuildContext context) => PositionedEx(),
  '/padding': (BuildContext context) => PaddingEx(),
  '/align': (BuildContext context) => AlignEx(),
  '/fractionaltranslation': (BuildContext context) => FractionalTranslationEx(),
  '/fractionallysizedbox': (BuildContext context) => FractionallySizedBoxEx(),
  '/expanded': (BuildContext context) => ExpandedEx(),
  '/divider': (BuildContext context) => DividerEx(),
  '/container': (BuildContext context) => ContainerEx(),
  '/center': (BuildContext context) => CenterEx(),


  '/appbar': (BuildContext context) => AppBarEx(),
  '/bottomnavigationbar': (BuildContext context) => BottomNavigationBarEx(),
  '/bottomnavigationbaritem': (BuildContext context) => BottomNavigationBarItemEx(),
  '/tabbarview': (BuildContext context) => TabBarViewEx(),
  '/tabbar': (BuildContext context) => TabBarEx(),

  '/clipoval': (BuildContext context) => ClipOvalEx(),
  '/lineargradient': (BuildContext context) => LinearGradientEx(),
  '/opacity': (BuildContext context) => OpacityEx(),
  '/radialgradient': (BuildContext context) => RadialGradientEx(),
  '/rotatedbox': (BuildContext context) => RotatedBoxEx(),
  '/theme': (BuildContext context) => ThemeEx(),

  '/gridviewcount': (BuildContext context) => GridViewCountEx(),
  '/gridviewextent': (BuildContext context) => GridViewExtentEx(),
  '/listview': (BuildContext context) => ListViewEx(),
  '/singlechildscrollview': (BuildContext context) => SingleChildScrollViewEx(),

};