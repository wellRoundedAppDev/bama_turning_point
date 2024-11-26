import 'package:classic_eccomerce/home/data/models/product.dart';

/// Status : true
/// Message : "تم جلب المنتجات بنجاح."
/// Data : {"TotalItems":1,"PageNumber":1,"PageSize":10,"Products":[{"Id":1,"Name":"freska","Price":67.00,"Model":"noor-proucdt","PhoneNumber":"01274322776","Address":"alex","Odometer":"568","Description":"وصف المنتج","Source":2,"Status":2,"CreatedAt":"2024-11-25T05:15:52.0507033","Username":"01282333934","Images":[{"Id":1,"Url":"/Uploades/085c2571-54fb-4748-b820-5bb2cf71cefb_appstore.png","ProductId":1}]}]}

class GetUsedProductsByClientResponse {
  GetUsedProductsByClientResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetUsedProductsByClientResponse.fromJson(dynamic json) {
    var status = json['Status'];
    var data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    var message = json['Message'];

    return GetUsedProductsByClientResponse(
        status: status, data: data, message: message);
  }
  bool? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['Data'] = data?.toJson();
    }
    return map;
  }
}

/// TotalItems : 1
/// PageNumber : 1
/// PageSize : 10
/// Products : [{"Id":1,"Name":"freska","Price":67.00,"Model":"noor-proucdt","PhoneNumber":"01274322776","Address":"alex","Odometer":"568","Description":"وصف المنتج","Source":2,"Status":2,"CreatedAt":"2024-11-25T05:15:52.0507033","Username":"01282333934","Images":[{"Id":1,"Url":"/Uploades/085c2571-54fb-4748-b820-5bb2cf71cefb_appstore.png","ProductId":1}]}]

class Data {
  Data({
    this.totalItems,
    this.pageNumber,
    this.pageSize,
    this.products,
  });

  factory Data.fromJson(dynamic json) {
    var totalItems = json['TotalItems'];
    var pageNumber = json['PageNumber'];
    var pageSize = json['PageSize'];
    List<UsedProduct>? products;
    if (json['Products'] != null) {
      products = [];
      json['Products'].forEach((v) {
        products?.add(UsedProduct.fromJson(v));
      });
    }

    return Data(
      totalItems: totalItems,
      pageNumber: pageNumber,
      pageSize: pageSize,
      products: products,
    );
  }
  num? totalItems;
  num? pageNumber;
  num? pageSize;
  List<UsedProduct>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TotalItems'] = totalItems;
    map['PageNumber'] = pageNumber;
    map['PageSize'] = pageSize;
    if (products != null) {
      map['Products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Id : 1
/// Name : "freska"
/// Price : 67.00
/// Model : "noor-proucdt"
/// PhoneNumber : "01274322776"
/// Address : "alex"
/// Odometer : "568"
/// Description : "وصف المنتج"
/// Source : 2
/// Status : 2
/// CreatedAt : "2024-11-25T05:15:52.0507033"
/// Username : "01282333934"
/// Images : [{"Id":1,"Url":"/Uploades/085c2571-54fb-4748-b820-5bb2cf71cefb_appstore.png","ProductId":1}]

class UsedProduct {
  UsedProduct({
    this.id,
    this.name,
    this.price,
    this.model,
    this.phoneNumber,
    this.address,
    this.odometer,
    this.description,
    this.source,
    this.status,
    this.createdAt,
    this.username,
    this.images,
  });

  factory UsedProduct.fromJson(dynamic json) {
    var id = json['Id'];
    var name = json['Name'];
    var price = json['Price'];
    var model = json['Model'];
    var phoneNumber = json['PhoneNumber'];
    var address = json['Address'];
    var odometer = json['Odometer'];
    var description = json['Description'];
    var source = json['Source'];
    var status = json['Status'];
    var createdAt = json['CreatedAt'];
    var username = json['Username'];
    List<ProductImage>? images;
    if (json['Images'] != null) {
      images = [];
      json['Images'].forEach((v) {
        images?.add(ProductImage.fromJson(v));
      });
    }

    return UsedProduct(
        status: status,
        id: id,
        images: images,
        createdAt: createdAt,
        username: username,
        source: source,
        description: description,
        odometer: odometer,
        address: address,
        price: price,
        model: model,
        phoneNumber: phoneNumber,
        name: name);
  }
  num? id;
  String? name;
  num? price;
  String? model;
  String? phoneNumber;
  String? address;
  String? odometer;
  String? description;
  num? source;
  num? status;
  String? createdAt;
  String? username;
  List<ProductImage>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Price'] = price;
    map['Model'] = model;
    map['PhoneNumber'] = phoneNumber;
    map['Address'] = address;
    map['Odometer'] = odometer;
    map['Description'] = description;
    map['Source'] = source;
    map['Status'] = status;
    map['CreatedAt'] = createdAt;
    map['Username'] = username;
    if (images != null) {
      map['Images'] = images?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Id : 1
/// Url : "/Uploades/085c2571-54fb-4748-b820-5bb2cf71cefb_appstore.png"
/// ProductId : 1

class ProductImage {
  ProductImage({
    this.id,
    this.url,
    this.productId,
  });

  factory ProductImage.fromJson(dynamic json) {
    var id = json['Id'];
    var url = json['Url'];
    var productId = json['ProductId'];

    return ProductImage(id: id, url: url, productId: productId);
  }
  num? id;
  String? url;
  num? productId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Url'] = url;
    map['ProductId'] = productId;
    return map;
  }
}
