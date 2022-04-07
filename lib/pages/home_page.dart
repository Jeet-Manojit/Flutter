import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/login_page.dart';
import 'package:flutter_demo/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookstore"),
      ),
      body: Center(
        child: Container(
          child: Text(
            "Welcome  $name",
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
