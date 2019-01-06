import "package:flutter/material.dart";
import 'package:permission/permission.dart';

void main() => runApp(PermissionCheck());

class PermissionCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Permission',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Colors.transparent,
      ),
      home: MyHomePage(title: 'Permission'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  final Map<String, dynamic> pluginParameters = {};

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String get = '';

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('QRCode Reader Example'),
      ),
      body: new Column(
          children: <Widget>[
            RaisedButton(onPressed: getPermissionStatus, child: new Text("Get permission status")),
            RaisedButton(onPressed: requestPermissions, child: new Text("Request permissions")),
            RaisedButton(onPressed: requestPermission, child: new Text("Request single permission")),
            RaisedButton(onPressed: Permission.openSettings, child: new Text("Open settings")),
            Text(get),
          ],
        ),

    );
  }


   getPermissionStatus() async {
    get = '';
    List<Permissions> permissions = await Permission.getPermissionStatus([PermissionName.Calendar, PermissionName.Camera, PermissionName.Contacts, PermissionName.Location, PermissionName.Microphone, PermissionName.Phone, PermissionName.Sensors, PermissionName.SMS, PermissionName.Storage]);
    permissions.forEach((permission) {
      get += '${permission.permissionName}: ${permission.permissionStatus}\n';
    });
    setState(() {
      get;
    });
  }

  requestPermissions() async {
    final res = await Permission.requestPermissions([PermissionName.Calendar, PermissionName.Camera, PermissionName.Contacts, PermissionName.Location, PermissionName.Microphone, PermissionName.Phone, PermissionName.Sensors, PermissionName.SMS, PermissionName.Storage]);
    res.forEach((permission) {});
  }

  requestPermission() async {
    final res = await Permission.requestSinglePermission(PermissionName.Camera);
    print(res);
  }
}