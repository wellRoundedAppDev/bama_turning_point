import 'package:classic_eccomerce/home/data/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app_settings/app_settings_cubit/app_settings_cubit.dart';
import '../../../main.dart';
import '../../../shared_components/custom_alert2.dart';

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

    return GetProductsInBrandResponse(
        success: success, productsInBrand: productsInBrand);
  }
  num? success;
  List<ProductsInBrand>? productsInBrand;
}

class ProductsInBrand extends Product {
  ProductsInBrand(
      {this.productId,
      this.name,
      this.quantity,
      this.price,
      this.rating,
      this.productImagePath,
      this.priceFormatted,
      this.description,
      this.stockStatus,
      this.stockStatusId});

  factory ProductsInBrand.fromJson(dynamic json) {
    var productId = json['product_id'];
    var name = json['name'];
    var quantity = json['quantity'];
    var price = json['price'];
    var rating = json['rating'];
    var description = json['description'];
    var priceFormatted = (json['price']?.toString() ?? "").replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},") +
        ((MyApp.navKey.currentState?.context
                        .read<AppSettingsCubit>()
                        .currencyCode ??
                    "") ==
                "USD"
            ?
        "${AppLocalizations.of(context)!.dollar}":
        "${AppLocalizations.of(context)!.dinar}");
    var productImagePath = json['image'];
    var stockStatus = json['stock_status'];
    var stockStatusId = json['stock_status_id'];

    return ProductsInBrand(
        productId: productId,
        name: name,
        productImagePath: productImagePath,
        priceFormatted: priceFormatted,
        quantity: quantity,
        price: price,
        stockStatus: stockStatus,
        stockStatusId: stockStatusId,
        rating: rating,
        description: description);
  }
  num? productId;
  String? name;
  num? quantity;
  num? price;
  dynamic rating;
  String? description;
  String? productImagePath;
  String? priceFormatted;
  String? stockStatus;
  num? stockStatusId;
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
