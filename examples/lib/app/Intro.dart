import "package:flutter/material.dart";
import 'package:splashscreen/splashscreen.dart';
import 'package:examples/app/ProfilePage.dart';
import 'package:examples/app/ContentsPage.dart';
import 'package:examples/app/SliderPage.dart';
import 'package:examples/app/StickyListPage.dart';
import 'package:examples/app/SettingsPage.dart';
import 'package:examples/app/CarouselPage.dart';
import 'package:examples/app/TabPage.dart';
import 'package:examples/app/MapPage.dart';
import 'package:examples/app/PulsePage.dart';
import 'package:examples/app/ChatPage.dart';
import 'package:examples/app/TimelinePage.dart';
import 'package:examples/app/PlannerPage.dart';

class Intro extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

// Color gradientStart = Colors.deepPurple[500]; //Change start gradient color here
// Color gradientEnd = Colors.purple[100]; //Change end gradient color here

Color gradientStart = Color.fromRGBO(131, 77, 155 , 1); //Change start gradient color here
Color gradientMiddle = Color.fromRGBO(207, 139, 243 , 1); //Change end gradient color here
Color gradientEnd = Color.fromRGBO(208, 78, 214 , 1); //Change end gradient color here

class _AppStatus extends State<Intro> {
  
  final userId = TextEditingController();
  final userPassword = TextEditingController();

  String _userId = "";
  String _userPassword = "";

  @override
  Widget build(BuildContext context) {
    double logoWidth = MediaQuery.of(context).size.width; 

    return new Scaffold(
      body: new Container(
      padding: const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      decoration: new BoxDecoration(
            color: const Color(0xff7c94b6),
            gradient: new LinearGradient(colors: [gradientStart, gradientEnd],
                begin: const FractionalOffset(0.5, 0.0),
                end: const FractionalOffset(0.0, 0.5),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp
            ),
            image : new DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
              image: new AssetImage('assets/images/intro-bg-3.jpg'),
              fit: BoxFit.cover
            ),
        ),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                new Image.asset('assets/images/tripgrida-logo.png', 
                  fit: BoxFit.cover, 
                  alignment: Alignment.center, 
                  width: logoWidth * 0.45
                ),
                // new Padding(padding: new EdgeInsets.all(10.0),),
                const SizedBox(height: 50.0),
                new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.white,
                    primaryColorDark: Colors.white,
                    hintColor: Colors.white
                  ),
                 child: new Container(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: new Column(
                    children: <Widget>[
                        new TextField(
                        controller: userId,
                        decoration: new InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(const Radius.circular(25.0)),
                            borderSide: new BorderSide(color:Colors.white)
                          ),
                          contentPadding: const EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 13.0),
                          filled: true,
                          labelText: 'USERID',
                          // hintText: 'USERID',
                          // icon: new Icon(Icons.people)
                        ),
                        
                        autocorrect: true,
                        // autofocus: true,
                        // obscureText: true,
                        textAlign: TextAlign.center,
                        // maxLength: 100,
                        maxLines: 1,
                        // enabled: true,
                        style: new TextStyle(fontSize: 18.0, color: Colors.white),
                        // inputFormatters: ,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 25.0),
                      new TextField(
                        // controller: userId,
                        decoration: new InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(const Radius.circular(25.0)),
                            gapPadding: 2.0,
                            
                            borderSide: new BorderSide(
                              color: Colors.white
                            )
                          ),
                          contentPadding: const EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 13.0),
                          filled: true,
                          // fillColor: Colors.grey[100],
                          labelText: 'PASSWORD',
                          labelStyle: new TextStyle(color: Colors.white)
                          // hintText: 'PASSWORD',
                          // icon: new Icon(Icons.people)
                          
                        ),
                      
