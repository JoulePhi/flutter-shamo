import 'dart:convert';

import 'package:shamo/app/data/models/gallery_model.dart';

class Product {
  final int? id;
  final String? name;
  final int? price;
  final String? description;
  final String? tags;
  final int? categoriesId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final List<Gallery>? galleries;
  bool? isWishlist;

  Product({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.categoriesId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.galleries,
    this.isWishlist,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        tags: json["tags"],
        categoriesId: json["categories_id"],
        isWishlist: json['is_wishlist'],
        galleries:
            json['galleries'].map<Gallery>((e) => Gallery.fromJson(e)).toList(),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "tags": tags,
        "galleries": galleries!.map((e) => e.toJson()),
        "categories_id": categoriesId,
        'is_wishlist': isWishlist,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
