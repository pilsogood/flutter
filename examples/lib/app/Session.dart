import "package:flutter/material.dart";
import 'utils/NetworkService.dart';
import 'utils/SessionService.dart';
import 'Session_page.dart';

class Session extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<Session> {

  NetworkService network = new NetworkService();
  SessionService session = new SessionService();
  
  var debugText = '';
  var _sessionId = 'cookie';
  var _postData = {"id":"root", "password":"1234"};
  
  void _getStorage() async {
    await session.getToken(_sessionId);
  }

  void  setDebugMessage(data) {
    setState(() {
      debugText = data;
    });
  }

  _logIn() async {
    var res = await network.logIn(_postData);
    print(res);
    setDebugMessage(res['data']['id']);
    return res;
  }

  _logInfo() async {
    var res = await network.logInfo();
    if(res != null) {
      print(res['data']);
      setDebugMessage("info: ${res['data']['id']}");
    } else {
      setDebugMessage("empty");
    }
  }

  _logOut() async {
    var res = await network.logOut();
    if(res != null) {
      setDebugMessage(res['data']);
      return res;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Session Example"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              SizedBox(height:25.0),
              Divider(),
              Text("${debugText}"),
              RaisedButton(
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => _logIn(),
              ),
              RaisedButton(
                child: Text(
                  "Log Info",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => _logInfo(),
              ),
              RaisedButton(
                child: Text(
                  "Log Out",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => _logOut(),
              ),
              RaisedButton(
                child: Text(
                  "Get Storage",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => _getStorage(),
              ),
              RaisedButton(
                child: Text(
                  "Move page",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new Session_page())),
              ),
            ],
          ),
        )
      )
    );
  }
}