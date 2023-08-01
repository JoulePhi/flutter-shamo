import 'package:shamo/app/data/models/product_model.dart';

class Category {
  int? id;
  String? name;
  List<Product>? products;

  Category({
    this.id,
    this.name,
    this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      products:
          json['products'].map<Product>((e) => Product.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'products': products,
    };
  }
}
