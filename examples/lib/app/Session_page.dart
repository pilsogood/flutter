import "package:flutter/material.dart";
import 'utils/NetworkService.dart';
import 'utils/SessionService.dart';


class Session_page extends StatefulWidget {
  @override
  _AppStatus createState() => _AppStatus();
}

class _AppStatus extends State<Session_page> {

  NetworkService network = new NetworkService();
  SessionService session = new SessionService();
  
  var debugText = '';
  var _sessionId = 'cookie';

  // @override
  // void initState(){
  //   super.initState();
  //   network.getMobileToken();
  //   _logInfo();
  // }

 void _getStorage() async {
    await session.getToken(_sessionId);
  }

  void  setDebugMessage(data) {
    setState(() {
      debugText = data;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Session other Page Example"),
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
                  "Get Storage",
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0
                  ),
                ),
                onPressed: () => _getStorage(),
              ),
            ],
          ),
        )
      )
    );
  }
}