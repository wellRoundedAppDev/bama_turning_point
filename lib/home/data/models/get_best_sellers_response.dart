import 'package:classic_eccomerce/home/data/models/product.dart';

class GetBestSellersResponse {
  GetBestSellersResponse({
    this.success,
    this.bestSellers,
  });

  factory GetBestSellersResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }
    List<BestSeller>? bestSellers;
    if (json['data'] != null) {
      bestSellers = [];
      json['data'].forEach((v) {
        bestSellers?.add(BestSeller.fromJson(v));
      });
    }

    return GetBestSellersResponse(success: success, bestSellers: bestSellers);
  }
  num? success;
  List<BestSeller>? bestSellers;
}

class BestSeller extends Product{
  BestSeller({
    this.productId,
    this.name,
    this.quantity,
    this.price,
    this.rating,
    this.productImagePath,
    this.priceFormatted,
    this.description,
  });

  factory BestSeller.fromJson(dynamic json) {
    var productId = json['product_id'];
    var name = json['name'];
    var quantity = json['quantity'];
    var price = json['price'];
    var rating = json['rating'];
    var description = json['description'];
    var priceFormatted = json['price_formated'];
    var productImagePath = json['thumb'];
    return BestSeller(productId: productId,name: name,
        productImagePath: productImagePath,
        priceFormatted: priceFormatted,
        quantity: quantity,price: price,rating: rating,description: description);
  }
  num? productId;
  String? name;
  num? quantity;
  num? price;
  dynamic rating;
  String? description;
  String? productImagePath;
String? priceFormatted;
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
