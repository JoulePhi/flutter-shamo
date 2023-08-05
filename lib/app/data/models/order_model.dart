import 'package:shamo/app/data/models/cart_model.dart';
import 'package:shamo/app/data/models/product_model.dart';

class Order {
  int? id;
  double? totalPrice;
  double? shippingPrice;
  String? address;
  String? status;
  String? paymentMethod;
  List<CartItem>? items;

  Order({
    this.id,
    this.totalPrice,
    this.shippingPrice,
    this.address,
    this.status,
    this.paymentMethod,
    this.items,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      totalPrice: double.tryParse(json['total_price'].toString()),
      shippingPrice: double.tryParse(json['shipping_price'].toString()),
      address: json['address'],
      status: json['status'],
      paymentMethod: json['payment_method'],
      items: json['items']
          .map<CartItem>((product) => CartItem.fromJson(product))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total_price': totalPrice,
      'shipping_price': shippingPrice,
      'address': address,
      'status': status,
      'payment_method': paymentMethod,
      'items': items,
    };
  }
}
