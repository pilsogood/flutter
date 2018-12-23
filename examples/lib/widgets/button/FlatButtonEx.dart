import "package:flutter/material.dart";

class FlatButtonEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlatButton Example"),
      ),
      body: Center(
        child: FlatButton( 
          key:null,
          color: Colors.indigo,
          child: Text('Next page',
            style: const TextStyle(
              fontSize: 20.0,
              color: const Color(0xFFFFFFFFF),
              fontWeight: FontWeight.w900,
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