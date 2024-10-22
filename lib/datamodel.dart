// To parse this JSON data, do
//
//     final productmodelApi = productmodelApiFromJson(jsonString);

import 'dart:convert';

ProductmodelApi productmodelApiFromJson(String str) =>
    ProductmodelApi.fromJson(json.decode(str));

class ProductmodelApi {
  List<Product> products;

  ProductmodelApi({
    required this.products,
  });

  factory ProductmodelApi.fromJson(Map<String, dynamic> json) =>
      ProductmodelApi(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );
}

class Product {
  int id;
  String title;

  double price;

  String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        thumbnail: json["thumbnail"],
      );
}
