import "package:flutter/material.dart";

class RaisedButtonEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RaisedButton Example"),
      ),
      body: Center(
        child: RaisedButton( 
          key:null,
          color: Colors.cyan,
          child: const Text(
            'RaisedButton',
             style: const TextStyle(
                fontSize:12.0,
                color: const Color(0xFFFFFFFFF),
                fontWeight: FontWeight.w800,
                fontFamily: "Roboto"
              )
          ),
          onPressed: () => buttonPressed(),
        ),
      )
    );
  }
  void buttonPressed(){
    print('click');
  }
}