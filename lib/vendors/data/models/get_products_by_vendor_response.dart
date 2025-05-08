import 'package:classic_eccomerce/home/data/models/get_all_products_response.dart';

class GetProductsByVendorResponse {
  GetProductsByVendorResponse({
    this.isSuccssed,
    this.message,
    this.obj,
  });

  factory GetProductsByVendorResponse.fromJson(dynamic json) {
    var isSuccssed = json['IsSuccssed'];
    var message = json['Message'];
    var obj = json['Obj'] != null ? Obj.fromJson(json['Obj']) : null;

    return GetProductsByVendorResponse(
      isSuccssed: isSuccssed,
      obj: obj,
      message: message,
    );
  }
  bool? isSuccssed;
  String? message;
  Obj? obj;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsSuccssed'] = isSuccssed;
    map['Message'] = message;
    if (obj != null) {
      map['Obj'] = obj?.toJson();
    }
    return map;
  }
}

class Obj {
  Obj({
    this.products,
    this.totalProducts,
    this.totalPages,
    this.pageNumber,
    this.pageSize,
  });

  factory Obj.fromJson(dynamic json) {
    List<ProductFromApi>? products;
    if (json['Products'] != null) {
      products = [];
      json['Products'].forEach((v) {
        products?.add(ProductFromApi.fromJson(v));
      });
    }
    var totalProducts = json['TotalProducts'];
    var totalPages = json['TotalPages'];
    var pageNumber = json['PageNumber'];
    var pageSize = json['PageSize'];

    return Obj(
        pageSize: pageSize,
        totalProducts: totalProducts,
        totalPages: totalPages,
        products: products,
        pageNumber: pageNumber);
  }
  List<ProductFromApi>? products;
  num? totalProducts;
  num? totalPages;
  num? pageNumber;
  num? pageSize;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['Products'] = products?.map((v) => v.toJson()).toList();
    }
    map['TotalProducts'] = totalProducts;
    map['TotalPages'] = totalPages;
    map['PageNumber'] = pageNumber;
    map['PageSize'] = pageSize;
    return map;
  }
}

