import "package:flutter/material.dart";
import 'package:transparent_image/transparent_image.dart';

class ProfilePage extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

// Color gradientStart = Colors.deepPurple[500]; //Change start gradient color here
// Color gradientEnd = Colors.purple[100]; //Change end gradient color here

Color gradientStart = Color.fromRGBO(131, 77, 155 , 1); //Change start gradient color here
Color gradientMiddle = Color.fromRGBO(207, 139, 243 , 1); //Change end gradient color here
Color gradientEnd = Color.fromRGBO(208, 78, 214 , 1); //Change end gradient color here

class _AppStatus extends State<ProfilePage> {
  
  double cWidth = 0.0;
  double itemHeight = 28.0;
  double itemsCount = 20;
  double screenWidth;

  final userId = TextEditingController();
  final userPassword = TextEditingController();

  final controller = ScrollController();

  
  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  onScroll() {
    setState(() {
     cWidth = controller.offset * screenWidth / (itemHeight * itemsCount);
    });
  }

  @override
  void dispose() {
    controller.removeListener(onScroll);
  }

  @override
  Widget build(BuildContext context) {
    
    screenWidth = MediaQuery.of(context).size.width;
    
    return new Scaffold(
      body:  
      SafeArea(
        top:false,
        bottom:true,
        child: 
      new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // new CustomAppBar('test'),              
          new Flexible(
            // child: _peoples(controller),
            child: _testMenu(controller,200.0)
          ) 
        ],
      ),
      )
    );
  }
}


class CustomAppBar extends StatelessWidget {

  final String title;
  final double barHeight = 280.0; // change this for different heights 

  CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      // color: Colors.teal,
      decoration: new BoxDecoration(
        border: new Border.all(width: 1.0, color: Colors.transparent),
        // shape: BoxShape.circle,
        color: const Color(0xff7c94b6),
        image: new DecorationImage(
          colorFilter: new ColorFilter.mode(Colors.black38.withOpacity(0.5), BlendMode.srcATop),
          image: new AssetImage('assets/images/intro-bg-18.jpg'),
          fit: BoxFit.cover,
          alignment: Alignment(0.0, 1.0),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, -10.0),
            blurRadius: 20.0,
          ),
       ],
      ),
      child: 
      new Stack(
        children: <Widget>[
            // Center(child: CircularProgressIndicator()),
            // Center(
            //   child: FadeInImage.memoryNetwork(
            //     placeholder: kTransparentImage,
            //     image:
            //         'https://www.tripgrida.com/img/profile/1_1448624008.jpg',
            //     width:80.0, 
            //     height: 80.0
            //   ),
            // ),

            //  Center(
            //   child: new ClipRRect(
            //     borderRadius: new BorderRadius.circular(100.0),
            //     clipBehavior: Clip.hardEdge,
            //     child: Image.network(
            //       'https://www.tripgrida.com/img/profile/1_1448624008.jpg',
            //       height: 85.0,
            //       width: 85.0,
            //     ),
            //   ),
            // ),

            // Center(
            //   child: FadeInImage.assetNetwork(
            //     placeholder: 'assets/loading/loading1.gif',
            //     image:
            //         'https://www.tripgrida.com/img/profile/1_1448624008.jpg',
            //     width:80.0, 
            //     height: 80.0
            //   ),
            // ),

            // new Center(
            //   child: new Container(
            //     width: 100.0,
            //     height: 100.0,
            //     decoration: new BoxDecoration(
            //       shape: BoxShape.circle,
            //       image: new DecorationImage(
            //         fit: BoxFit.cover,
            //         image: new NetworkImage("https://www.tripgrida.com/img/profile/1_1448624008.jpg")
            //       ),
            //       boxShadow: <BoxShadow>[
            //           BoxShadow(
            //             color: Colors.black12,
            //             offset: Offset(0.0, 0.0),
            //             blurRadius: 8.0,
            //           ),
            //       ],
            //   )),
            // ),
             
             Center(
              child: new ClipRRect(
                borderRadius: new BorderRadius.circular(100.0),
                clipBehavior: Clip.hardEdge,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _profileImage(),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0)
                    ),
                    // new SizedBox(
                    //   width: 200.0,
                    //   height: 300.0,
                    // ),
                    new Text('@Seungpil Choi', 
                    style: new TextStyle(
                      fontStyle: FontStyle.italic, 
                      fontSize: 17.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )
                  )
                  ],
                )
                
              ),
            ),
            //  Center(child:  _profile(),),

        new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Center(
            //   child: FadeInImage.assetNetwork(
            //     placeholder: 'assets/loading/loading1.gif',
            //     image:
            //         'https://www.tripgrida.com/img/profile/1_1448624008.jpg',
            //     width:80.0, 
            //     height: 80.0
            //   ),
            // ),

            // Center(
            //   child: 
            //   Image.network('https://www.tripgrida.com/img/profile/1_1448624008.jpg', scale: 2.0, width:80.0, height: 80.0)
            // ),
            // new Text(
            //   title,
            //   style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
            // ),
          ],
        ),
      ),
        ]
    ),
    );
  }
}

