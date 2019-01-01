import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// void main() => runApp(new CarouselPage());

// class CarouselPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class CarouselPage extends StatefulWidget {

  // CarouselPage({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _AppStatus createState() => _AppStatus();
}


// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

class _AppStatus extends State<CarouselPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // title: new Text(widget.title),
         title: new Text('test'),
      ),
    body: 
    // new Swiper(
    //     itemBuilder: (BuildContext context,int index){
    //       return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
    //     },
    //     itemCount: 3,
    //     pagination: new SwiperPagination(),
    //     control: new SwiperControl(),
    //   ),
    new Container(
      height: 175.0,
      // width: 175.0,
          child:
          new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    "http://via.placeholder.com/288x188",
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 10,
                viewportFraction: 0.8,
                scale: 0.9,
              ),
      ),
    );
  }
}
