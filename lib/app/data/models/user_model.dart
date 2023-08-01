import 'dart:convert';

class User {
  String? name;
  String? username;
  String? email;
  String? phoneNumber;
  int? id;
  String? profilePhotoUrl;
  int? cartId;
  int? wishlistId;

  User({
    this.name,
    this.username,
    this.email,
    this.phoneNumber,
    this.id,
    this.profilePhotoUrl,
    this.cartId,
    this.wishlistId,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["fullname"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        id: json["id"],
        profilePhotoUrl: json["profile_photo_url"],
        cartId: json["cart_id"],
        wishlistId: json["wishlist_id"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": name,
        "username": username,
        "email": email,
        "phone_number": phoneNumber,
        "id": id,
        "profile_photo_url": profilePhotoUrl,
        "cart_id": cartId,
        "wishlist_id": wishlistId,
      };
}
