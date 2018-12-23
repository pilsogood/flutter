import "package:flutter/material.dart";

class FloatingActionButtonEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("FloatingActionButton Example"),
      ),
      body: Center(
          child: Text('FloatingActionButton Example'),
      ),
      floatingActionButton: new FloatingActionButton(
        child: const Icon(Icons.add_call),
        onPressed: () =>  _onClicked()
      ),
    );
  }
  void _onClicked() {
    print('click');
  }
}