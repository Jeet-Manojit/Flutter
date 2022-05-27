import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/themes.dart';
import "package:velocity_x/velocity_x.dart";
import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catelog;

  const HomeDetailPage({super.key, required this.catelog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catelog.id.toString()),
              child: Image.network(catelog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catelog.name.text.xl4.bold
                        .color(MyTheme.darkBluishColor)
                        .bold
                        .make(),
                    catelog.desc.text
                        .textStyle(context.captionStyle)
                        .size(15.5)
                        .make(),
                    10.heightBox,
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.m1,
          children: [
            "\$${catelog.price}".text.xl3.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    child: "Buy".text.lg.make())
                .wh(100, 45)
          ],
        ).p24(),
      ),
    );
  }
}
