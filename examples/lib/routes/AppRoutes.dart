import "package:flutter/material.dart";

import "package:examples/main.dart";

import "package:examples/custom/Custom.dart";
import "package:examples/custom/CustomAppMenu.dart";

import "package:examples/layouts/Rows.dart";
import "package:examples/layouts/Columns.dart";
import "package:examples/layouts/Containers.dart";

import "package:examples/page/second.dart";

import "package:examples/loader/Loader.dart";
import "package:examples/loader/Loader2.dart";

import "package:examples/page/DialogsPage.dart";
import "package:examples/grid/GridViewPage.dart";
import "package:examples/grid/ListViewPage.dart";

// widgets
import "package:examples/widgets/basic/FlutterLogoEx.dart";
import "package:examples/widgets/basic/TextEx.dart";

import "package:examples/widgets/basic/IconEx.dart";
import "package:examples/widgets/basic/ImageEx.dart";

import "package:examples/widgets/button/CardEx.dart";
import "package:examples/widgets/button/DropdownButtonEx.dart";
import "package:examples/widgets/button/FlatButtonEx.dart";
import "package:examples/widgets/button/FloatingActionButtonEx.dart";
import "package:examples/widgets/button/FloatingActionButtonCenterEx.dart";

import "package:examples/widgets/button/IconButtonEx.dart";
import "package:examples/widgets/button/PopupMenuButtonEx.dart";
import "package:examples/widgets/button/RaisedButtonEx.dart";
import "package:examples/widgets/button/FooterButtonEx.dart";

import "package:examples/widgets/input/CheckboxEx.dart";
import "package:examples/widgets/input/RadioEx.dart";
import "package:examples/widgets/input/SliderEx.dart";
import "package:examples/widgets/input/SwitchEx.dart";
import "package:examples/widgets/input/TextFieldEx.dart";
import "package:examples/widgets/input/DatePickerEx.dart";

import "package:examples/widgets/layout/ColumnEx.dart";
import "package:examples/widgets/layout/RowEx.dart";
import "package:examples/widgets/layout/ContainerEx.dart";
import "package:examples/widgets/layout/StackEx.dart";

import "package:examples/widgets/layout/AlignEx.dart";
import "package:examples/widgets/layout/CenterEx.dart";
import "package:examples/widgets/layout/DividerEx.dart";
import "package:examples/widgets/layout/ExpandedEx.dart";
import "package:examples/widgets/layout/FractionallySizedBoxEx.dart";
import "package:examples/widgets/layout/FractionalTranslationEx.dart";
import "package:examples/widgets/layout/PaddingEx.dart";
import "package:examples/widgets/layout/PositionedEx.dart";
import "package:examples/widgets/layout/ScaffoldEx.dart";

import "package:examples/widgets/layout/MaterialAppEx.dart";
import "package:examples/widgets/layout/SizedBoxEx.dart";

import "package:examples/widgets/navigator/AppBarEx.dart";
import "package:examples/widgets/navigator/TabBarEx.dart";
import "package:examples/widgets/navigator/TabBarViewEx.dart";
import "package:examples/widgets/navigator/BottomNavigationBarEx.dart";
import "package:examples/widgets/navigator/BottomSheetsEx.dart";
import "package:examples/widgets/navigator/BottomNavigationBarItemEx.dart";
import "package:examples/widgets/navigator/ChangingIconEx.dart";
import "package:examples/widgets/navigator/SnackBarEx.dart";

import "package:examples/widgets/styling/ClipOvalEx.dart";
import "package:examples/widgets/styling/LinearGradientEx.dart";
import "package:examples/widgets/styling/OpacityEx.dart";
import "package:examples/widgets/styling/RadialGradientEx.dart";
import "package:examples/widgets/styling/RotatedBoxEx.dart";
import "package:examples/widgets/styling/ThemeEx.dart";

import "package:examples/widgets/view/GridViewCountEx.dart";
import "package:examples/widgets/view/GridViewExtentEx.dart";
import "package:examples/widgets/view/ListViewEx.dart";
import "package:examples/widgets/view/ListViewWithListEx.dart";
import "package:examples/widgets/view/ListViewWithMapEx.dart";
import "package:examples/widgets/view/SingleChildScrollViewEx.dart";
import "package:examples/widgets/view/HorizontalListViewEx.dart";
import "package:examples/widgets/view/HorizontalListViewFullEx.dart";