Widget _peoples(controller) {
  return new ListView.builder(
    controller: controller,
    itemCount: 100,
    itemBuilder: (BuildContext context, i) {
      return new ListTile(
        title: new Text('Name'),
        subtitle: new Text('subname'),
        leading: new CircleAvatar(
          backgroundImage:
            new NetworkImage("https://www.tripgrida.com/img/profile/1_1448624008.jpg"),
          )
       );
     }
    );
  }


Widget _peoplesSample() {
  return new ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone'),
        ),
      ],
    );
  }

Widget _profile() {
  return Material(
    elevation: 5.0,
    shape: CircleBorder(),
    color: Colors.transparent,
    child: Ink.image(
      // image: AssetImage('assets/profile_default.jpg'),
      image: NetworkImage("https://www.tripgrida.com/img/profile/1_1448624008.jpg"),
      fit: BoxFit.cover,
      width: 95.0,
      height: 95.0,
      child: InkWell(
        onTap: () {},
        child: null,
      ),
    ),
  );
}

Widget _profileImage() {
  return new Center(
    child: new Container(
      width: 80.0,
      height: 80.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: new NetworkImage("https://www.tripgrida.com/img/profile/1_1448624008.jpg")
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 0.0),
            blurRadius: 8.0,
            ),
        ],
      )
    ),
  );
}

Widget _testMenu(controller,appBarHeight )  {

return CustomScrollView(
      controller: controller,
      slivers: <Widget>[
        
        SliverAppBar(
          pinned: true,
          expandedHeight: appBarHeight,
          floating: false,
          flexibleSpace: Stack(
            overflow: Overflow.clip, 
            children: <Widget>[
              // new CustomAppBar('test')
              new Container(
                decoration: new BoxDecoration(
                    border: new Border.all(width: 1.0, color: Colors.transparent),
                    // shape: BoxShape.circle,
                    color: const Color(0xff7c94b6),
                    image: new DecorationImage(
                      colorFilter: new ColorFilter.mode(Colors.black38.withOpacity(0.5), BlendMode.srcATop),
                      image: new AssetImage('assets/images/intro-bg-18.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment(0.0, 1.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, -10.0),
                        blurRadius: 20.0,
                      ),
                    ],
                 ),
                 child: 
                  new Stack(
                    children: <Widget>[
                       Center(
                          child: new ClipRRect(
                            borderRadius: new BorderRadius.circular(100.0),
                            clipBehavior: Clip.hardEdge,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                _profileImage(),
                                new Padding(
                                  padding: new EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0)
                                ),
                                // new SizedBox(
                                //   width: 200.0,
                                //   height: 300.0,
                                // ),
                                new Text('@Seungpil Choi', 
                                style: new TextStyle(
                                  fontStyle: FontStyle.italic, 
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                )
                              )
                              ],
                            )
                            
                          ),
                        ),
                    ]
                  )
              ),
            ],
          ),
        ),
        _peoplesList(),
        // SliverList(delegate:
        //     SliverChildBuilderDelegate((BuildContext context, int index) {
        //   return ListTile(title: Text("Flutter / $index"));
        // }))
      ],
  );
}

Widget _peoplesList() {
  return new SliverList(
    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      
      return new ListTile(
        title: new Text('Name'),
        subtitle: new Text('subname'),
        leading: new CircleAvatar(
          backgroundImage:
            new NetworkImage("https://www.tripgrida.com/img/profile/1_1448624008.jpg"),
          )
       );
     }
    )
  );
}
