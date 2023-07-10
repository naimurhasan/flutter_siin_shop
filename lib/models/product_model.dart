// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  CategoryEnum category;
  String description;
  int id;
  String image;
  int off;
  double oldPrice;
  double price;
  String title;

  Product({
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.off,
    required this.oldPrice,
    required this.price,
    required this.title,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    category: categoryValues.map[json["category"]]!,
    description: json["description"],
    id: json["id"],
    image: json["image"],
    off: json["off"],
    oldPrice: json["old_price"]?.toDouble(),
    price: json["price"]?.toDouble(),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "category": categoryValues.reverse[category],
    "description": description,
    "id": id,
    "image": image,
    "off": off,
    "old_price": oldPrice,
    "price": price,
    "title": title,
  };
}

enum CategoryEnum { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": CategoryEnum.ELECTRONICS,
  "jewelery": CategoryEnum.JEWELERY,
  "men's clothing": CategoryEnum.MEN_S_CLOTHING,
  "women's clothing": CategoryEnum.WOMEN_S_CLOTHING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {  
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
