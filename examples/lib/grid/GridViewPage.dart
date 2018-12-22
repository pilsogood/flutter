import "package:flutter/material.dart";

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("GridView Example"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Center(
            child: new Text(
              'Item $index', 
              style: Theme.of(context).textTheme.headline,
            ),
          );
        })
      )
    );
  }
}