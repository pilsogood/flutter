import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

void main() => runApp(new Https());

class Https extends StatefulWidget {
  @override
  AppStatus createState() => AppStatus();
}


int perPage  = 10;
int present = 0;
class AppStatus extends State<Https> {

 Future<List<User>> _user;
  
 @override
 Future<List<User>> _getUsers() async {
    
   List<User> users = [];

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
       var jsonData = json.decode(response.body);
       var usersData = jsonData["data"];
       for (var user in usersData) {
        User newUser = User(user["num"],user["profile"],user['name'],user["age"],user["country"]);
        print(user["num"]);
        users.add(newUser);
       }
     });

    print(present);
    present++;
    return users;
  }


  @override
  void initState() {
    super.initState();
    _user = _getUsers();
  }


  Future _loadMoreItems() async {
    setState(() {
      _user =  _getUsers();
    });
  }


  Widget build(BuildContext context) {
    var flutterBuilder = FutureBuilder(
            future: _user,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("Loading..."),
                  ),
                );
              } else {
                return ListView.builder(
                 itemCount: snapshot.data.length + 1,
                 itemBuilder: (BuildContext context, int index) {
                   return 
                   (index == snapshot.data.length) ? 
                   Container(
                       color: Colors.greenAccent,
                       child: FlatButton(
                           child: Text("Load More"),
                           onPressed: _loadMoreItems ,
                       ),
                   )
                   :
                   ListTile(
                     onTap: () {
                       // Navigator.push(
                       //     context,
                       //     new MaterialPageRoute(
                       //         builder: (context) =>
                       //             UserDetailPage(snapshot.data[index])));
                     },
                     title: Text(snapshot.data[index].name),
                     subtitle: Text(snapshot.data[index].country),
                     leading: CircleAvatar(
                         backgroundImage:
                             NetworkImage(snapshot.data[index].profile)),
                );
              }
            );
         }   
      }
    );

            

    return Scaffold(
      appBar: AppBar(
          title: Text('Users',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      body: flutterBuilder
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
