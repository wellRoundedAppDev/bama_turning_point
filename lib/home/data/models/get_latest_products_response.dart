import 'package:classic_eccomerce/home/data/models/product.dart';

class GetLatestProductsResponse {
  GetLatestProductsResponse({
    this.success,
    this.latestProducts,
  });

  factory GetLatestProductsResponse.fromJson(dynamic json) {
    var success = json['success'];
    List<LatestProduct> data = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(LatestProduct.fromJson(v));
      });
    }

    return GetLatestProductsResponse(success: success, latestProducts: data);
  }
  num? success;
  List<LatestProduct>? latestProducts;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['success'] = success;
  //   if (error != null) {
  //     map['error'] = error?.map((v) => v.toJson()).toList();
  //   }
  //   if (data != null) {
  //     map['data'] = data?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}

class LatestProduct extends Product{
  LatestProduct(
      {this.productId,
      this.name,
      this.quantity,
      this.price,
      this.description,
      this.rating});

  factory LatestProduct.fromJson(dynamic json) {
    var productId = json['product_id'];
    var name = json['name'];
    var quantity = json['quantity'];
    var price = json['price'];
    var rating = json['rating'];
    var description = json['description'];

    return LatestProduct(
        price: price,
        quantity: quantity,
        description: description,
        name: name,
        productId: productId,
        rating: rating);
  }
  num? productId;
  String? name;
  num? quantity;
  num? price;
  dynamic? rating;
  String? description;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['product_id'] = productId;
  //   map['seo_url'] = seoUrl;
  //   map['thumb'] = thumb;
  //   map['name'] = name;
  //   map['quantity'] = quantity;
  //   map['status'] = status;
  //   map['stock_status'] = stockStatus;
  //   map['price_excluding_tax'] = priceExcludingTax;
  //   map['price_excluding_tax_formated'] = priceExcludingTaxFormated;
  //   map['price'] = price;
  //   map['price_formated'] = priceFormated;
  //   map['special'] = special;
  //   map['special_formated'] = specialFormated;
  //   map['special_excluding_tax'] = specialExcludingTax;
  //   map['special_excluding_tax_formated'] = specialExcludingTaxFormated;
  //   if (discounts != null) {
  //     map['discounts'] = discounts?.map((v) => v.toJson()).toList();
  //   }
  //   map['rating'] = rating;
  //   map['description'] = description;
  //   return map;
  // }
}
