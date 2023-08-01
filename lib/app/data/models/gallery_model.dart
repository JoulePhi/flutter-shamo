import 'dart:convert';

class Gallery {
  final int? id;
  final int? productId;
  final String? url;
  final String baseUrl = "http://domaindzul.my.id/storage/";

  Gallery({
    this.id,
    this.productId,
    this.url,
  });

  factory Gallery.fromRawJson(String str) => Gallery.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        productId: json["product_id"],
        url: "http://domaindzul.my.id/storage/${json["url"]}",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "url": url,
      };
}
