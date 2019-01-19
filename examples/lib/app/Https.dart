import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


void main() => runApp(new Https());

class Https extends StatefulWidget {
  @override
  AppStatus createState() => AppStatus();
}


class AppStatus extends State<Https> {

  int perPage  = 10;
  int present = 0;

  List<User> _user = new List<User>();

  ScrollController _scrollController = new ScrollController();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  bool isPerformingRequest = false;

  @override
  void initState() {
    _getMoreData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<Null> _refeshList() async {
    refreshKey.currentState?.show(atTop: false);
    this.setState(() {
      present = 0;
      _user = [];
      _getMoreData();
    });

    return null;
  }  

  _getMoreData() async {
    if (!isPerformingRequest) {
      this.setState(() => isPerformingRequest = true);
      List<User> newEntries = await _getUsers();

      if (newEntries.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent - _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge -offsetFromBottom),
              duration: new Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }

        this.setState(() {
          isPerformingRequest = false;
        });
      } else {
        this.setState(() {
          _user.addAll(newEntries);
          isPerformingRequest = false;
        });
      }
    }
  }

  @override
  Future<List<User>> _getUsers() async {
    
   List<User> users = new List<User>();

   var host = "https://api.tripgrida.com/api/test/p";
   var postData = {'page':'${present}'};

   var body = json.encode(postData);
   await http.post(
      Uri.encodeFull(host), 
      body: body,
      headers: {
          'Content-Type' : 'application/json; charset=utf-8'
      },
     ).then((response) {

      if (response.statusCode < 200 || response.statusCode > 400 || json == null || response.body.isEmpty) {
        // throw new Exception("Error while fetching data");
        return;
      }
      print(response.body);
       var jsonData = json.decode(response.body);
       var usersData = jsonData["data"];
       for (var user in usersData) {
         User newUser = User(user["num"],user["profile"],user['name'],user["age"],user["country"]);
         print(user["name"]);
         users.add(newUser);
      }

     });

    print(present);
    present++;
    return users;
  }

  Future<List<int>> fakeRequest(int from, int to) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(to - from, (i) => i + from);
    });
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite ListView"),
      ),
      body: Column(
        children: <Widget>[
          // FlatButton(
          //   child: Text('ok'),
          //   onPressed: _getMoreData,
          // ),
          Expanded(
            child: RefreshIndicator(
               key: refreshKey,
               onRefresh: () => _refeshList(),
               child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: _user.length + 1,
                itemBuilder: (context, index) {
                  if (index == _user.length) {
                    return _buildProgressIndicator();
                  } else {
                    return 
                    ListTile(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     new MaterialPageRoute(
                        //         builder: (context) =>
                        //             UserDetailPage(snapshot.data[index])));
                      },
                      title: Text("${_user[index].name}"),
                      subtitle: Text("${_user[index].country}"),
                      leading: 
                      new Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new CachedNetworkImageProvider("${_user[index].profile}"),
                                  ),
                                ),
                              ),

                      //  CircleAvatar(
                      //      backgroundImage:
                      //          NetworkImage("${_user[index].profile}")),
                  );
                  }
                },
                controller: _scrollController,
              ),
            )
          ),
        ],
      )
    );
  }
}

class User {
  final int num;
  final String profile;
  final String name;
  final int age;
  final String country;

  User(
    this.num,
    this.profile,
    this.name,
    this.age,
    this.country
  );
}
