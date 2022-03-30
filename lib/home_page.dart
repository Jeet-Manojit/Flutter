import 'package:flutter/material.dart';

class Home_page extends StatelessWidget {
  String name = "Manojit Chakraborty";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HIPLOCKER"),
      ),
      body: Center(
        child: Container(
          child: Text(
            "Welcome $name",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
