//import 'dart:convert';
class CatalogModel {
  static final catModel = CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => catModel;
  static List<Item> items = [
    Item(1, "iphone 12 Pro", "description",999,"#33505a","https://cdn.dxomark.com/wp-content/uploads/medias/post-61263/iphone-12-pro-blue-hero.jpg"),
  ];
  // ignore: null_closures
  Item getById(int id) => items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image,);

  factory Item.fromMap(Map<String,dynamic> map){
    return Item(map["id"],map["name"],map["desc"],map["price"],map["color"],map["image"],
    );
  }
  toMap() => {
    "id":id,
    "name": name,
    "desc": desc,
    "price": price,
    "color":color,
    "image":image,
  };
}