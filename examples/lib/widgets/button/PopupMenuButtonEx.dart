import "package:flutter/material.dart";

class PopupMenuButtonEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PopupMenu Example"),
      ),
      body: Center(
        child: new PopupMenuButton(
            onSelected: popupMenuSelected,
            itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<String>>[
              const PopupMenuItem( child: const Text("child 0"), value: "Value 0",),
              const PopupMenuItem( child: const Text("child 1"), value: "Value 1",),
              const PopupMenuItem( child: const Text("child 2"), value: "Value 2",),
            ],
          ),
      )
    );
  }
  void popupMenuSelected(String valueSelected){
    print(valueSelected);
  }
}