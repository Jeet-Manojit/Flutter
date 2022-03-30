import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String name = "Manojit Chakraborty";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HIPLOCKER"),
      ),
      body: Center(
        child: Container(
          child: Text(
            "Welcome $name",
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
