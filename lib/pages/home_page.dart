import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catelog_header.dart';
import '../widgets/home_widgets/catelog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
    await Future.delayed(Duration(seconds: 2));
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
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatelogHeader(),
                if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                  CatelogList().py12().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
