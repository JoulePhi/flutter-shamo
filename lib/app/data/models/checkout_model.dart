import 'package:shamo/app/data/models/cart_model.dart';

class Checkout {
  String? address;
  String? status;
  double? totalPrice;
  double? shippingPrice;
  List<CartItem>? items;

  Checkout({
    this.address,
    this.status,
    this.totalPrice,
    this.shippingPrice,
    this.items,
  });

  factory Checkout.fromJson(Map<String, dynamic> json) {
    return Checkout(
      address: json['address'],
      status: json['status'],
      totalPrice: json['total_price'],
      shippingPrice: json['shipping_price'],
      items: json['cart_items'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'status': status,
      'total_price': totalPrice,
      'shipping_price': shippingPrice,
      'items':
          items!.map<Map<String, dynamic>>((CartItem e) => e.toJson()).toList(),
    };
  }
}