import "package:examples/widgets/navigator/SlidingMenu1Ex.dart";
import "package:examples/widgets/navigator/SlidingMenu2Ex.dart";

import "package:examples/widgets/request/httpRequest.dart";
import "package:examples/widgets/request/jsonStorage.dart";

import "package:examples/widgets/dialogs/AlertDialogEx.dart";
import "package:examples/widgets/dialogs/SimpleDialogEx.dart";

import "package:examples/widgets/view/ChatEx.dart";
import "package:examples/widgets/view/MapEx.dart";


// app class 
import "package:examples/app/Intro.dart";

final routes = {
  '/intro': (BuildContext context) => Intro(),
  

  '/home': (BuildContext context) => MyApp(),
  
  '/custom': (BuildContext context) => Custom(),
  '/custommenu': (BuildContext context) => CustomAppMenu(),

  '/rows': (BuildContext context) => Rows(),
  '/columns': (BuildContext context) => Columns(),
  '/containers': (BuildContext context) => Containers(),
  
  '/first': (BuildContext context) => DialogsPage(),
  '/second': (BuildContext context) => SecondPage(),
  '/loader': (BuildContext context) => Loader(),
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
  '/flatactionbuttoncenter': (BuildContext context) => FloatingActionButtonCenterEx(),
  '/iconbutton': (BuildContext context) => IconButtonEx(),
  '/popupmenubutton': (BuildContext context) => PopupMenuButtonEx(),
  '/raisedbutton': (BuildContext context) => RaisedButtonEx(),
  '/footerbutton': (BuildContext context) => FooterButtonEx(),

  '/checkbox': (BuildContext context) => CheckboxEx(),
  '/radio': (BuildContext context) => RadioEx(),
  '/slider': (BuildContext context) => SliderEx(),
  '/switch': (BuildContext context) => SwitchEx(),
  '/textfield': (BuildContext context) => TextFieldEx(),
  '/datepicker': (BuildContext context) => DatePickerEx(),

  '/stack': (BuildContext context) => StackEx(),
  '/scafford': (BuildContext context) => ScaffoldEx(title: "Scaffold Example"),
  '/materialapp': (BuildContext context) => MaterialAppEx(),

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
  '/bottomsheets': (BuildContext context) => BottomSheetsEx(),
  '/bottomnavigationbaritem': (BuildContext context) => BottomNavigationBarItemEx(),
  '/tabbarview': (BuildContext context) => TabBarViewEx(),
  '/tabbar': (BuildContext context) => TabBarEx(),
  '/changingicon': (BuildContext context) => ChangingIconEx(),

  '/snackbar': (BuildContext context) => SnackBarEx(),

  '/clipoval': (BuildContext context) => ClipOvalEx(),
  '/lineargradient': (BuildContext context) => LinearGradientEx(),
  '/opacity': (BuildContext context) => OpacityEx(),
  '/radialgradient': (BuildContext context) => RadialGradientEx(),
  '/rotatedbox': (BuildContext context) => RotatedBoxEx(),
  '/theme': (BuildContext context) => ThemeEx(),

  '/gridviewcount': (BuildContext context) => GridViewCountEx(),
  '/gridviewextent': (BuildContext context) => GridViewExtentEx(),
  '/listview': (BuildContext context) => ListViewEx(),
  '/listviewwithlist': (BuildContext context) => ListViewWithListEx(),
  '/listviewwithmap': (BuildContext context) => ListViewWithMapEx(),
  '/singlechildscrollview': (BuildContext context) => SingleChildScrollViewEx(),
  '/horizontallistview': (BuildContext context) => HorizontalListViewEx(),
  '/horizontallistviewfull': (BuildContext context) => HorizontalListViewFullEx(),

  '/slidingmenu1': (BuildContext context) => SlidingMenu1Ex(),
  '/slidingmenu2': (BuildContext context) => SlidingMenu2Ex(),

  '/httprequest': (BuildContext context) => HttpRequest(),
  '/jsonstorage': (BuildContext context) => JsonStorage(),

  '/loader1': (BuildContext context) => Loader(),
  '/loader2': (BuildContext context) => Loader2(),


  '/alertdialog': (BuildContext context) => AlertDialogEx(),
  '/simpledialog': (BuildContext context) => SimpleDialogEx(),

  '/chat': (BuildContext context) => ChatEx(),
  '/map': (BuildContext context) => MapEx(),
  
};