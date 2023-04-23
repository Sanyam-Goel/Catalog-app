
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
// ignore: unused_import
import '../themes.dart';

class CatalogHeader extends StatelessWidget{
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: deprecated_member_use
        "Catalog App".text.xl5.bold.color(context.theme.buttonColor).make(),
        "Trending products".text.make(),
      ],
    );
  }
}
