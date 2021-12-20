// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:testapp/models/cart.dart';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());
class Catalogmodel{
  static List<Item> items = [];

  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) =>items[pos];

  }
class Item {

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  int id;
  String name;
  String desc;
  num price;
  String color;
  String image;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["name"],
    desc: json["desc"],
    price: json["price"],
    color: json["color"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "desc": desc,
    "price": price,
    "color": color,
    "image": image,
  };
}