                        autocorrect: true,
                        // autofocus: true,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        // maxLength: 100,
                        maxLines: 1,
                        // enabled: true,
                        style: new TextStyle(fontSize: 18.0, color: Colors.white),
                        // inputFormatters: ,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 25.0),
                      new Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new RaisedButton(
                              color: Colors.white,
                              colorBrightness: Brightness.light,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)
                              ),
                              child: new Text(
                                'LOG IN',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => new CheckUser()));
                              }, 
                            ),
                            const SizedBox(width: 25.0),
                            new RaisedButton(
                              color: Colors.white,
                              colorBrightness: Brightness.light,
                              
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)
                              ),
                              child: new Text(
                                'SIGN UP',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () => {}, 
                            ),
                          ],
                        ),
                      )
                     
                    ],
                  )
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
      
class CheckUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      child: SplashScreen(
      seconds: 1, 
      navigateAfterSeconds: new AfterSplash(),
      title: 
        new Text('Welcome to TRIPGRIDA',
          style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        )
      ), 
      image: new Image.network("https://www.tripgrida.com/img/resource/city/95/168/thumb_1024/2y0724f76fd0bdbb7b3536585uHFjikWnXzcKhEltrFj7Q5EvbQU0rjyC.jpg"),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("Clicked!"),
      loaderColor: Colors.red,
      ),
    );
  }
}


class AfterSplash extends StatelessWidget {

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: AppBar(
      //     title: new Text('welcome'),
      //     automaticallyImplyLeading: false,
      // ),
      body: new Container(
         decoration: new BoxDecoration(
            image : new DecorationImage(
              image: new AssetImage('assets/images/intro-bg-2.jpg'),
              fit: BoxFit.cover
            ),
            gradient: new LinearGradient(colors: [gradientStart, gradientEnd],
                begin: const FractionalOffset(0.5, 0.0),
                end: const FractionalOffset(0.0, 0.5),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp
            ),
        ),
        child: new Center(
          child: new Column (
            children: <Widget>[
              new  Text(
                  'Hello Gradients!',
                   style: new TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient
                  ),
              ),
              new Row(
                children: <Widget>[
                  new FlatButton(
                    child: new Text('Profile Page',
                    style: new TextStyle(
                      color: Colors.white
                    )
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new ProfilePage())),
                  ),
                  new FlatButton(
                    child: new Text('Contents Page',
                    style: new TextStyle(
                      color: Colors.white
                    )
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new ContentsPage())),
                  ),
                  new FlatButton(
                    child: new Text('Slider Page',
                    style: new TextStyle(
                      color: Colors.white
                    )
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new SliderPage())),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  
                  new FlatButton(
                    child: new Text('StickyList Page',
                    style: new TextStyle(
                      color: Colors.white
                    )
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new StickyListPage())),
                  ),

                  new FlatButton(
                    child: new Text('Settings Page',
                    style: new TextStyle(
                      color: Colors.white
                    )
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new SettingsPage())),
                  ),

                  new FlatButton(
                    child: new Text('Carousel Page',
                    style: new TextStyle(
                      color: Colors.white
                    )
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new CarouselPage())),
                  ),

                ],
              ),
              new Row(
                children: <Widget>[
                  
                  new FlatButton(
                    child: new Text('Tab Page',
                    style: new TextStyle(
                      color: Colors.white
                    )
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new TabPage())),
                  ),
                  new FlatButton(
                    child: new Text('Map Page',
                    style: new TextStyle(
                      color: Colors.white
                    )
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new MapPage())),
                  ),
                  new FlatButton(
                    child: new Text('Pulse Page',
                    style: new TextStyle(
                      color: Colors.white
                    )
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new PulsePage())),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  
                  new FlatButton(
                    child: new Text('Timline',
                    style: new TextStyle(
                      color: Colors.white
                    )
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new TimelinePage())),
                  ),

                  new FlatButton(
                    child: new Text('Chat Page',
                    style: new TextStyle(
                      color: Colors.white
                    )
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new ChatPage())),
                  ),
              
                  new FlatButton(
                    child: new Text('Plan Page',
                    style: new TextStyle(
                      color: Colors.white
                    )
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new PlannerPage())),
                  ),

                ],
              )
            ],
          )
          
      ),
      )
    );
  }
}