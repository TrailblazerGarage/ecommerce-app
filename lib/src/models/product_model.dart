import 'dart:convert';

ProductModel productModelFromJson(String jsonAsString) =>
    ProductModel.fromJson(json.decode(jsonAsString));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.id,
    this.title = '',
    this.price = 0.0,
    this.available = true,
    this.photoUrl,
  });

  String id;
  String title;
  double price;
  bool available;
  String photoUrl;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        available: json["available"],
        photoUrl: json["photoURL"],
      );

  Map<String, dynamic> toJson() => {
        //"id"        : id,
        "title": title,
        "price": price,
        "available": available,
        "photoURL": photoUrl,
      };
}
