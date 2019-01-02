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


Color gradientStart = Color.fromRGBO(131, 77, 155 , 1); //Change start gradient color here
Color gradientMiddle = Color.fromRGBO(207, 139, 243 , 1); //Change end gradient color here
Color gradientEnd = Color.fromRGBO(208, 78, 214 , 1); //Change end gradient color here

class _AppStatus extends State<CarouselPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // title: new Text(widget.title),
         title: new Text('test1'),
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
       
      //  decoration: new BoxDecoration(
      //       color: const Color(0xff7c94b6),
      //       gradient: new LinearGradient(colors: [gradientStart, gradientEnd],
      //           begin: const FractionalOffset(0.5, 0.0),
      //           end: const FractionalOffset(0.0, 0.5),
      //           stops: [0.0,1.0],
      //           tileMode: TileMode.clamp
      //       ),
      //   ),


      // padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
      // width: 175.0,

          child: new Container(
            height: 300.0,
            margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
            child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  // return new Image.asset(
                  //   "assets/images/intro-bg-5.jpg",
                  //   fit: BoxFit.fill,
                  // );

                    return  new Container(
                      margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 50.0),
                      child: new DecoratedBox(
                        decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.circular(20.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: new Color(0xFFF8E1FE),
                            blurRadius: 10.0,
                            offset: new Offset(0.0, 5.0),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage("assets/images/intro-bg-5.jpg"),
                          fit: BoxFit.fill,
                        )
                      ),
                   ),
                  );
                },
                itemCount: 10,
                // viewportFraction: 0.8,
                // scale: 0.9,
                itemWidth: 300.0,
                pagination: new SwiperPagination(
                  margin: EdgeInsets.all(10),
                  
                  ),
                control: new SwiperControl(
                ),
                layout: SwiperLayout.STACK,

                // itemCount: 10,
                // itemWidth: 300.0,
                // itemHeight: 400.0,
                // layout: SwiperLayout.TINDER,
              ),
      ),
    ),
    );
  }
}
