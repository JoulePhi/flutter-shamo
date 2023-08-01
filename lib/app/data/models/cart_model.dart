import 'dart:convert';

import 'package:shamo/app/data/models/product_model.dart';

class CartItem {
  final int? id;
  final int? productId;
  final int? cartId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Product? product;
  int? total;

  CartItem({
    this.id,
    this.productId,
    this.cartId,
    this.createdAt,
    this.updatedAt,
    this.product,
    this.total,
  });

  factory CartItem.fromRawJson(String str) =>
      CartItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        productId: json["product_id"],
        cartId: json["cart_id"],
        total: json['total'],
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
        "wishlist_id": cartId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product": product!.toJson().toString(),
      };
}
