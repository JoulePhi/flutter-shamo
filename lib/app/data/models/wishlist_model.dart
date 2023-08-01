import 'dart:convert';

import 'package:shamo/app/data/models/product_model.dart';

class Wishlist {
  final int? id;
  final int? productId;
  final int? wishlistId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Product? product;

  Wishlist({
    this.id,
    this.productId,
    this.wishlistId,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory Wishlist.fromRawJson(String str) =>
      Wishlist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["id"],
        productId: json["product_id"],
        wishlistId: json["wishlist_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        product: Product.fromJson(json['product']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "wishlist_id": wishlistId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product": product!.toJson().toString(),
      };
}
