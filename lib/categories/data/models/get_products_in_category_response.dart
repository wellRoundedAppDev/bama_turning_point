import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_settings/app_settings_cubit/app_settings_cubit.dart';
import '../../../home/data/models/product.dart';
import '../../../main.dart';

class GetProductsInCategoryResponse {
  bool? isSuccssed;
  String? message;
  Obj? obj;

  GetProductsInCategoryResponse({this.isSuccssed, this.message, this.obj});

  factory GetProductsInCategoryResponse.fromJson(Map<String, dynamic> json) {
    var isSuccssed = json['IsSuccssed'];
    var message = json['Message'];
    var obj = json['Obj'] != null ? Obj.fromJson(json['Obj']) : null;

    return GetProductsInCategoryResponse(
        isSuccssed: isSuccssed, message: message, obj: obj);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data =  Map<String, dynamic>();
  //   data['IsSuccssed'] = this.isSuccssed;
  //   data['Message'] = this.message;
  //   if (this.obj != null) {
  //     data['Obj'] = this.obj!.toJson();
  //   }
  //   return data;
  // }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data =  Map<String, dynamic>();
//   data['IsSuccssed'] = this.isSuccssed;
//   data['Message'] = this.message;
//   if (this.obj != null) {
//     data['Obj'] = this.obj!.toJson();
//   }
//   return data;
// }
}

class Obj {
  List<Products>? products;
  int? totalProducts;
  int? totalPages;
  int? pageNumber;
  int? pageSize;

  Obj(
      {this.products,
      this.totalProducts,
      this.totalPages,
      this.pageNumber,
      this.pageSize});

  factory Obj.fromJson(Map<String, dynamic> json) {
    List<ProductInCategory>? products;
    if (json['Products'] != null) {
      products = <ProductInCategory>[];
      json['Products'].forEach((v) {
        products?.add(ProductInCategory.fromJson(v));
      });
    }
    var totalProducts = json['TotalProducts'];
    var totalPages = json['TotalPages'];
    var pageNumber = json['PageNumber'];
    var pageSize = json['PageSize'];

    return Obj(
      pageNumber: pageNumber,
      pageSize: pageSize,
      totalPages: totalPages,
      totalProducts: totalProducts,
      products: products,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['Products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['TotalProducts'] = this.totalProducts;
    data['TotalPages'] = this.totalPages;
    data['PageNumber'] = this.pageNumber;
    data['PageSize'] = this.pageSize;
    return data;
  }
}

class ProductInCategory {
  int? id;
  String? productName;
  dynamic? notes;
  int? source;
  int? groupId;
  String? groupName;
  int? minorUnitId;
  String? minorUnitName;
  double? minorUnitPrice;
  int? middleUnitId;
  String? middleUnitName;
  double? middleUnitPrice;
  int? grandUnitId;
  dynamic? grandUnitName;
  double? grandUnitPrice;

  ProductInCategory(
      {this.id,
      this.productName,
      this.notes,
      this.source,
      this.groupId,
      this.groupName,
      this.minorUnitId,
      this.minorUnitName,
      this.minorUnitPrice,
      this.middleUnitId,
      this.middleUnitName,
      this.middleUnitPrice,
      this.grandUnitId,
      this.grandUnitName,
      this.grandUnitPrice});

  factory ProductInCategory.fromJson(Map<String, dynamic> json) {
    var id = json['Id'];
    var productName = json['ProductName'];
    var notes = json['Notes'];
    var source = json['Source'];
    var groupId = json['GroupId'];
    var groupName = json['GroupName'];
    var minorUnitId = json['MinorUnitId'];
    var minorUnitName = json['MinorUnitName'];
    var minorUnitPrice = json['MinorUnitPrice'];
    var middleUnitId = json['MiddleUnitId'];
    var middleUnitName = json['MiddleUnitName'];
    var middleUnitPrice = json['MiddleUnitPrice'];
    var grandUnitId = json['GrandUnitId'];
    var grandUnitName = json['GrandUnitName'];
    var grandUnitPrice = json['GrandUnitPrice'];

    return ProductInCategory(
        groupName: groupName,
        id: id,
        productName: productName,
        notes: notes,
        minorUnitPrice: minorUnitPrice,
        minorUnitName: minorUnitName,
        minorUnitId: minorUnitId,
        middleUnitPrice: middleUnitPrice,
        middleUnitName: middleUnitName,
        middleUnitId: middleUnitId,
        groupId: groupId,
        grandUnitPrice: grandUnitPrice,

        grandUnitName: grandUnitName,
        grandUnitId: grandUnitId,
        source: source);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ProductName'] = this.productName;
    data['Notes'] = this.notes;
    data['Source'] = this.source;
    data['GroupId'] = this.groupId;
    data['GroupName'] = this.groupName;
    data['MinorUnitId'] = this.minorUnitId;
    data['MinorUnitName'] = this.minorUnitName;
    data['MinorUnitPrice'] = this.minorUnitPrice;
    data['MiddleUnitId'] = this.middleUnitId;
    data['MiddleUnitName'] = this.middleUnitName;
    data['MiddleUnitPrice'] = this.middleUnitPrice;
    data['GrandUnitId'] = this.grandUnitId;
    data['GrandUnitName'] = this.grandUnitName;
    data['GrandUnitPrice'] = this.grandUnitPrice;
    return data;
  }
}