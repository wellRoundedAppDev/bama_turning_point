import 'package:classic_eccomerce/home/data/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_settings/app_settings_cubit/app_settings_cubit.dart';
import '../../../main.dart';

class GetFeaturedProductsResponse {
  GetFeaturedProductsResponse({
    this.success,
    //this.error,
    this.data,
  });

  factory GetFeaturedProductsResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }
    List<Data> data = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
    return GetFeaturedProductsResponse(success: success, data: data);
  }

  num? success;
  List<Data>? data;

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

class Data {
  Data({
    this.moduleId,
    this.name,
    this.code,
    this.products,
  });

  factory Data.fromJson(dynamic json) {
    var moduleId = json['module_id'];
    var name = json['name'];
    var code = json['code'];
    List<FeaturedProduct> products = [];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products.add(FeaturedProduct.fromJson(v));
      });
    }
    return Data(name: name, code: code, moduleId: moduleId, products: products);
  }
  num? moduleId;
  String? name;
  String? code;
  List<FeaturedProduct>? products;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['module_id'] = moduleId;
  //   map['name'] = name;
  //   map['code'] = code;
  //   if (products != null) {
  //     map['products'] = products?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}

class FeaturedProduct extends Product {
  FeaturedProduct({
    this.productId,
    this.name,
    this.quantity,
    this.price,
    this.description,
    this.productImagePath,
    this.priceFormatted
  });

  factory FeaturedProduct.fromJson(dynamic json) {
    var productId = json['product_id'];
    var name = json['name'];
    var quantity = json['quantity'];
    var price = json['price'];
    var description = json['description'];
    var imagePath= json['thumb'];
    var priceFormatted = (json['price']?.toString()??"" )+( MyApp.navKey.currentState?.context.read<AppSettingsCubit>().currencyCode??"");

    return FeaturedProduct(
      name: name,
      price: price,
      productImagePath: imagePath,
      description: description,
      productId: productId,
      priceFormatted: priceFormatted,
      quantity: quantity,
    );
  }
  num? productId;
  bool? thumb;
  String? name;
  num? quantity;
  num? price;
  String? productImagePath;
  String? description;
  String? priceFormatted;

// Map<String, dynamic> toJson() {
//   final map = <String, dynamic>{};
//   map['product_id'] = productId;
//   map['thumb'] = thumb;
//   map['name'] = name;
//   map['quantity'] = quantity;
//   map['seo_url'] = seoUrl;
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
//   map['rating'] = rating;
//   map['special_start_date'] = specialStartDate;
//   map['special_end_date'] = specialEndDate;
//   map['description'] = description;
//   return map;
// }
}
