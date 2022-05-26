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
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookstore"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
            itemBuilder: (context, index) {
              final item = CatelogModel.items[index];
              return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: GridTile(
                    header: Container(
                      child: Text(
                        item.name,
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.deepPurpleAccent,
                      ),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: Image.network(item.image),
                    footer: Container(
                      child: Text(
                        item.price.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.all(12),
                    ),
                  ));
            },
            itemCount: CatelogModel.items.length),
      ),
      drawer: MyDrawer(),
    );
  }
}
