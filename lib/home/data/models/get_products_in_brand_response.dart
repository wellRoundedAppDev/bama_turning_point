import 'package:classic_eccomerce/home/data/models/product.dart';

class GetProductsInBrandResponse {
  GetProductsInBrandResponse({
    this.success,
    this.productsInBrand,
  });

  factory GetProductsInBrandResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }
    List<ProductsInBrand>? productsInBrand;
    if (json['data'] != null) {
      productsInBrand = [];
      json['data'].forEach((v) {
        productsInBrand?.add(ProductsInBrand.fromJson(v));
      });
    }

    return GetProductsInBrandResponse(success: success, productsInBrand: productsInBrand);
  }
  num? success;
  List<ProductsInBrand>? productsInBrand;
}

class ProductsInBrand extends Product{
  ProductsInBrand({
    this.productId,
    this.name,
    this.quantity,
    this.price,
    this.rating,
    this.productImagePath,
    this.priceFormatted,
    this.description,
  });

  factory ProductsInBrand.fromJson(dynamic json) {
    var productId = json['product_id'];
    var name = json['name'];
    var quantity = json['quantity'];
    var price = json['price'];
    var rating = json['rating'];
    var description = json['description'];
    var priceFormatted = json['price_formated'];
    var productImagePath = json['image'];
    return ProductsInBrand(productId: productId,name: name,
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
