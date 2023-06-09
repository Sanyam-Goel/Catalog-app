import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorials/models/catalog.dart';
import 'package:tutorials/utils/routes.dart';
import 'package:tutorials/widgets/home_widgets/catalog_header.dart';
import 'package:tutorials/widgets/home_widgets/catalog_list.dart';
//import 'package:tutorials/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async{
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
    .map<Item>((item) => Item.fromMap(item))
    .toList();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    var items = CatalogModel.items;
    return  Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        // ignore: deprecated_member_use
        backgroundColor: context.theme.buttonColor,
        child: const Icon(CupertinoIcons.cart, color: Colors.white,),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const CatalogHeader(),
              if(items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                 Center(
                  child: const  CircularProgressIndicator().centered().py16().expand(),
                )
            ],
          )
        ),
      )
    );
  }
}
