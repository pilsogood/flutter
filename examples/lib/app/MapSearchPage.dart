import "package:flutter/material.dart";
import 'dart:io';

class MapSearchPage extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<MapSearchPage> 
  with SingleTickerProviderStateMixin {
  
  static final GlobalKey<ScaffoldState> scaffoldKey =
  new GlobalKey<ScaffoldState>();

  TextEditingController _searchQuery;
  bool _isSearching = false;
  String searchQuery = "Search query";

@override
  void initState() {
    super.initState();
    _searchQuery = new TextEditingController();
  }

    void _startSearch() {
    print("open search box");
    ModalRoute
        .of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    print("close search box");
    setState(() {
      _searchQuery.clear();
      updateSearchQuery("Search query");
    });
  }


  Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment =
    Platform.isIOS ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return new InkWell(
      onTap: () => scaffoldKey.currentState.openDrawer(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: <Widget>[
            const Text('Seach box'),
          ],
        ),
      ),
    );
  }


  Widget _buildSearchField() {
    return new TextField(
      controller: _searchQuery,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: updateSearchQuery,
    );
  }

  void updateSearchQuery(String newQuery) {

    setState(() {
      searchQuery = newQuery;
    });
    print("search query " + newQuery);

  }

  List<Widget> _buildActions() {

    if (_isSearching) {
      return <Widget>[
        new IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQuery == null || _searchQuery.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      new IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        leading: _isSearching ? const BackButton() : null,
        title: _isSearching ? _buildSearchField() : _buildTitle(context),
        actions: _buildActions(),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Expanded(
              child: _pois(),
            )
            // new Text(
            //   '$searchQuery',
            //   style: Theme.of(context).textTheme.display1,
            // ),
          ],
        ),
      ),
    );
  }
}

Widget _pois() {
  String link = r'https://www.tripgrida.com/img/resource/city/229/243/thumb_320/$2y$07$0a5b63f3451cdf8634ce5elh6FnxHZ65GTt3vzfAjTfJMs8KaXlae';
  return new ListView.builder(
    itemCount: 100,
    itemBuilder: (BuildContext context, i) {
       return _poiCard(link,"name","description");
     }
    );
  }

  Widget _poiCard(image,name,description) {
    return new Container(
      // width: 500,
      // height: 100,
      // color: Colors.white,
      margin: EdgeInsets.all(10),
      decoration: new BoxDecoration(
        // border: new Border.all(width: 0.0, color: Colors.transparent),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(5.0),
        // color: const Color(0xff7c94b6),
        color: Colors.white,
        // image: new DecorationImage(
        //   colorFilter: new ColorFilter.mode(Colors.black38.withOpacity(0.5), BlendMode.srcATop),
        //   image: new AssetImage(image),
        //   fit: BoxFit.cover,
        //   alignment: Alignment(0.0, 1.0),
        // ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: new Color(0xFFF8E1FE),
            offset: Offset(0.0, 0.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Expanded(
            child: new Container(
            child: new ClipRRect(
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(8.0), 
                  bottomLeft:  const Radius.circular(8.0)
                  ),
                child: Image.network(
                image,
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
           ),
            ),
            flex: 1,
          ),
          new Expanded( 
           child: new Container(
             color: Colors.black,
              child:new Column(
                children: <Widget>[
                  Text(name),
                  Text(description)
                ],
              )
            ),
            flex:2
          ),
          new Expanded( 
           child: new Container(
             color: Colors.teal,
             child: new Center(
               child: new Text('click')
             )
           )
          )
        ],
      )
    );
  }


Widget peoples() {
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
