import "package:flutter/material.dart";

class DropdownButtonEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown Button Example"),
      ),
      body: Center(
        child: new DropdownButton<String>(
            onChanged: popupButtonSelected,
            value: "Child 1",
            style: const TextStyle(
              fontSize:15.0,
              color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto"),

            items: <DropdownMenuItem<String>>[
              new DropdownMenuItem<String>(value: "Child 1",
                child: const Text("Child 1")),
              new DropdownMenuItem<String>(value: "Child 2",
                child: const Text("Child 2")),
              new DropdownMenuItem<String>(value: "Child 3",
                child: const Text("Child 3")),
            ],
          
          ),
      )
    );
  }
  void popupButtonSelected(String value) {
    print(value);
  }
}