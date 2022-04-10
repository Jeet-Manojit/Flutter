import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/pages/login_page.dart';
import 'package:flutter_demo/widgets/drawer.dart';
import 'package:flutter_demo/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatelogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookstore"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: dummyList[index++]);
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
